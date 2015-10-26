rm -f putCharInterrupt.elf32
rm -f putCharInterrupt

#nasm -f elf32 hellolinux.asm -g -F stabs -o hellolinux.elf64
nasm -f elf32 putCharInterrupt.asm -g -F dwarf -o putCharInterrupt.elf32

ld -m elf_i386  -o putCharInterrupt putCharInterrupt.elf32
./putCharInterrupt
