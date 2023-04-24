.globl main
.text

main:   
    j preload 
load:   
    #load vals
    addi x1,  x0,  100  
    addi x2,  x0,  20
    j  doadd   
    ebreak 
preload:
    j  load 
    ebreak 
doadd2:
    add x1, x1, x2
    j  break 
    ebreak
doadd:
    addi x1, x1, 10
    j  doadd2 
break:
    ebreak

