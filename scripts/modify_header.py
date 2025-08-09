import argparse
import subprocess

parser = argparse.ArgumentParser()

parser.add_argument("def_file")
parser.add_argument("output_file")
parser.add_argument("prog_type")
parser.add_argument("table_file")

args = parser.parse_args()

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
    for j, addr in enumerate(helpers):
        fn_to_addr[alias[j]] = addr

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

with open(args.output_file, "w") as f:
    f.write(res)
