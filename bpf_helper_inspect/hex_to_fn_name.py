addr_to_name = dict()
with open("/proc/kallsyms") as f:
    for l in f:
        l_splitted = l.split()
        if len(l_splitted) != 3:
            continue
        ad, c, name = l_splitted
        addr_to_name[ad] = name

path_csv = "helper_addr_hex.csv"
counter_file = "counter_hex.txt"

with open("helper_addr_hex.csv", "r") as f:
    text = f.read()

lines = text.split("\n")[1:]
helper_addr = [["" for j in range(300)] for i in range(40)]
for i, l in enumerate(lines):
    helper_addr[i] = dict()

    helpers = l.split(", ")[:-1]
    for j, addr in enumerate(helpers):
        helper_addr[i][j] = addr

max_i, max_j = i, j

ignore = "0" * 16
with open("helper_addr_fn.csv", "w") as f:
    for j in range(max_j + 1):
        f.write(f"{j}, ")

    for i in range(max_i + 1):
        f.write("\n")
        for j in range(max_j + 1):
            # print(i, j)
            addr = helper_addr[i][j]
            if addr == ignore:
                fn_name = "none"
            else:
                fn_name = addr_to_name[addr]
            f.write(f"{fn_name}, ")

res = ""
for j in range(max_j + 1):
    counter = dict()
    for i in range(max_i + 1):
        addr = helper_addr[i][j]
        if addr == ignore:
            continue
        fn_name = addr_to_name[addr]
        counter[fn_name] = counter.get(fn_name, 0) + 1
    res += f"id {j}: {counter}\n"

with open("counter_fn.txt", "w") as f:
    f.write(res)
