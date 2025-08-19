#include <stdio.h>
#include "vmlinux.h"

#define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)

#define DEFINE_MAP_OPS_OFFSET(file, member)	\
	fprintf(file, "#define "#member "_off %zu\n", offsetof(struct bpf_map_ops, member))

int main(int argc, char *argv[]) {
	if (argc < 2) return 1;
	FILE *f = fopen(argv[1], "w");
	if (!f) return 1;

	fprintf(f, "#ifndef __OFFSET_VMLINUX__\n#define __OFFSET_VMLINUX__\n");

	fprintf(f, "#define BPF_PROG_FUNC_OFF %zu\n", offsetof(struct bpf_prog, bpf_func));
	fprintf(f, "#define BPF_MAP_MAX_OFF %zu\n", offsetof(struct bpf_map, max_entries));
	fprintf(f, "#define BPF_ARR_ESZ_OFF %zu\n", offsetof(struct bpf_array, elem_size));
	fprintf(f, "#define BPF_ARR_VAL_OFF %zu\n", offsetof(struct bpf_array, value));

	fprintf(f, "#define BPF_MAP_OPS_OFF %zu\n", offsetof(struct bpf_map, ops));
	DEFINE_MAP_OPS_OFFSET(f, map_lookup_elem);
	DEFINE_MAP_OPS_OFFSET(f, map_update_elem);
	DEFINE_MAP_OPS_OFFSET(f, map_delete_elem);
	DEFINE_MAP_OPS_OFFSET(f, map_push_elem);
	DEFINE_MAP_OPS_OFFSET(f, map_pop_elem);
	DEFINE_MAP_OPS_OFFSET(f, map_peek_elem);

	fprintf(f, "\n#endif");

	fclose(f);
	return 0;
}

