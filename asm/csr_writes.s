.text
        
    addi x1 , x0, 0xAA # load immediates
    addi x2 , x0, 0xBB 
    addi x3 , x0, 0xCC
    addi x4 , x0, 0xDD 
   
    csrr x1 , 0xD00  # read csr, should be 0 at this point

    csrw  0xD00, x3  ## write a value into the csr
    csrr x2 , 0xD00 # read it

    ebreak 