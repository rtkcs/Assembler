rm -f test1.o
rm -f calledAsm.o
rm -f callingMainCProg.o
rm -f callingMainCProg

# -o 	outfile
# -g 	generate debug information in selected format
# -f	output format elf32
# -F 	select a debugging format
#nasm -f elf32 -o calledAsm.o -l calledAsm.lst -g -F stabs calledAsm.asm 
nasm -f elf32 -o calledAsm.o -l calledAsm.lst -g -F DWARF  calledAsm.asm 

# -m32	Generate code for a 32-bit environment
#gcc callingMainCProg.c calledAsm.o  -m32 -o callingMainCProg -gstabs
gcc callingMainCProg.c calledAsm.o  -m32 -o callingMainCProg -gdwarf-4
./callingMainCProg
