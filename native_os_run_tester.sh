#!/usr/bin/env bash

 # Copyright (C) 2018-present, Facebook, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation; version 2 of the License.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

log() {
	echo "-- os_run_tester.sh: $@"
}

set -eo pipefail

NCPUS=$(nproc)
PROG_TYPE=-1

# By default this script assumes to be invoked from the root dir.
if [ -z "${KATRAN_BUILD_DIR}" ]
then
	KATRAN_BUILD_DIR=$(pwd)/_build/build
fi

if [ -z "${DEPS_DIR}" ]
then
	DEPS_DIR=$(pwd)/_build/deps
fi

capture_dmesg_logs() {
	mkdir -p logs
	DMESG_LOG="logs/dmesg_logs.txt"

	log "Starting dmesg capture"

	rm -rf $DMESG_LOG
	dmesg -W > $DMESG_LOG &
	DMESG_PID=$!

	log "Starting katran tester..."

	# sudo sh -c "${KATRAN_BUILD_DIR}/katran/lib/testing/katran_tester -balancer_prog ${DEPS_DIR}/bpfprog/bpf/balancer.bpf.o -test_from_fixtures=true $1"
	$KATRAN_BUILD_DIR/katran/lib/testing/katran_tester -balancer_prog $DEPS_DIR/bpfprog/bpf/balancer.bpf.o -perf_testing=true -wait_phases=true $1 &
	KAT_PID=$!

	sleep 1

	log "Message captured at $DMESG_LOG"
	kill $DMESG_PID
}

process_linker_script_and_progs() {
	mkdir -p $DEPS_DIR/bpfprog/.linker_scripts
	python3 scripts/process_dmesg.py $KAT_PID $DMESG_LOG $DEPS_DIR/bpfprog/bpf/balancer.bpf.o $DEPS_DIR/bpfprog/.linker_scripts/balancer.bpf.ld
	PROG_TYPE=$(cat logs/progs_list.txt)
	log "ello $PROG_TYPE $KAT_PID"
	log "Linker script saved at .linker_scripts/balancer.bpf.ld"
}

process_header_override() {
	python3 scripts/fn_name_to_hex.py

	# generate header override
	HDR_DIR=$DEPS_DIR/bpfprog/.header_override/$PROG_TYPE/katran/lib/linux_includes/

	log "Generating header overrides for BPF helpers..."
	rm -rf $HDR_DIR
	mkdir -p $HDR_DIR

	cp scripts/bpf.h $HDR_DIR/bpf.h
	python3 scripts/modify_header.py scripts/bpf_helpers.h $HDR_DIR/bpf_helpers.h $PROG_TYPE scripts/prog_helper_addr.csv
	log "Header overrides written at $HDR_DIR/bpf_helpers.h"
}

generate_native_code() {
	(cd $DEPS_DIR/bpfprog/ && make bpf/native/balancer.bpf PROG_TYPE=$PROG_TYPE -j$NCPUS)
}

replace_with_kernel_module() {
	MODULE_NAME=replace_multiple
	if [ ! -f lkm/$MODULE_NAME.ko ]; then
		(cd lkm && make)
		log "Compiling kernel module..."
	fi

	log "Starting kernel module..."
	insmod lkm/$MODULE_NAME.ko

	BIN_PATH=$DEPS_DIR/bpfprog/bpf/native/balancer.bpf
	python3 scripts/extract_funcs_from_bin_type.py $BIN_PATH $PROG_TYPE -o scripts/func.out

	cat scripts/func.out > /sys/kernel/debug/bpf_replace/prog_to_replace
	sleep 0.5
}

capture_dmesg_logs
process_linker_script_and_progs
process_header_override
generate_native_code
replace_with_kernel_module

log "Replacing module finished! Press any key to continue to benchmarking"
read -n 1 -s -r

kill -SIGUSR1 $KAT_PID

log "Press any key to end now"
read -n 1 -s -r

log "Stopping..."
rmmod $MODULE_NAME
kill -SIGUSR2 $KAT_PID
