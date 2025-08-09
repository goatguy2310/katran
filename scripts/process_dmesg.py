from pathlib import Path
import subprocess
import argparse

import json

script_path = Path(__file__).resolve().parent
parent_path = script_path.parent

def log_line_to_dict(line):
    if "EBPF_INFO" not in line:
        return False

    splitted = line.split()
    start_idx = splitted.index("EBPF_INFO:")

    entries = splitted[start_idx + 1:]

    res = dict()
    for e in entries:
        key, value = e.split("=")
        res[key] = value

    return res

parser = argparse.ArgumentParser()

parser.add_argument("pid")
parser.add_argument("log_file")
parser.add_argument("og_bin_path")
parser.add_argument("ld_output")

args = parser.parse_args()

ld_template = script_path / "template.ld"

extern_var = ""
glob_addr = ""
internal_addr = ""
progs = dict()

# extracting the possible symbol names
nm_out = subprocess.run(['nm', args.og_bin_path], capture_output=True, text=True, check=True)
symnames = []

for line in nm_out.stdout.splitlines():
    spl = line.split()
    if len(spl) != 3:
        continue

    if spl[1] not in ["B", "T", "R", "D"]:
        continue

    symnames.append(spl[-1])

def extract_full_sym(nm):
    if len(nm) < 15:
        return nm

    res = None
    matches = [sym for sym in symnames if sym.startswith(nm)]
    if matches:
        res = matches[0]
        symnames.remove(res)
        if len(matches) > 1:
            print(f"WARNING: truncated obj {nm} may have two symbols available")

    return res

# parsing dmesg and writing to templates
with open(ld_template) as f:
    template = f.read()

with open(parent_path / args.log_file, "r") as f:
    for line in reversed(f.read().splitlines()):
        data = log_line_to_dict(line)
        if not data or "pid" not in data:
            continue
    
        if data["pid"] != args.pid and args.pid != "-1":
            continue

        if data["type"] == "map" and len(data["name"]) and not data["name"].startswith("libbpf_"):
            nm = extract_full_sym(data["name"])
            if nm is None:
                continue

            glob_addr += f"\t{nm} = 0x{data['addr']};\n"
        elif data["type"] == "intvar":
            nm = extract_full_sym(data["name"])
            if nm is None:
                continue

            extern_var += f"EXTERN({nm})\n"
            glob_addr += f"\t{nm} = 0x{data['addr']};\n"
        elif data["type"] == "intsec":
            internal_addr += "\t" + data['sec_name'] + " 0x" + data['addr'] + ": { *(" + data['sec_name'] + "*) }\n"
        elif data["type"] == "load_m" and len(data["prog_name"]) and not data["prog_name"].startswith("libbpf_") and data["prog_name"] != "det_arg_ctx":
            nm = extract_full_sym(data["prog_name"])
            if nm is None:
                continue

            prog_type = data["cur_prog_type"]
            if prog_type not in progs:
                progs[prog_type] = []
            entry = (nm, data["prog_addr"])
            if entry not in progs[prog_type]:
                progs[prog_type].append(entry)

script = extern_var + template.replace("GLOB_PLACEHOLDER", glob_addr).replace("INTERNAL_PLACEHOLDER", internal_addr)

# print(script)

with open(args.ld_output, "w") as f:
    f.write(script)

with open(parent_path / "logs/progs_list.txt", "w") as f:
    f.write("\n".join(progs.keys()))

with open(parent_path / "logs/progs_info.json", "w") as f:
    f.write(json.dumps(progs))
