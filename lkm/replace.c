#include <linux/kernel.h>
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

struct bpf_replace_header {
	u64 bpf_prog_addr;
	u64 code_size;
};

struct bpf_prog_replace_info {
	void *new_bpf_func;
	void *old_bpf_func;
	u32 old_jited_len;
	struct bpf_prog *targ_prog;
};

#define MAX_REPLACEMENT 32
static u32 rprog_idx = 0;
static struct bpf_prog_replace_info rprog_infos[MAX_REPLACEMENT];

static DEFINE_MUTEX(replace_mutex);

static struct dentry *replace_dir; 

static ssize_t bpf_replace_write(struct file *fp, const char *buf, size_t count, loff_t *off) {
	int ret = 0;

	mutex_lock(&replace_mutex);
	
	if (rprog_idx >= MAX_REPLACEMENT) {
		pr_warn("bpf_replace: maximum bpf programs replacement reached (%u)\n", MAX_REPLACEMENT);
		ret = -ENOSPC;
		goto out;
	}
	
	struct bpf_replace_header header;
	size_t header_size = sizeof(header);
	void *new_bpf_func;
	struct bpf_prog *prog;

	u32 code_size_aligned;

	if (count < header_size) {
		pr_err("bpf_replace: write too small\n");
		ret = -EINVAL;
		goto out;
	}

	/* copy only the header, the rest (code) still stay in buf */
	if (copy_from_user(&header, buf, header_size)) {
		pr_err("bpf_replace: failed to copy program from user\n");
		ret = -EFAULT;
		goto out;
	}

	if (count != header_size + header.code_size) {
		pr_err("bpf_replace: size mismatched\n");
		ret = -EINVAL;
		goto out;
	}

	prog = (struct bpf_prog *) header.bpf_prog_addr;
	pr_info("bpf_replace: hooking bpf_prog at addr 0x%llx and name %s\n", header.bpf_prog_addr, prog->aux->name);

	code_size_aligned = round_up(header.code_size, PAGE_SIZE);
	new_bpf_func = bpf_jit_alloc_exec(code_size_aligned);
	if (!new_bpf_func) {
		pr_err("bpf_replace: cannot allocate memory for new func\n");
		ret = -ENOMEM;
		goto out;
	}

	if (copy_from_user(new_bpf_func, buf + header_size, header.code_size)) {
		pr_err("bpf_replace: failed to copy program to new memory\n");
		bpf_jit_free_exec(new_bpf_func);
		ret = -EFAULT;
		goto out;
	}

	set_vm_flush_reset_perms(new_bpf_func);
	if (set_memory_rox((unsigned long) new_bpf_func, code_size_aligned >> PAGE_SHIFT)) {
		pr_err("bpf_replace: failed to set program to ROX\n");
		bpf_jit_free_exec(new_bpf_func);
		ret = -EFAULT;
		goto out;
	}

	pr_info("bpf_replace: replacing func 0x%px, len %u\n", prog->bpf_func, prog->jited_len);

	rprog_infos[rprog_idx].new_bpf_func = new_bpf_func;
	rprog_infos[rprog_idx].old_bpf_func = prog->bpf_func;
	rprog_infos[rprog_idx].old_jited_len = prog->jited_len;
	rprog_infos[rprog_idx].targ_prog = prog;

	prog->bpf_func = new_bpf_func;
	prog->jited_len = header.code_size;

	synchronize_rcu();

	pr_info("bpf_replace: success with new func 0x%px, len %u\n", prog->bpf_func, prog->jited_len);
	rprog_idx++;
	ret = count;

out:
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
	pr_info("bpf_replace: module loaded, file created at bpf_replace/prog_to_replace");
	return 0;
}

static void __exit replace_cleanup(void) {
	pr_info("bpf_replace: exiting module and restoring programs");
	mutex_lock(&replace_mutex);

	while(rprog_idx > 0) {
		rprog_idx--;
		
		struct bpf_prog_replace_info *info = &rprog_infos[rprog_idx];
		pr_info("bpf_replace: restoring prog idx %u, 0x%px and name %s\n", rprog_idx, info->targ_prog, info->targ_prog->aux->name);

		info->targ_prog->bpf_func = info->old_bpf_func;
		info->targ_prog->jited_len = info->old_jited_len;	

		pr_info("bpf_replace: freeing memory at 0x%px\n", info->new_bpf_func);
		bpf_jit_free_exec(info->new_bpf_func);
	}

	synchronize_rcu();

	mutex_unlock(&replace_mutex);
	debugfs_remove_recursive(replace_dir);
}

module_init(replace_init);
module_exit(replace_cleanup);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Replace a current running BPF program's native code with a newly allocated code");
