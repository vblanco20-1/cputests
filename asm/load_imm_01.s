.globl main
#.text*/

main:        
    add x1, x0, x0 #0xECC           
    li x1, 3788 #0xECC
    lui  x1, 1040125 #4260355788 x1   # FDEF DECC1040125#   
    addi x2, x0, 3
    ebreak 