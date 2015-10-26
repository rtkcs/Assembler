rm -f minMaxAsm.o
rm -f minMax.o

# -o 	outfile
# -g 	generate debug information in selected format
# -f	output format elf32
# -F 	select a debugging format
nasm -f elf32 -o minMaxAsm.o -g -F stabs minMax.asm 

# -m32	Generate code for a 32-bit environment
gcc minMax.c minMaxAsm.o  -m32 -o minMax
./minMax
