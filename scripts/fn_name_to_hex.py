from pathlib import Path

script_path = Path(__file__).resolve().parent
parent_path = script_path.parent

name_to_addr = dict()
with open("/proc/kallsyms") as f:
    for l in f:
        l_splitted = l.split()
        if len(l_splitted) != 3:
            continue
        ad, c, name = l_splitted
        name_to_addr[name] = ad

path_csv = parent_path / "bpf_helper_inspect" / "helper_addr_fn.csv"

with open(path_csv, "r") as f:
    text = f.read()

lines = text.split("\n")[1:]
helper_addr = [["" for j in range(300)] for i in range(40)]
for i, l in enumerate(lines):
    helper_addr[i] = dict()

    helpers = l.split(", ")[:-1]
    for j, fn_name in enumerate(helpers):
        helper_addr[i][j] = fn_name

max_i, max_j = i, j

with open(script_path / "prog_helper_addr.csv", "w") as f:
    for j in range(max_j + 1):
        f.write(f"{j}, ")

    for i in range(max_i + 1):
        f.write("\n")
        for j in range(max_j + 1):
            # print(i, j)
            fn_name = helper_addr[i][j]
            if fn_name == "none":
                addr = "0" * 16
            else:
                addr = name_to_addr[fn_name]
            f.write(f"{addr}, ")
