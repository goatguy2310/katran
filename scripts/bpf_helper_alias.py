import argparse
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument("output_file")
args = parser.parse_args()

func_names = subprocess.run(["bpftool", "feature", "list_builtins", "helpers"], capture_output=True, text=True).stdout
name_id = dict()
for i, fun in enumerate(func_names.split("\n")):
    name_id[fun] = i

id_fun = [("none", 0) for i in range(len(name_id))]
with open("/proc/kallsyms", "r") as f:
    for l in f:
        if len(l.split()) < 3:
            continue

        addr, c, fun = l.split()[:3]
        if fun in name_id:
            # print(name_id[fun], fun, addr)
            id_fun[name_id[fun]] = (fun, addr)

with open(args.output_file, "w") as f:
    for id in range(len(id_fun)):
        # print(id, id_fun[id])
        f.write(f"{id} {id_fun[id][0]} {id_fun[id][1]}\n")
