#!/bin/bash

log() {
	echo "-- run.sh: $@"
}

DMESG_LOG="dmesg_logs.txt"

if [ ! -f ../.loader_output/$1 ]; then
	log "No loader at .loader_output/$1"
	exit 1
fi

log "Starting dmesg capture"

dmesg -W > $DMESG_LOG &
DMESG_PID=$!

sudo setcap cap_sys_admin,cap_bpf+eip ./../.loader_output/$1
sudo ./../.loader_output/$1 &>/dev/null &
BIN_PID=$!

log "Starting program $1 with PID=$BIN_PID"

# tail -n 0 -f $DMESG_LOG | grep -q -m 1 "EBPF_INFO: type=load_end pid=$BIN_PID" 

sleep 2
kill $DMESG_PID
kill $BIN_PID

log "Message captured at $DMESG_LOG!!"
log "Running helper addr collection and counter..."

python3 process_helper_addr.py $1 $BIN_PID $DMESG_LOG 

log "Helper addr saved at helper_addr_hex.csv and counter_hex.txt"

log "Converting hex to fn_name with /proc/kallsyms..."

python3 hex_to_fn_name.py

log "Results saved at helper_addr_fn.csv and counter_fn.txt!"
