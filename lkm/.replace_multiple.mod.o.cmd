savedcmd_replace_multiple.mod.o := gcc-11 -Wp,-MMD,./.replace_multiple.mod.o.d -nostdinc -I/mnt/kernel_src/arch/x86/include -I/mnt/kernel_src/arch/x86/include/generated -I/mnt/kernel_src/include -I/mnt/kernel_src/include -I/mnt/kernel_src/arch/x86/include/uapi -I/mnt/kernel_src/arch/x86/include/generated/uapi -I/mnt/kernel_src/include/uapi -I/mnt/kernel_src/include/generated/uapi -include /mnt/kernel_src/include/linux/compiler-version.h -include /mnt/kernel_src/include/linux/kconfig.h -include /mnt/kernel_src/include/linux/compiler_types.h -D__KERNEL__ -Werror -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone -mcmodel=kernel -mstack-protector-guard-reg=gs -mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-stack-clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=16 -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wvla-larger-than=1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-4   -fsanitize=kernel-address -fasan-shadow-offset=0xdffffc0000000000   --param asan-instrumentation-with-call-threshold=10000   --param asan-stack=1   --param asan-instrument-allocas=1   --param asan-globals=1    -fsanitize-coverage=trace-pc  -DMODULE  -DKBUILD_BASENAME='"replace_multiple.mod"' -DKBUILD_MODNAME='"replace_multiple"' -D__KBUILD_MODNAME=kmod_replace_multiple -c -o replace_multiple.mod.o replace_multiple.mod.c   ; /mnt/kernel_src/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --no-unreachable --prefix=16  --link  --module replace_multiple.mod.o

source_replace_multiple.mod.o := replace_multiple.mod.c

deps_replace_multiple.mod.o := \
    $(wildcard include/config/MODULE_UNLOAD) \
  /mnt/kernel_src/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /mnt/kernel_src/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /mnt/kernel_src/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/UBSAN_INTEGER_WRAP) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /mnt/kernel_src/include/linux/compiler_attributes.h \
  /mnt/kernel_src/include/linux/compiler-gcc.h \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /mnt/kernel_src/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /mnt/kernel_src/include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  /mnt/kernel_src/include/linux/container_of.h \
  /mnt/kernel_src/include/linux/build_bug.h \
  /mnt/kernel_src/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
    $(wildcard include/config/CFI_CLANG) \
    $(wildcard include/config/64BIT) \
  /mnt/kernel_src/arch/x86/include/generated/asm/rwonce.h \
  /mnt/kernel_src/include/asm-generic/rwonce.h \
  /mnt/kernel_src/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /mnt/kernel_src/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /mnt/kernel_src/include/uapi/linux/types.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/types.h \
  /mnt/kernel_src/include/uapi/asm-generic/types.h \
  /mnt/kernel_src/include/asm-generic/int-ll64.h \
  /mnt/kernel_src/include/uapi/asm-generic/int-ll64.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/bitsperlong.h \
  /mnt/kernel_src/include/asm-generic/bitsperlong.h \
  /mnt/kernel_src/include/uapi/asm-generic/bitsperlong.h \
  /mnt/kernel_src/include/uapi/linux/posix_types.h \
  /mnt/kernel_src/include/linux/stddef.h \
  /mnt/kernel_src/include/uapi/linux/stddef.h \
  /mnt/kernel_src/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/X86_32) \
  /mnt/kernel_src/arch/x86/include/uapi/asm/posix_types_64.h \
  /mnt/kernel_src/include/uapi/asm-generic/posix_types.h \
  /mnt/kernel_src/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /mnt/kernel_src/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /mnt/kernel_src/include/linux/const.h \
  /mnt/kernel_src/include/vdso/const.h \
  /mnt/kernel_src/include/uapi/linux/const.h \
  /mnt/kernel_src/arch/x86/include/asm/barrier.h \
  /mnt/kernel_src/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
    $(wildcard include/config/MITIGATION_ITS) \
    $(wildcard include/config/MITIGATION_RETHUNK) \
  /mnt/kernel_src/include/linux/stringify.h \
  /mnt/kernel_src/include/linux/objtool.h \
    $(wildcard include/config/FRAME_POINTER) \
    $(wildcard include/config/NOINSTR_VALIDATION) \
    $(wildcard include/config/MITIGATION_UNRET_ENTRY) \
    $(wildcard include/config/MITIGATION_SRSO) \
  /mnt/kernel_src/include/linux/objtool_types.h \
  /mnt/kernel_src/arch/x86/include/asm/asm.h \
  /mnt/kernel_src/arch/x86/include/asm/extable_fixup_types.h \
  /mnt/kernel_src/arch/x86/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /mnt/kernel_src/include/linux/instrumentation.h \
  /mnt/kernel_src/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /mnt/kernel_src/include/linux/once_lite.h \
  /mnt/kernel_src/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /mnt/kernel_src/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  /mnt/kernel_src/include/linux/stdarg.h \
  /mnt/kernel_src/include/linux/init.h \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  /mnt/kernel_src/include/linux/kern_levels.h \
  /mnt/kernel_src/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /mnt/kernel_src/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/GENDWARFKSYMS) \
  /mnt/kernel_src/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/MITIGATION_SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
    $(wildcard include/config/UML) \
  /mnt/kernel_src/arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
    $(wildcard include/config/FINEIBT_BHI) \
  /mnt/kernel_src/include/linux/ratelimit_types.h \
  /mnt/kernel_src/include/linux/bits.h \
  /mnt/kernel_src/include/vdso/bits.h \
  /mnt/kernel_src/include/uapi/linux/bits.h \
  /mnt/kernel_src/include/linux/overflow.h \
  /mnt/kernel_src/include/linux/limits.h \
  /mnt/kernel_src/include/uapi/linux/limits.h \
  /mnt/kernel_src/include/vdso/limits.h \
  /mnt/kernel_src/include/uapi/linux/param.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/param.h \
  /mnt/kernel_src/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /mnt/kernel_src/include/uapi/asm-generic/param.h \
  /mnt/kernel_src/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /mnt/kernel_src/arch/x86/include/asm/spinlock_types.h \
  /mnt/kernel_src/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/NR_CPUS) \
  /mnt/kernel_src/include/asm-generic/qrwlock_types.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/byteorder.h \
  /mnt/kernel_src/include/linux/byteorder/little_endian.h \
  /mnt/kernel_src/include/uapi/linux/byteorder/little_endian.h \
  /mnt/kernel_src/include/linux/swab.h \
  /mnt/kernel_src/include/uapi/linux/swab.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/swab.h \
  /mnt/kernel_src/include/linux/byteorder/generic.h \
  /mnt/kernel_src/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /mnt/kernel_src/arch/x86/include/asm/nops.h \
  /mnt/kernel_src/include/asm-generic/barrier.h \
  /mnt/kernel_src/include/linux/stat.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/stat.h \
  /mnt/kernel_src/include/uapi/linux/stat.h \
  /mnt/kernel_src/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /mnt/kernel_src/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /mnt/kernel_src/include/uapi/linux/kernel.h \
  /mnt/kernel_src/include/uapi/linux/sysinfo.h \
  /mnt/kernel_src/include/vdso/cache.h \
  /mnt/kernel_src/arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  /mnt/kernel_src/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /mnt/kernel_src/include/linux/math.h \
  /mnt/kernel_src/arch/x86/include/asm/div64.h \
  /mnt/kernel_src/include/asm-generic/div64.h \
    $(wildcard include/config/CC_OPTIMIZE_FOR_PERFORMANCE) \
  /mnt/kernel_src/include/vdso/math64.h \
  /mnt/kernel_src/include/linux/time64.h \
  /mnt/kernel_src/include/vdso/time64.h \
  /mnt/kernel_src/include/uapi/linux/time.h \
  /mnt/kernel_src/include/uapi/linux/time_types.h \
  /mnt/kernel_src/include/linux/time32.h \
  /mnt/kernel_src/include/linux/timex.h \
  /mnt/kernel_src/include/uapi/linux/timex.h \
  /mnt/kernel_src/arch/x86/include/asm/timex.h \
    $(wildcard include/config/X86_TSC) \
  /mnt/kernel_src/arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/VM86) \
    $(wildcard include/config/X86_USER_SHADOW_STACK) \
    $(wildcard include/config/X86_DEBUG_FPU) \
    $(wildcard include/config/USE_X86_SEG_SUPPORT) \
    $(wildcard include/config/PARAVIRT_XXL) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  /mnt/kernel_src/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/MITIGATION_PAGE_TABLE_ISOLATION) \
  /mnt/kernel_src/arch/x86/include/uapi/asm/processor-flags.h \
  /mnt/kernel_src/include/linux/mem_encrypt.h \
    $(wildcard include/config/ARCH_HAS_MEM_ENCRYPT) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /mnt/kernel_src/arch/x86/include/asm/mem_encrypt.h \
    $(wildcard include/config/X86_MEM_ENCRYPT) \
  /mnt/kernel_src/include/linux/cc_platform.h \
    $(wildcard include/config/ARCH_HAS_CC_PLATFORM) \
  /mnt/kernel_src/arch/x86/include/asm/math_emu.h \
  /mnt/kernel_src/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/IA32_EMULATION) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
  /mnt/kernel_src/arch/x86/include/asm/segment.h \
    $(wildcard include/config/XEN_PV) \
  /mnt/kernel_src/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/PHYSICAL_START) \
    $(wildcard include/config/PHYSICAL_ALIGN) \
    $(wildcard include/config/DYNAMIC_PHYSICAL_MASK) \
  /mnt/kernel_src/include/vdso/page.h \
    $(wildcard include/config/PAGE_SHIFT) \
  /mnt/kernel_src/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/RANDOMIZE_BASE) \
  /mnt/kernel_src/arch/x86/include/asm/kaslr.h \
    $(wildcard include/config/RANDOMIZE_MEMORY) \
  /mnt/kernel_src/arch/x86/include/uapi/asm/ptrace.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/ptrace-abi.h \
  /mnt/kernel_src/arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/ZERO_CALL_USED_REGS) \
    $(wildcard include/config/PARAVIRT_DEBUG) \
  /mnt/kernel_src/arch/x86/include/asm/desc_defs.h \
  /mnt/kernel_src/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/X86_INTEL_MEMORY_PROTECTION_KEYS) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/PROC_FS) \
  /mnt/kernel_src/arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/KMSAN) \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /mnt/kernel_src/arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/SPARSEMEM) \
  /mnt/kernel_src/arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/MITIGATION_CALL_DEPTH_TRACKING) \
    $(wildcard include/config/MITIGATION_IBPB_ENTRY) \
  /mnt/kernel_src/include/linux/static_key.h \
  /mnt/kernel_src/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /mnt/kernel_src/include/linux/cleanup.h \
  /mnt/kernel_src/arch/x86/include/asm/jump_label.h \
    $(wildcard include/config/HAVE_JUMP_LABEL_HACK) \
  /mnt/kernel_src/arch/x86/include/asm/cpufeatures.h \
  /mnt/kernel_src/arch/x86/include/asm/msr-index.h \
  /mnt/kernel_src/arch/x86/include/asm/unwind_hints.h \
  /mnt/kernel_src/arch/x86/include/asm/orc_types.h \
  /mnt/kernel_src/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/CC_HAS_NAMED_AS) \
  /mnt/kernel_src/include/linux/args.h \
  /mnt/kernel_src/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /mnt/kernel_src/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /mnt/kernel_src/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  /mnt/kernel_src/arch/x86/include/asm/asm-offsets.h \
  /mnt/kernel_src/include/generated/asm-offsets.h \
  /mnt/kernel_src/arch/x86/include/asm/GEN-for-each-reg.h \
  /mnt/kernel_src/arch/x86/include/asm/proto.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/ldt.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/sigcontext.h \
  /mnt/kernel_src/arch/x86/include/asm/current.h \
  /mnt/kernel_src/arch/x86/include/asm/cpuid/api.h \
  /mnt/kernel_src/arch/x86/include/asm/cpuid/types.h \
  /mnt/kernel_src/arch/x86/include/asm/string.h \
  /mnt/kernel_src/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /mnt/kernel_src/arch/x86/include/asm/page.h \
  /mnt/kernel_src/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/X86_VSYSCALL_EMULATION) \
  /mnt/kernel_src/include/linux/kmsan-checks.h \
  /mnt/kernel_src/include/linux/range.h \
  /mnt/kernel_src/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
  /mnt/kernel_src/include/linux/pfn.h \
  /mnt/kernel_src/include/asm-generic/getorder.h \
  /mnt/kernel_src/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /mnt/kernel_src/include/linux/bitops.h \
  /mnt/kernel_src/include/linux/typecheck.h \
  /mnt/kernel_src/include/asm-generic/bitops/generic-non-atomic.h \
  /mnt/kernel_src/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/X86_CMOV) \
  /mnt/kernel_src/arch/x86/include/asm/rmwcc.h \
  /mnt/kernel_src/include/asm-generic/bitops/sched.h \
  /mnt/kernel_src/arch/x86/include/asm/arch_hweight.h \
  /mnt/kernel_src/include/asm-generic/bitops/const_hweight.h \
  /mnt/kernel_src/include/asm-generic/bitops/instrumented-atomic.h \
  /mnt/kernel_src/include/linux/instrumented.h \
  /mnt/kernel_src/include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  /mnt/kernel_src/include/asm-generic/bitops/instrumented-lock.h \
  /mnt/kernel_src/include/asm-generic/bitops/le.h \
  /mnt/kernel_src/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /mnt/kernel_src/arch/x86/include/asm/special_insns.h \
  /mnt/kernel_src/include/linux/errno.h \
  /mnt/kernel_src/include/uapi/linux/errno.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/errno.h \
  /mnt/kernel_src/include/uapi/asm-generic/errno.h \
  /mnt/kernel_src/include/uapi/asm-generic/errno-base.h \
  /mnt/kernel_src/include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /mnt/kernel_src/include/linux/irqflags_types.h \
  /mnt/kernel_src/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/DEBUG_ENTRY) \
  /mnt/kernel_src/arch/x86/include/asm/fpu/types.h \
  /mnt/kernel_src/arch/x86/include/asm/vmxfeatures.h \
  /mnt/kernel_src/arch/x86/include/asm/vdso/processor.h \
  /mnt/kernel_src/arch/x86/include/asm/shstk.h \
  /mnt/kernel_src/include/linux/personality.h \
  /mnt/kernel_src/include/uapi/linux/personality.h \
  /mnt/kernel_src/include/linux/err.h \
  /mnt/kernel_src/arch/x86/include/asm/tsc.h \
  /mnt/kernel_src/arch/x86/include/asm/cpufeature.h \
  /mnt/kernel_src/arch/x86/include/generated/asm/cpufeaturemasks.h \
  /mnt/kernel_src/arch/x86/include/asm/msr.h \
  /mnt/kernel_src/arch/x86/include/asm/cpumask.h \
  /mnt/kernel_src/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /mnt/kernel_src/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
  /mnt/kernel_src/include/linux/align.h \
  /mnt/kernel_src/include/vdso/align.h \
  /mnt/kernel_src/include/linux/array_size.h \
  /mnt/kernel_src/include/linux/hex.h \
  /mnt/kernel_src/include/linux/kstrtox.h \
  /mnt/kernel_src/include/linux/minmax.h \
  /mnt/kernel_src/include/linux/sprintf.h \
  /mnt/kernel_src/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /mnt/kernel_src/include/linux/instruction_pointer.h \
  /mnt/kernel_src/include/linux/util_macros.h \
    $(wildcard include/config/FOO_SUSPEND) \
  /mnt/kernel_src/include/linux/wordpart.h \
  /mnt/kernel_src/include/linux/bitmap.h \
  /mnt/kernel_src/include/linux/find.h \
  /mnt/kernel_src/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /mnt/kernel_src/include/uapi/linux/string.h \
  /mnt/kernel_src/include/linux/bitmap-str.h \
  /mnt/kernel_src/include/linux/cpumask_types.h \
  /mnt/kernel_src/include/linux/atomic.h \
  /mnt/kernel_src/arch/x86/include/asm/atomic.h \
  /mnt/kernel_src/arch/x86/include/asm/cmpxchg.h \
  /mnt/kernel_src/arch/x86/include/asm/cmpxchg_64.h \
  /mnt/kernel_src/arch/x86/include/asm/atomic64_64.h \
  /mnt/kernel_src/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /mnt/kernel_src/include/linux/atomic/atomic-long.h \
  /mnt/kernel_src/include/linux/atomic/atomic-instrumented.h \
  /mnt/kernel_src/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /mnt/kernel_src/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
    $(wildcard include/config/SLAB_OBJ_EXT) \
  /mnt/kernel_src/include/linux/numa.h \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /mnt/kernel_src/include/linux/nodemask.h \
    $(wildcard include/config/HIGHMEM) \
  /mnt/kernel_src/include/linux/nodemask_types.h \
    $(wildcard include/config/NODES_SHIFT) \
  /mnt/kernel_src/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /mnt/kernel_src/include/uapi/linux/random.h \
  /mnt/kernel_src/include/uapi/linux/ioctl.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/ioctl.h \
  /mnt/kernel_src/include/asm-generic/ioctl.h \
  /mnt/kernel_src/include/uapi/asm-generic/ioctl.h \
  /mnt/kernel_src/include/linux/irqnr.h \
  /mnt/kernel_src/include/uapi/linux/irqnr.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/msr.h \
  /mnt/kernel_src/arch/x86/include/asm/shared/msr.h \
  /mnt/kernel_src/include/linux/percpu.h \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/PAGE_SIZE_4KB) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /mnt/kernel_src/include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  /mnt/kernel_src/include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  /mnt/kernel_src/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/PREEMPT_LAZY) \
  /mnt/kernel_src/arch/x86/include/asm/preempt.h \
  /mnt/kernel_src/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/CSD_LOCK_WAIT_DEBUG) \
  /mnt/kernel_src/include/linux/smp_types.h \
  /mnt/kernel_src/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /mnt/kernel_src/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/ARCH_HAS_PREEMPT_LAZY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/SH) \
  /mnt/kernel_src/include/linux/restart_block.h \
  /mnt/kernel_src/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/X86_FRED) \
    $(wildcard include/config/COMPAT) \
  /mnt/kernel_src/arch/x86/include/asm/smp.h \
    $(wildcard include/config/DEBUG_NMI_SELFTEST) \
  /mnt/kernel_src/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /mnt/kernel_src/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/SCHED_CLASS_EXT) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/X86_BUS_LOCK_DETECT) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DEBUG_MUTEXES) \
    $(wildcard include/config/DETECT_HUNG_TASK_BLOCKER) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/DEBUG_RSEQ) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/KSTACK_ERASE) \
    $(wildcard include/config/KSTACK_ERASE_METRICS) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/USER_EVENTS) \
  /mnt/kernel_src/include/uapi/linux/sched.h \
  /mnt/kernel_src/include/linux/pid_types.h \
  /mnt/kernel_src/include/linux/sem_types.h \
  /mnt/kernel_src/include/linux/shm.h \
  /mnt/kernel_src/arch/x86/include/asm/shmparam.h \
  /mnt/kernel_src/include/linux/kmsan_types.h \
  /mnt/kernel_src/include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  /mnt/kernel_src/include/linux/osq_lock.h \
  /mnt/kernel_src/include/linux/spinlock_types.h \
  /mnt/kernel_src/include/linux/rwlock_types.h \
  /mnt/kernel_src/include/linux/plist_types.h \
  /mnt/kernel_src/include/linux/hrtimer_types.h \
  /mnt/kernel_src/include/linux/timerqueue_types.h \
  /mnt/kernel_src/include/linux/rbtree_types.h \
  /mnt/kernel_src/include/linux/timer_types.h \
  /mnt/kernel_src/include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  /mnt/kernel_src/include/linux/refcount_types.h \
  /mnt/kernel_src/include/linux/resource.h \
  /mnt/kernel_src/include/uapi/linux/resource.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/resource.h \
  /mnt/kernel_src/include/asm-generic/resource.h \
  /mnt/kernel_src/include/uapi/asm-generic/resource.h \
  /mnt/kernel_src/include/linux/latencytop.h \
  /mnt/kernel_src/include/linux/sched/prio.h \
  /mnt/kernel_src/include/linux/sched/types.h \
  /mnt/kernel_src/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /mnt/kernel_src/include/uapi/linux/signal.h \
  /mnt/kernel_src/arch/x86/include/asm/signal.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/signal.h \
  /mnt/kernel_src/include/uapi/asm-generic/signal-defs.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/siginfo.h \
  /mnt/kernel_src/include/uapi/asm-generic/siginfo.h \
  /mnt/kernel_src/include/linux/syscall_user_dispatch_types.h \
  /mnt/kernel_src/include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
  /mnt/kernel_src/arch/x86/include/asm/tlbbatch.h \
  /mnt/kernel_src/include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_EGRESS) \
    $(wildcard include/config/NET_ACT_MIRRED) \
    $(wildcard include/config/NF_DUP_NETDEV) \
  /mnt/kernel_src/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /mnt/kernel_src/include/linux/posix-timers_types.h \
  /mnt/kernel_src/include/uapi/linux/rseq.h \
  /mnt/kernel_src/include/linux/seqlock_types.h \
  /mnt/kernel_src/include/linux/kcsan.h \
  /mnt/kernel_src/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  /mnt/kernel_src/include/linux/uidgid_types.h \
  /mnt/kernel_src/include/linux/tracepoint-defs.h \
  /mnt/kernel_src/arch/x86/include/generated/asm/kmap_size.h \
  /mnt/kernel_src/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /mnt/kernel_src/include/linux/sched/ext.h \
    $(wildcard include/config/EXT_GROUP_SCHED) \
  /mnt/kernel_src/include/linux/spinlock.h \
  /mnt/kernel_src/include/linux/bottom_half.h \
  /mnt/kernel_src/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /mnt/kernel_src/arch/x86/include/generated/asm/mmiowb.h \
  /mnt/kernel_src/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /mnt/kernel_src/arch/x86/include/asm/spinlock.h \
  /mnt/kernel_src/arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/PARAVIRT_SPINLOCKS) \
  /mnt/kernel_src/arch/x86/include/asm/frame.h \
  /mnt/kernel_src/arch/x86/include/asm/qspinlock.h \
  /mnt/kernel_src/include/asm-generic/qspinlock.h \
  /mnt/kernel_src/arch/x86/include/asm/qrwlock.h \
  /mnt/kernel_src/include/asm-generic/qrwlock.h \
  /mnt/kernel_src/include/linux/rwlock.h \
  /mnt/kernel_src/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /mnt/kernel_src/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /mnt/kernel_src/include/vdso/time32.h \
  /mnt/kernel_src/include/vdso/time.h \
  /mnt/kernel_src/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /mnt/kernel_src/include/linux/highuid.h \
  /mnt/kernel_src/include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  /mnt/kernel_src/include/linux/kmod.h \
  /mnt/kernel_src/include/linux/umh.h \
  /mnt/kernel_src/include/linux/gfp.h \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/CONTIG_ALLOC) \
  /mnt/kernel_src/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/PAGE_BLOCK_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP_PREINIT) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /mnt/kernel_src/include/linux/list_nulls.h \
  /mnt/kernel_src/include/linux/wait.h \
  /mnt/kernel_src/include/linux/seqlock.h \
  /mnt/kernel_src/include/linux/mutex.h \
  /mnt/kernel_src/include/linux/debug_locks.h \
  /mnt/kernel_src/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /mnt/kernel_src/include/linux/page-flags-layout.h \
  /mnt/kernel_src/include/generated/bounds.h \
  /mnt/kernel_src/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/SLAB_FREELIST_HARDENED) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/FUTEX_PRIVATE_HASH) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/SPLIT_PMD_PTLOCKS) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/MM_ID) \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /mnt/kernel_src/include/linux/auxvec.h \
  /mnt/kernel_src/include/uapi/linux/auxvec.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/auxvec.h \
  /mnt/kernel_src/include/linux/kref.h \
  /mnt/kernel_src/include/linux/refcount.h \
  /mnt/kernel_src/include/linux/rbtree.h \
  /mnt/kernel_src/include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /mnt/kernel_src/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /mnt/kernel_src/include/linux/rcutree.h \
  /mnt/kernel_src/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /mnt/kernel_src/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /mnt/kernel_src/include/linux/completion.h \
  /mnt/kernel_src/include/linux/swait.h \
  /mnt/kernel_src/include/linux/uprobes.h \
  /mnt/kernel_src/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /mnt/kernel_src/include/linux/ktime.h \
  /mnt/kernel_src/include/linux/jiffies.h \
  /mnt/kernel_src/include/vdso/jiffies.h \
  /mnt/kernel_src/include/generated/timeconst.h \
  /mnt/kernel_src/include/vdso/ktime.h \
  /mnt/kernel_src/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /mnt/kernel_src/include/linux/clocksource_ids.h \
  /mnt/kernel_src/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /mnt/kernel_src/arch/x86/include/asm/uprobes.h \
  /mnt/kernel_src/include/linux/notifier.h \
  /mnt/kernel_src/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /mnt/kernel_src/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /mnt/kernel_src/include/linux/workqueue_types.h \
  /mnt/kernel_src/include/linux/rcu_segcblist.h \
  /mnt/kernel_src/include/linux/srcutree.h \
  /mnt/kernel_src/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /mnt/kernel_src/include/linux/percpu_counter.h \
  /mnt/kernel_src/arch/x86/include/asm/mmu.h \
    $(wildcard include/config/MODIFY_LDT_SYSCALL) \
    $(wildcard include/config/ADDRESS_MASKING) \
    $(wildcard include/config/BROADCAST_TLB_FLUSH) \
  /mnt/kernel_src/include/linux/page-flags.h \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_2) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_3) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /mnt/kernel_src/include/linux/local_lock.h \
  /mnt/kernel_src/include/linux/local_lock_internal.h \
  /mnt/kernel_src/include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  /mnt/kernel_src/include/linux/memory_hotplug.h \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /mnt/kernel_src/arch/x86/include/generated/asm/mmzone.h \
  /mnt/kernel_src/include/asm-generic/mmzone.h \
  /mnt/kernel_src/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /mnt/kernel_src/include/linux/arch_topology.h \
  /mnt/kernel_src/arch/x86/include/asm/topology.h \
    $(wildcard include/config/X86_LOCAL_APIC) \
    $(wildcard include/config/SCHED_MC_PRIO) \
  /mnt/kernel_src/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/EISA) \
    $(wildcard include/config/X86_MPPARSE) \
  /mnt/kernel_src/arch/x86/include/asm/mpspec_def.h \
  /mnt/kernel_src/arch/x86/include/asm/x86_init.h \
  /mnt/kernel_src/arch/x86/include/asm/apicdef.h \
  /mnt/kernel_src/include/asm-generic/topology.h \
  /mnt/kernel_src/include/linux/cpu_smt.h \
    $(wildcard include/config/HOTPLUG_SMT) \
  /mnt/kernel_src/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /mnt/kernel_src/include/uapi/linux/sysctl.h \
  /mnt/kernel_src/include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /mnt/kernel_src/arch/x86/include/asm/elf.h \
    $(wildcard include/config/X86_X32_ABI) \
  /mnt/kernel_src/arch/x86/include/asm/ia32.h \
  /mnt/kernel_src/include/linux/compat.h \
    $(wildcard include/config/ARCH_HAS_SYSCALL_WRAPPER) \
    $(wildcard include/config/COMPAT_OLD_SIGACTION) \
    $(wildcard include/config/HARDENED_USERCOPY) \
    $(wildcard include/config/ODD_RT_SIGACTION) \
  /mnt/kernel_src/include/linux/sem.h \
  /mnt/kernel_src/include/uapi/linux/sem.h \
  /mnt/kernel_src/include/linux/ipc.h \
  /mnt/kernel_src/include/linux/rhashtable-types.h \
  /mnt/kernel_src/include/uapi/linux/ipc.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/ipcbuf.h \
  /mnt/kernel_src/include/uapi/asm-generic/ipcbuf.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/sembuf.h \
  /mnt/kernel_src/include/linux/socket.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/socket.h \
  /mnt/kernel_src/include/uapi/asm-generic/socket.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/sockios.h \
  /mnt/kernel_src/include/uapi/asm-generic/sockios.h \
  /mnt/kernel_src/include/uapi/linux/sockios.h \
  /mnt/kernel_src/include/linux/uio.h \
    $(wildcard include/config/ARCH_HAS_COPY_MC) \
  /mnt/kernel_src/include/linux/ucopysize.h \
    $(wildcard include/config/HARDENED_USERCOPY_DEFAULT_ON) \
  /mnt/kernel_src/include/uapi/linux/uio.h \
  /mnt/kernel_src/include/uapi/linux/socket.h \
  /mnt/kernel_src/include/uapi/linux/if.h \
  /mnt/kernel_src/include/uapi/linux/libc-compat.h \
  /mnt/kernel_src/include/uapi/linux/hdlc/ioctl.h \
  /mnt/kernel_src/include/linux/fs.h \
    $(wildcard include/config/FANOTIFY_ACCESS_PERMISSIONS) \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  /mnt/kernel_src/include/linux/vfsdebug.h \
    $(wildcard include/config/DEBUG_VFS) \
  /mnt/kernel_src/include/linux/wait_bit.h \
  /mnt/kernel_src/include/linux/kdev_t.h \
  /mnt/kernel_src/include/uapi/linux/kdev_t.h \
  /mnt/kernel_src/include/linux/dcache.h \
  /mnt/kernel_src/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /mnt/kernel_src/include/linux/rculist_bl.h \
  /mnt/kernel_src/include/linux/list_bl.h \
  /mnt/kernel_src/include/linux/bit_spinlock.h \
  /mnt/kernel_src/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /mnt/kernel_src/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /mnt/kernel_src/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /mnt/kernel_src/include/linux/path.h \
  /mnt/kernel_src/include/linux/list_lru.h \
  /mnt/kernel_src/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /mnt/kernel_src/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /mnt/kernel_src/include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /mnt/kernel_src/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  /mnt/kernel_src/arch/x86/include/asm/sync_core.h \
  /mnt/kernel_src/include/linux/sched/coredump.h \
  /mnt/kernel_src/include/linux/radix-tree.h \
  /mnt/kernel_src/include/linux/pid.h \
  /mnt/kernel_src/include/linux/capability.h \
  /mnt/kernel_src/include/uapi/linux/capability.h \
  /mnt/kernel_src/include/linux/semaphore.h \
  /mnt/kernel_src/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /mnt/kernel_src/include/uapi/linux/fcntl.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/fcntl.h \
  /mnt/kernel_src/include/uapi/asm-generic/fcntl.h \
  /mnt/kernel_src/include/uapi/linux/openat2.h \
  /mnt/kernel_src/include/linux/migrate_mode.h \
  /mnt/kernel_src/include/linux/percpu-rwsem.h \
  /mnt/kernel_src/include/linux/rcuwait.h \
  /mnt/kernel_src/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
    $(wildcard include/config/STACK_GROWSUP) \
  /mnt/kernel_src/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
  /mnt/kernel_src/include/linux/sched/jobctl.h \
  /mnt/kernel_src/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /mnt/kernel_src/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  /mnt/kernel_src/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /mnt/kernel_src/include/linux/nospec.h \
  /mnt/kernel_src/arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/CC_HAS_ASM_GOTO_OUTPUT) \
    $(wildcard include/config/CC_HAS_ASM_GOTO_TIED_OUTPUT) \
    $(wildcard include/config/X86_INTEL_USERCOPY) \
  /mnt/kernel_src/include/linux/mmap_lock.h \
  /mnt/kernel_src/arch/x86/include/asm/smap.h \
  /mnt/kernel_src/arch/x86/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  /mnt/kernel_src/arch/x86/include/asm/tlbflush.h \
  /mnt/kernel_src/include/linux/mmu_notifier.h \
  /mnt/kernel_src/include/linux/interval_tree.h \
  /mnt/kernel_src/arch/x86/include/asm/invpcid.h \
  /mnt/kernel_src/arch/x86/include/asm/pti.h \
  /mnt/kernel_src/arch/x86/include/asm/pgtable.h \
    $(wildcard include/config/DEBUG_WX) \
    $(wildcard include/config/HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) \
    $(wildcard include/config/ARCH_HAS_PTE_DEVMAP) \
    $(wildcard include/config/ARCH_SUPPORTS_PMD_PFNMAP) \
    $(wildcard include/config/ARCH_SUPPORTS_PUD_PFNMAP) \
    $(wildcard include/config/HAVE_ARCH_SOFT_DIRTY) \
    $(wildcard include/config/ARCH_ENABLE_THP_MIGRATION) \
    $(wildcard include/config/PAGE_TABLE_CHECK) \
    $(wildcard include/config/X86_SGX) \
  /mnt/kernel_src/arch/x86/include/asm/pkru.h \
  /mnt/kernel_src/arch/x86/include/asm/fpu/api.h \
    $(wildcard include/config/MATH_EMULATION) \
  /mnt/kernel_src/arch/x86/include/asm/coco.h \
  /mnt/kernel_src/include/asm-generic/pgtable_uffd.h \
  /mnt/kernel_src/include/linux/page_table_check.h \
  /mnt/kernel_src/arch/x86/include/asm/pgtable_64.h \
  /mnt/kernel_src/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/PROVIDE_OHCI1394_DMA_INIT) \
    $(wildcard include/config/X86_IO_APIC) \
    $(wildcard include/config/PCI_MMCONFIG) \
    $(wildcard include/config/ACPI_APEI_GHES) \
    $(wildcard include/config/INTEL_TXT) \
  /mnt/kernel_src/arch/x86/include/uapi/asm/vsyscall.h \
  /mnt/kernel_src/include/asm-generic/fixmap.h \
  /mnt/kernel_src/arch/x86/include/asm/pgtable-invert.h \
  /mnt/kernel_src/arch/x86/include/asm/uaccess_64.h \
  /mnt/kernel_src/arch/x86/include/asm/runtime-const.h \
  /mnt/kernel_src/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /mnt/kernel_src/include/linux/cred.h \
  /mnt/kernel_src/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /mnt/kernel_src/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /mnt/kernel_src/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/IOMMUFD) \
    $(wildcard include/config/WATCH_QUEUE) \
  /mnt/kernel_src/include/linux/ratelimit.h \
  /mnt/kernel_src/include/linux/posix-timers.h \
  /mnt/kernel_src/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /mnt/kernel_src/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /mnt/kernel_src/include/linux/hrtimer_defs.h \
  /mnt/kernel_src/include/linux/timerqueue.h \
  /mnt/kernel_src/include/linux/rcuref.h \
  /mnt/kernel_src/include/linux/rcu_sync.h \
  /mnt/kernel_src/include/linux/delayed_call.h \
  /mnt/kernel_src/include/linux/uuid.h \
  /mnt/kernel_src/include/linux/errseq.h \
  /mnt/kernel_src/include/linux/ioprio.h \
  /mnt/kernel_src/include/linux/sched/rt.h \
  /mnt/kernel_src/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /mnt/kernel_src/include/uapi/linux/ioprio.h \
  /mnt/kernel_src/include/linux/fs_types.h \
  /mnt/kernel_src/include/linux/mount.h \
  /mnt/kernel_src/include/linux/mnt_idmapping.h \
  /mnt/kernel_src/include/linux/slab.h \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLUB_TINY) \
    $(wildcard include/config/SLUB_DEBUG) \
    $(wildcard include/config/SLAB_BUCKETS) \
    $(wildcard include/config/KVFREE_RCU_BATCHED) \
  /mnt/kernel_src/include/linux/percpu-refcount.h \
  /mnt/kernel_src/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
  /mnt/kernel_src/include/linux/kasan-enabled.h \
  /mnt/kernel_src/include/linux/kasan-tags.h \
  /mnt/kernel_src/arch/x86/include/asm/kasan.h \
    $(wildcard include/config/KASAN_SHADOW_OFFSET) \
  /mnt/kernel_src/include/linux/pgtable.h \
    $(wildcard include/config/HIGHPTE) \
    $(wildcard include/config/ARCH_HAS_NONLEAF_PMD_YOUNG) \
    $(wildcard include/config/ARCH_HAS_HW_PTE_YOUNG) \
    $(wildcard include/config/GUP_GET_PXX_LOW_HIGH) \
    $(wildcard include/config/ARCH_WANT_PMD_MKWRITE) \
    $(wildcard include/config/HAVE_ARCH_HUGE_VMAP) \
    $(wildcard include/config/X86_ESPFIX64) \
  /mnt/kernel_src/include/linux/rw_hint.h \
  /mnt/kernel_src/include/linux/file_ref.h \
  /mnt/kernel_src/include/linux/unicode.h \
  /mnt/kernel_src/include/uapi/linux/fs.h \
  /mnt/kernel_src/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /mnt/kernel_src/include/uapi/linux/dqblk_xfs.h \
  /mnt/kernel_src/include/linux/dqblk_v1.h \
  /mnt/kernel_src/include/linux/dqblk_v2.h \
  /mnt/kernel_src/include/linux/dqblk_qtree.h \
  /mnt/kernel_src/include/linux/projid.h \
  /mnt/kernel_src/include/uapi/linux/quota.h \
  /mnt/kernel_src/include/uapi/linux/aio_abi.h \
  /mnt/kernel_src/include/uapi/linux/unistd.h \
  /mnt/kernel_src/arch/x86/include/asm/unistd.h \
  /mnt/kernel_src/arch/x86/include/uapi/asm/unistd.h \
  /mnt/kernel_src/arch/x86/include/generated/uapi/asm/unistd_64.h \
  /mnt/kernel_src/arch/x86/include/generated/asm/unistd_64_x32.h \
  /mnt/kernel_src/arch/x86/include/generated/asm/unistd_32_ia32.h \
  /mnt/kernel_src/arch/x86/include/asm/compat.h \
  /mnt/kernel_src/include/linux/sched/task_stack.h \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  /mnt/kernel_src/include/uapi/linux/magic.h \
  /mnt/kernel_src/arch/x86/include/asm/user32.h \
  /mnt/kernel_src/include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  /mnt/kernel_src/arch/x86/include/asm/syscall_wrapper.h \
  /mnt/kernel_src/arch/x86/include/asm/user.h \
  /mnt/kernel_src/arch/x86/include/asm/user_64.h \
  /mnt/kernel_src/arch/x86/include/asm/fsgsbase.h \
  /mnt/kernel_src/arch/x86/include/asm/vdso.h \
  /mnt/kernel_src/include/uapi/linux/elf.h \
  /mnt/kernel_src/include/uapi/linux/elf-em.h \
  /mnt/kernel_src/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /mnt/kernel_src/include/linux/sysfs.h \
  /mnt/kernel_src/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /mnt/kernel_src/include/linux/idr.h \
  /mnt/kernel_src/include/linux/kobject_ns.h \
  /mnt/kernel_src/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  /mnt/kernel_src/include/linux/rbtree_latch.h \
  /mnt/kernel_src/include/linux/error-injection.h \
  /mnt/kernel_src/include/asm-generic/error-injection.h \
  /mnt/kernel_src/include/linux/dynamic_debug.h \
  /mnt/kernel_src/arch/x86/include/asm/module.h \
    $(wildcard include/config/UNWINDER_ORC) \
  /mnt/kernel_src/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
  /mnt/kernel_src/include/linux/export-internal.h \
    $(wildcard include/config/PARISC) \

replace_multiple.mod.o: $(deps_replace_multiple.mod.o)

$(deps_replace_multiple.mod.o):

replace_multiple.mod.o: $(wildcard /mnt/kernel_src/tools/objtool/objtool)
