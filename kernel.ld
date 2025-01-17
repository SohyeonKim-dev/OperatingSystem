/* 

A linker script is a file which defines the memory layout of executable files. 
Based on the layout, the linker assigns memory addresses to functions and variables.

추가적인 자료 - http://korea.gnu.org/manual/release/ld/ld-sjp/ld-ko_3.html

*/

/* 

- boot 함수가 커널의 진입점이다! 
- The base address == 0x80200000.
- The .text.boot section is always placed at the beginning.
- Each section is placed in the order of .text, .rodata, .data, and .bss.
- The kernel stack comes after the .bss section, and its size is 128KB.

- ENTRY(boot) declares that the boot function is the entry point of the program. 
- the placement of each section is defined within the SECTIONS block.

- The . symbol represents the current address

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

    /*
    chap9. Memory Allocation
    - define the memory regions to be managed by the allocator
    - . = ALIGN(4096) ensures that it's aligned to a 4KB boundary
    */

    . = ALIGN(4096);
    __free_ram = .;
    . += 64 * 1024 * 1024; /* 64MB */
    __free_ram_end = .;
}
