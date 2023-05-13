.globl main

.text
j main 

val1: .long 0xECC 
val2: .long 0xDEADBABE 
val3: .long -1


main:        
    
    lw x1 , 4(x0)
    li x3 ,  4
    lw x2 , 4(x3)   
    ebreak 