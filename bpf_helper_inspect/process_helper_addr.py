from pathlib import Path
import argparse

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
        kv = e.split("=")
        if len(kv) != 2:
               continue
        key, value = kv
        res[key] = value

    return res

parser = argparse.ArgumentParser()

parser.add_argument("prog")
parser.add_argument("pid")
parser.add_argument("log_file")

args = parser.parse_args()

max_prog_type = 0
max_helper_id = 0
helper_addr = [["" for j in range(300)] for i in range(40)]

with open(args.log_file, "r") as f:
    for line in f:
        data = log_line_to_dict(line)
        if not data:
            continue

        if data["type"] == "map_log":
            prog_type = int(data["prog_type"])
            helper_id = int(data["helper_id"])
            helper_addr[prog_type][helper_id] = data["addr"]

            max_prog_type = max(max_prog_type, prog_type)
            max_helper_id = max(max_helper_id, helper_id)

with open("helper_addr_hex.csv", "w") as f:
    for j in range(max_helper_id + 1):
        f.write(f"{j}, ")

    for i in range(max_prog_type + 1):
        f.write("\n")
        for j in range(max_helper_id + 1):
            addr = helper_addr[i][j]
            if len(addr) == 0:
                addr = "0" * 16
            f.write(f"{addr}, ")

res = ""
for j in range(max_helper_id + 1):
    counter = dict()
    for i in range(max_prog_type + 1):
        addr = helper_addr[i][j]
        if len(addr) == 0:
            continue
        counter[addr] = counter.get(addr, 0) + 1
    res += f"id {j}: {counter}\n"

with open("counter_hex.txt", "w") as f:
    f.write(res)
