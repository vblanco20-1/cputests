.globl main
.text

main:                   
    #load vals
    addi x1  x0  100  
    addi x2  x0  20

loop:
    addi x2 x2 20
    blt x2 x1 loop

    ebreak x0 x0 1