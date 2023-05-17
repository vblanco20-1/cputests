
OUTPUT_ARCH( "riscv" )
PHDRS
{
  phdr_flash PT_LOAD;
  phdr_ram PT_NULL;
}
SECTIONS {
         . = 0x00000000;
         .text :ALIGN(4) {
            entry.o (.text);
            *(.text);
        } : phdr_flash
         .rodata :ALIGN(4) {
              * (.rodata);
        } : phdr_flash
        . = 0x00001000;
        .data : { * (.data); } : phdr_ram
       
        .bss : { *(.bss) }  : phdr_ram
}
MEMORY
{
    ROM (rx) : ORIGIN = 0, LENGTH = 256
    RAM (wx) : org = 0x000001000, len = 256
}
