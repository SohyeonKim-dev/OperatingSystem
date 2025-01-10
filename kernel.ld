/* 

A linker script is a file which defines the memory layout of executable files. 
Based on the layout, the linker assigns memory addresses to functions and variables.

추가적인 자료 - http://korea.gnu.org/manual/release/ld/ld-sjp/ld-ko_3.html

*/

ENTRY(boot)

SECTIONS {
    . = 0x80200000; 
    __kernel_base = .;

    .text :{
        KEEP(*(.text.boot));
        *(.text .text.*);
    }

    .rodata : ALIGN(4) {
        *(.rodata .rodata.*);
    }

    .data : ALIGN(4) {
        *(.data .data.*);
    }

    .bss : ALIGN(4) {
        __bss = .;
        *(.bss .bss.* .sbss .sbss.*);
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128KB */
    __stack_top = .;

    . = ALIGN(4096);
    __free_ram = .;
    . += 64 * 1024 * 1024; /* 64MB */
    __free_ram_end = .;
}
