
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

        .riscv.attributes :ALIGN(4) {
              * (.riscv.attributes);
        } : phdr_flash

         .comment :ALIGN(4) {
              * (.comment);
        } : phdr_flash

         .got :ALIGN(4) {
              * (.got);
        } : phdr_flash
          .dynamic :ALIGN(4) {
              * (.dynamic);
        } : phdr_flash

        . = 0x00010000;
       /* .data : { * (.data); } : phdr_ram*/
       
        .bss : { *(.bss) }  : phdr_ram
}
MEMORY
{
    ROM (rx) : ORIGIN = 0, LENGTH = 65535
    RAM (wx) : org = 0x000010000, LENGTH = 65535
}
