import os
import numpy as np
import matplotlib.pyplot as plt

jit_output = "logs/kat_perf_output.txt"
nat_output = "logs/native_kat_perf_output.txt"

freq_ghz = 2.4

if not os.path.exists(jit_output):
    print(f"{jit_output} not found")
    exit()

if not os.path.exists(nat_output):
    print(f"{nat_output} not found")
    exit()

os.makedirs("figures/", exist_ok=True)

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

bar_width = 0.3
x = np.arange(cnt)

plt.figure(figsize=(20, 5))

plt.bar(x - 0.5 * bar_width, np.ceil(np.array(jit_res) * freq_ghz).astype(int), bar_width, label="JIT", color="crimson")
plt.bar(x + 0.5 * bar_width, np.ceil(np.array(nat_res) * freq_ghz).astype(int), bar_width, label="LLVM Native", color="salmon")

plt.xticks(x, np.arange(1, cnt + 1))
plt.xlabel("Test case")
plt.ylabel("Time per packet (Cycles)")
plt.title("Comparison between JIT and LLVM Native code's performance on Katran perf testsuite (Lower is better)")
plt.legend()
plt.tight_layout()
plt.savefig("figures/kat_perf_test_time.png")
