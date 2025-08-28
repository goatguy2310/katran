#!/usr/bin/env bash

DEPS_DIR=$(pwd)/_build/deps

cat dumps/bpf_jit_xdp.txt | grep -E '^\s*[0-9a-f]+:' | sed 's/^[[:space:]]*[0-9a-f]*:[[:space:]]*//' | llvm-mca -mcpu=generic | head -n $1

llvm-mca -mcpu=generic $DEPS_DIR/bpfprog/bpf/native/balancer.bpf.s | head -n $1
