import argparse
import subprocess

parser = argparse.ArgumentParser()

parser.add_argument("def_file")
parser.add_argument("output_file")
parser.add_argument("prog_type")
parser.add_argument("table_file")

args = parser.parse_args()

# extract kallsyms
kallsyms_to_addr = dict()
with open("/proc/kallsyms") as f:
    for l in f:
        l_splitted = l.split()
        if len(l_splitted) != 3:
            continue
        ad, c, name = l_splitted
        kallsyms_to_addr[name] = ad

# extract bpf helper id and alias
func_names = subprocess.run(["bpftool", "feature", "list_builtins", "helpers"], capture_output=True, text=True).stdout
alias = []
for fun in func_names.split("\n"):
    alias.append(fun)

# create map from alias to addr
fn_to_addr = dict()
with open(args.table_file, "r") as f:
    lines = f.read().split("\n")[1:]
    helpers = lines[int(args.prog_type)].split(", ")
    for j, sym in enumerate(helpers):
        fn_to_addr[alias[j]] = kallsyms_to_addr.get(sym, "0")

# modify header with rule alias -> addr
res = ""

with open(args.def_file, "r") as f:
    for l in f:
        pref = "BPF_FUNC"
        name_start = l.find(pref)
        if name_start == -1 or len(l) == 0 or l.strip()[-1] != ";":
            res += l
            continue

        pre, last = l[:name_start], l[name_start + len(pref):].strip()
        name = "bpf" + last[:-1]

        res += f"{pre}0x{fn_to_addr[name]};\n"

# insert kallsyms to macros
def insert_to_macros(sym):
    global res
    res = res.replace(f"<{sym}>", f"0x{kallsyms_to_addr[sym]}")

insert_to_macros("cpu_number")
insert_to_macros("this_cpu_off")

with open(args.output_file, "w") as f:
    f.write(res)
