from pathlib import Path
import subprocess
import argparse
import struct
import json

script_path = Path(__file__).resolve().parent
parent_path = script_path.parent

parser = argparse.ArgumentParser()

parser.add_argument("bin_file")
parser.add_argument("prog_type")
parser.add_argument("-o", "--output")

args = parser.parse_args()

with open(parent_path / "logs/progs_info.json", "r") as f:
    progs_all = json.loads(f.read())
    progs = progs_all[args.prog_type]

# all_prog_names = []
# for ptype, pgs in progs_all:
#    all_prog_names.extend([p[0] for p in pgs])

prog_names = [p[0] for p in progs]
prog_addr = dict([p[:2] for p in progs])

# parsing readelf symbols
symbols = subprocess.run(["readelf", "-s", args.bin_file], capture_output=True, text=True, check=True)

func_addr, func_size, sec_idx = dict(), dict(), dict()
for l in symbols.stdout.split("\n"):
    splitted = l.split()
    if len(splitted) >= 8 and splitted[3] == "FUNC" and splitted[4] == "GLOBAL" and splitted[7] in prog_names:
        pname = splitted[7]
        func_addr[pname] = int(splitted[1], 16)
        func_size[pname] = int(splitted[2])
        sec_idx[pname] = splitted[6]

sections = subprocess.run(["readelf", "-S", args.bin_file], capture_output=True, text=True, check=True)

# parsing readelf sections
sec_data = dict()
for l in sections.stdout.split("\n"):
    splitted = l.split()
    if len(splitted) >= 6 and splitted[0] == "[":
        sidx = splitted[1][:-1]

        # -sec VA + sec offset
        sec_data[sidx] = -int(splitted[4], 16) + int(splitted[5], 16)

# func VA - sec VA + sec offset
func_offset = dict()
for pname in prog_names:
    sidx = sec_idx[pname]

    func_offset[pname] = func_addr[pname] + sec_data[sidx]

# read and extract func based on the offset and size
elf_bin = None
cur_offset = 0
with open(args.bin_file, "rb") as f:
    elf_bin = bytearray(f.read())

# packing numbers into bytestrings
prog_size_hex = struct.pack("<I", len(elf_bin))

# packing all prog (of specified type only) metadata to bytestrings
progs_hex = struct.pack("<I", len(prog_names))
for pname in prog_names:
    # for each prog, bpf_prog addr, offset, and code_size
    progs_hex += struct.pack("<Q", int(prog_addr[pname], 16)) + struct.pack("<I", func_offset[pname]) + struct.pack("<I", func_size[pname])
    
    # modifying the nop insns so that it fits kernel's convention
    elf_bin[func_offset[pname] + 8] = 0x00
    print(elf_bin[func_offset[pname]:func_offset[pname] + 20].hex(" "))

output = prog_size_hex + elf_bin + progs_hex
# print(output.hex(" "))
# print(output)

if args.output:
    with open(args.output, "wb") as f:
        f.write(output)
