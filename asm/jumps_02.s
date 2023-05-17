.text

main:   
    jal ra, preload
    ebreak;
preload:
    addi x2, x0, 10
    jalr x0, x1, 0
    addi x2, x0, 15
    ebreak 

