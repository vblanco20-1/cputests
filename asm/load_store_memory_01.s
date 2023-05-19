.globl main

.text
j main 

val1: .long 0xECC 
val2: .long 0xDEADBABE 
val3: .long -1


main:        
    li x1 , 0xFEFEDADA 
    li x3, 0x10000 # ram adress
    sw x1 , 0x4(x3)   
    add x1 , x0 , x0
    lw x2 , 0x4(x3)   
    ebreak 