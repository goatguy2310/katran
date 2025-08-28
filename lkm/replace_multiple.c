#include <linux/kernel.h>
#include <linux/filter.h>
#include <linux/module.h>
#include <linux/debugfs.h>
#include <linux/uaccess.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/bpf.h>
#include <linux/rcupdate.h>
#include <linux/vmalloc.h>
#include <linux/mutex.h>
#include <asm/set_memory.h>

void *bpf_jit_alloc_exec(unsigned long size);
void bpf_jit_free_exec(void *addr);

void set_vm_flush_reset_perms(void *addr);
int set_memory_rox(unsigned long addr, int numpages);

struct bpf_file_replace_header {
	u32 code_size;
};

struct bpf_file_replace_info {
	void *kmem;
	u32 start_prog_idx; // inclusive
	u32 end_prog_idx; // exclusive
};

struct bpf_prog_replace_header {
	u64 bpf_prog_addr;
	u32 offset;
	u32 code_size;
};

struct bpf_prog_replace_info {
	void *old_bpf_func;
	u32 old_jited_len;
	struct bpf_prog *targ_prog;
};


#define MAX_FILE_REPLACEMENT 32
static u32 rfile_idx = 0;
static struct bpf_file_replace_info rfile_infos[MAX_FILE_REPLACEMENT];

#define MAX_PROG_REPLACEMENT 32
static u32 rprog_idx = 0;
static struct bpf_prog_replace_info rprog_infos[MAX_PROG_REPLACEMENT];

static DEFINE_MUTEX(replace_mutex);

static struct dentry *replace_dir; 

static ssize_t bpf_replace_write(struct file *fp, const char *buf, size_t count, loff_t *off) {
	int ret = 0;

	mutex_lock(&replace_mutex);
	
	if (rfile_idx >= MAX_FILE_REPLACEMENT) {
		pr_warn("bpf_replace: reached maximum file replacement (%u)\n", MAX_FILE_REPLACEMENT);
		ret = -ENOSPC;
		goto out;
	}

	if (rprog_idx >= MAX_PROG_REPLACEMENT) {
		pr_warn("bpf_replace: reached maximum prog replacement (%u)\n", MAX_PROG_REPLACEMENT);
		ret = -ENOSPC;
		goto out;
	}
	
	size_t total = 0; /* total accumulated bytes */

	struct bpf_file_replace_header fheader;
	size_t fheader_size = sizeof(fheader);

	struct bpf_prog_replace_header pheader;
	size_t pheader_size = sizeof(pheader);

	u32 code_size_aligned;
	void *kmem;

	u32 progs_to_replace = 0;
	struct bpf_prog *prog;

	/* copying header */
	ret = copy_from_user(&fheader, buf, fheader_size);
	if (ret) {
		pr_err("bpf_replace: failed to copy file header\n");
		ret = -EFAULT;
		goto out;
	}
	total += fheader_size;

	/* copying code */
	code_size_aligned = round_up(fheader.code_size, PAGE_SIZE);
	pr_info("bpf_replace: (f=%u) trying to allocate %u (%u)\n", rfile_idx, fheader.code_size, code_size_aligned);

	kmem = bpf_jit_alloc_exec(code_size_aligned);	
	if (!kmem) {
		pr_err("bpf_replace: cannot allocate memory for new file\n");
		ret = -ENOMEM;
		goto out;
	}

	ret = copy_from_user(kmem, buf + total, fheader.code_size);
	if (ret) {
		pr_err("bpf_replace: failed to copy program to new memory\n");
		goto out_free;
	}
	total += fheader.code_size;

	/* setting code memory perm to RO+X */
	set_vm_flush_reset_perms(kmem);
	ret = set_memory_rox((unsigned long) kmem, code_size_aligned >> PAGE_SHIFT);
	if (ret) {
		pr_err("bpf_replace: failed to set file to ROX\n");
		goto out_free;
	}
	rfile_infos[rfile_idx].kmem = kmem;
	pr_info("bpf_replace: (f=%u) code memory finalized at %px and size %u (%u)\n", rfile_idx, kmem, fheader.code_size, code_size_aligned);

	/* copying prog headers */
	ret = copy_from_user(&progs_to_replace, buf + total, sizeof(progs_to_replace));
	if (ret) {
		pr_err("bpf_replace: failed to copy prog number\n");
		goto out_free;
	}
	total += sizeof(progs_to_replace);

	rfile_infos[rfile_idx].start_prog_idx = rprog_idx;
	for (; rprog_idx < rfile_infos[rfile_idx].start_prog_idx + progs_to_replace; rprog_idx++) {
		ret = copy_from_user(&pheader, buf + total, pheader_size);
		if (ret) {
			pr_err("bpf_replace: failed to copy prog header\n");
			goto out_free;
		}

		if (pheader.offset + pheader.code_size > fheader.code_size) {
			pr_err("bpf_replace: offset + code_size out of range\n");
			ret = -EINVAL;
			goto out_free;
		}
		total += pheader_size;

		prog = (struct bpf_prog *) pheader.bpf_prog_addr;
		pr_info("bpf_replace: (%u) hooking bpf_prog at addr 0x%llx and name %s\n", rprog_idx, pheader.bpf_prog_addr, prog->aux->name);	

		pr_info("bpf_replace: replacing func 0x%px, len %u\n", prog->bpf_func, prog->jited_len);

		rprog_infos[rprog_idx].old_bpf_func = prog->bpf_func;
		rprog_infos[rprog_idx].old_jited_len = prog->jited_len;
		rprog_infos[rprog_idx].targ_prog = prog;

		/* updating kallsyms */
		bpf_prog_kallsyms_del(prog);
		INIT_LIST_HEAD_RCU(&prog->aux->ksym.lnode);
		memset(&prog->aux->ksym.tnode, 0, sizeof(struct latch_tree_node));
		synchronize_rcu();

		prog->bpf_func = kmem + pheader.offset;
		prog->jited_len = pheader.code_size;
		
		bpf_prog_kallsyms_add(prog);

		pr_info("bpf_replace: success with new func 0x%px, len %u\n", prog->bpf_func, prog->jited_len);
	}
	rfile_infos[rfile_idx].end_prog_idx = rprog_idx;
	rfile_idx++;

	synchronize_rcu();
	ret = count;
	goto out;

out_free:
	while(rprog_idx > rfile_infos[rfile_idx].start_prog_idx) {
		rprog_idx--;

		rprog_infos[rprog_idx].targ_prog->bpf_func = rprog_infos[rprog_idx].old_bpf_func;
		rprog_infos[rprog_idx].targ_prog->jited_len = rprog_infos[rprog_idx].old_jited_len;
	}
	bpf_jit_free_exec(kmem);
out:
	if (ret < 0) {
		pr_err("bpf_replace: error code %d\n", ret);
	}
	mutex_unlock(&replace_mutex);
	return ret;
}

static const struct file_operations bpf_replace_fops = {
	.write = bpf_replace_write,
};

static int __init replace_init(void) {
	replace_dir = debugfs_create_dir("bpf_replace", NULL);
	if (!replace_dir) return -1;
	debugfs_create_file("prog_to_replace", 0666, replace_dir, NULL, &bpf_replace_fops);
	pr_info("bpf_replace: module loaded, file created at bpf_replace/prog_to_replace\n");
	return 0;
}

static void __exit replace_cleanup(void) {
	pr_info("bpf_replace: exiting module and restoring programs (%u %u)\n", rprog_idx, rfile_idx);
	mutex_lock(&replace_mutex);

	/*
	while (rprog_idx > 0) {
		rprog_idx--;
		
		struct bpf_prog_replace_info *info = &rprog_infos[rprog_idx];
		pr_info("bpf_replace: (%u) restoring 0x%px and name %s\n", rprog_idx, info->targ_prog, info->targ_prog->aux->name);

		info->targ_prog->bpf_func = info->old_bpf_func;
		info->targ_prog->jited_len = info->old_jited_len;
	}

	synchronize_rcu();

	while (rfile_idx > 0) {
		rfile_idx--;

		struct bpf_file_replace_info *info = &rfile_infos[rfile_idx];
		pr_info("bpf_replace: freeing memory at 0x%px\n", info->kmem);
		bpf_jit_free_exec(info->kmem);
	}
	*/

	u32 idx;
	while (rfile_idx > 0) {
		rfile_idx--;

		struct bpf_file_replace_info *info = &rfile_infos[rfile_idx];
		
		idx = info->end_prog_idx;
		while (idx > info->start_prog_idx) {
			idx--;

			struct bpf_prog_replace_info *pinfo = &rprog_infos[idx];
			pr_info("bpf_replace: (%u) restoring 0x%px and name %s with old func at %px\n", idx, pinfo->targ_prog, pinfo->targ_prog->aux->name, pinfo->old_bpf_func);

			struct bpf_prog *prog = pinfo->targ_prog;
			
			bpf_prog_kallsyms_del(prog);
			INIT_LIST_HEAD_RCU(&prog->aux->ksym.lnode);
			memset(&prog->aux->ksym.tnode, 0, sizeof(struct latch_tree_node));
			synchronize_rcu();

			prog->bpf_func = pinfo->old_bpf_func;
			prog->jited_len = pinfo->old_jited_len;	
		
			bpf_prog_kallsyms_add(prog);
		}

		pr_info("bpf_replace: (f=%u) freeing memory at 0x%px\n", rfile_idx, info->kmem);
		bpf_jit_free_exec(info->kmem);
	}

	synchronize_rcu();

	mutex_unlock(&replace_mutex);
	debugfs_remove_recursive(replace_dir);
}

module_init(replace_init);
module_exit(replace_cleanup);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Replace a current running BPF program's native code with a newly allocated code");
