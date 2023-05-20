.text
        
    addi x1 , x0, 0xAA # load immediates
    addi x2 , x0, 0xBB 
    addi x3 , x0, 0xCC
    addi x4 , x0, 0xDD 
   
    rdcycle x1 # load cycle count and instruction counts
    rdinstret x2

    ebreak 