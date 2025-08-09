SECTIONS
{
	/*
        for global vars/maps
        ie counter = 0xffff3000;
	*/
GLOB_PLACEHOLDER
	/*
        for the internal sections (bss, data, rodata)
        ie .rodata 0xffff4000 : { *(.rodata*) }
	*/
INTERNAL_PLACEHOLDER
        /DISCARD/ :
        {
                *(.eh_frame*)

                *(.interp)
                *(.dynamic)
                *(.dynsym)
                *(.dynstr)
                *(.hash)
                *(.gnu.hash)

                *(.comment)
                *(.note*)
        }
}

