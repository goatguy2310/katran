import subprocess
import argparse
import struct

parser = argparse.ArgumentParser()

parser.add_argument("bin_file")
parser.add_argument("fn_name")
parser.add_argument("-H", "--header")
parser.add_argument("-o", "--output")

args = parser.parse_args()

# parsing readelf symbols
symbols = subprocess.run(["readelf", "-s", args.bin_file], capture_output=True, text=True, check=True)

func_addr, func_size, sec_idx = None, None, None
for l in symbols.stdout.split("\n"):
    splitted = l.split()
    if len(splitted) >= 8 and splitted[3] == "FUNC" and splitted[4] == "GLOBAL" and splitted[7] == args.fn_name:
        func_addr = int(splitted[1], 16)
        func_size = int(splitted[2])
        sec_idx = splitted[6]

        break

sections = subprocess.run(["readelf", "-S", args.bin_file], capture_output=True, text=True, check=True)

# parsing readelf sections
sec_addr, sec_offset = None, None
for l in sections.stdout.split("\n"):
    splitted = l.split()
    if len(splitted) >= 6 and splitted[1] == f"{sec_idx}]":
        sec_addr = int(splitted[4], 16)
        sec_offset = int(splitted[5], 16)
        
        break

# func VA - sec VA + sec offset
func_offset = func_addr - sec_addr + sec_offset

# read and extract func based on the offset and size
code = None
with open(args.bin_file, "rb") as f:
    f.seek(func_offset)
    code = f.read(func_size)

# packing numbers into bytestrings
header_hex, size_hex = b"", b""
if args.header:
    header_hex = struct.pack("<Q", int(args.header, 16))
size_hex = struct.pack("<Q", func_size)

output = header_hex + size_hex + code
# print(output.hex(" "))
# print(output)

if args.output:
    with open(args.output, "wb") as f:
        f.write(output)
