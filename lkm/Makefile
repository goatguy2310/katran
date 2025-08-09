obj-m := replace_multiple.o

GCC := gcc-11
KERNEL_DIR := /lib/modules/$(shell uname -r)/build

all:
	make CC=$(GCC) -C $(KERNEL_DIR) M=$(PWD) modules CONFIG_DEBUG_INFO_BTF=n

clean:
	make CC=$(GCC) -C $(KERNEL_DIR) M=$(PWD) clean CONFIG_DEBUG_INFO_BTF=n
