#from riscv_assembler.convert import AssemblyConverter as AC
import binascii
import subprocess
import os##
#convert #= AC(output_mode = 'f', nibble_mode = False, hex_mode = False)###

def convert_to_bin(file, foutput):

    with open(foutput, 'w') as fo:
        with open(file, mode="rb") as f:
            chunk = f.read(4)
            lines = 0
            max_lines = 255
            while chunk:
                
                num = int.from_bytes(chunk,'little')
                binarycode = (format(num,'032b'))
                #print(binarycode)
                fo.write(binarycode)
                fo.write('\n')
                chunk = f.read(4)
                lines+=1
            while lines < max_lines:
                num = 0
                lines+=1
                binarycode = (format(num,'032b'))
                #print(binarycode)
                fo.write(binarycode)
                fo.write('\n')


asm_cmd = "riscv64-unknown-elf-as {name:}.s -o {name:}.o -march=rv32i"
bin_cmd = "riscv64-unknown-elf-objcopy -O binary {name:}.o {name:}.bin"
c_cmd = "riscv64-linux-gnu-gcc -nostartfiles -nostdlib -s -O1 -o fib.elf -g {name:}.c -T linkscript.lds  -mabi=ilp32 -march=rv32i"
c_bin_cmd = "riscv64-unknown-elf-objcopy  -O binary {name:}.elf {name:}.bin"
def compile_c(name):
    stream = os.popen(c_cmd.format(name = name))
    output = stream.read()
    if output:
         raise Exception(output) 
          ## build binary properly
    stream = os.popen(c_bin_cmd.format(name = name))
    output = stream.read()
    if output:
         raise Exception(output) 

    convert_to_bin(name + '.bin', name + '.txt')

def run_assembler(name):
    ##assemble file
    stream = os.popen(asm_cmd.format(name = name))
    output = stream.read()
    if output:
         raise Exception(output) 

    ## build binary properly
    stream = os.popen(bin_cmd.format(name = name))
    output = stream.read()
    if output:
         raise Exception(output) 

    convert_to_bin(name + '.bin', name + '.txt')
    

run_assembler('jumps_01')
run_assembler('jumps_02')
run_assembler('adds')
run_assembler('branch_01')
run_assembler('load_imm_01')
run_assembler('load_memory_01')
run_assembler('load_store_memory_01')
run_assembler('load_store_memory_02')

#assemble entry point
#stream = os.popen("riscv64-unknown-elf-as entry.s -o entry.o -march=rv32i")
#output = stream.read()
#if output:
 #       raise Exception(output) 



run_assembler('entry')
compile_c('fib')

#convert_to_bin('jumps_01.bin','jumps_01.txt')

#print(bin(int.from_bytes(open('jumps_01.bin', 'rb').read(), 'little')))

#print((open('jumps_01.bin', 'rb').read()))

#convert(open('adds.s', 'r').read(), "add.txt") 
#convert(open('branch_01.s', 'r').read(), "branch_01.txt") 
#convert(open('jumps_01.s', 'r').read(), "jumps_01.txt") 
#convert(open('load_imm_01.s', 'r').read(), "load_imm_01.txt") 