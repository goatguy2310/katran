import os

jit_output = "logs/kat_perf_output.txt"
nat_output = "logs/native_kat_perf_output.txt"

if not os.path.exists(jit_output):
    print(f"{jit_output} not found")
    exit()

if not os.path.exists(nat_output):
    print(f"{nat_output} not found")
    exit()

def after_second_comma(s):
    return ",".join(s.split(",")[2:])[:-1]

desc = []
jit_res = []
with open(jit_output) as f:
    for l in f:
        spl = l.split(",")
        jit_res.append(int(spl[0]))
        desc.append(after_second_comma(l))

nat_res = []
with open(nat_output) as f:
    for l in f:
        spl = l.split(",")
        nat_res.append(int(spl[0]))

cnt = len(jit_res)
ratio_sum = 0

print(f"Test {'JIT Time':>17} {'Native time':>17} {'Ratio':>14}       {'Desc'}")
print("-" * 150)
for i in range(len(jit_res)):
    ratio = nat_res[i] / jit_res[i]
    ratio_sum += ratio
    print(f"{i + 1:<4} {jit_res[i]:>10}ns/pckt {nat_res[i]:>10}ns/pckt {ratio:>14.3f}%      {desc[i]}")

print("-" * 150)
print(f"{'Summary':8} {sum(jit_res) / cnt:>10.3f}ns/pckt {sum(nat_res) / cnt:>10.3f}ns/pckt {sum(nat_res) / sum(jit_res):>10.3f}%")
