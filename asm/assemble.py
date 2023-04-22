from riscv_assembler.convert import AssemblyConverter as AC

convert = AC(output_mode = 'f', nibble_mode = False, hex_mode = False)

convert(open('adds.s', 'r').read(), "add.txt") 
convert(open('branch_01.s', 'r').read(), "branch_01.txt") 