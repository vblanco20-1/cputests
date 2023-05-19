.text
        
    addi x1 , x0, 0xAA # load immediates
    addi x2 , x0, 0xBB 
    addi x3 , x0, 0xCC
    addi x4 , x0, 0xDD 
    li x6, 0x10000 # ram adress
    sb x1 , 0x0(x6) # store one bit at a time
    sb x2 , 0x1(x6)  
    sb x3 , 0x2(x6)  
    sb x4 , 0x3(x6)  
    add x1 , x0 , x0
    lw x2 , 0x0(x6) # load word to load all the bytes
    ebreak 