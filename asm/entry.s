#.globl main
.text
main:                   
    lui sp, 0x1FFF
    jal ra, entry
    add x1, x0, x0
    add x2, x0, x28
    ebreak;