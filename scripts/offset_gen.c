#include <stdio.h>
#include "vmlinux.h"

#define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)

int main(int argc, char *argv[]) {
	if (argc < 2) return 1;
	FILE *f = fopen(argv[1], "w");
	if (!f) return 1;

	fprintf(f, "#ifndef __OFFSET_VMLINUX__\n#define __OFFSET_VMLINUX__\n");

	fprintf(f, "#define BPF_PROG_FUNC_OFF %zu\n", offsetof(struct bpf_prog, bpf_func));
	fprintf(f, "#define BPF_MAP_MAX_OFF %zu\n", offsetof(struct bpf_map, max_entries));
	fprintf(f, "#define BPF_ARR_ESZ_OFF %zu\n", offsetof(struct bpf_array, elem_size));
	fprintf(f, "#define BPF_ARR_VAL_OFF %zu\n", offsetof(struct bpf_array, value));

	fprintf(f, "#endif");

	fclose(f);
	return 0;
}

