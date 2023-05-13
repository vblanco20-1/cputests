.globl main

.text
j main 

val1: .long 0xECC 
val2: .long 0xDEADBABE 
val3: .long -1


main:        
    li x1 , 0xDDCCBBAA 
    sb x1 , 4(x0)   
    add x1 , x0 , x0
    lw x2 , 4(x0)   
    ebreak 