rm -f hellolinux.elf64
rm -f hellolinux

#nasm -f elf32 hellolinux.asm -g -F stabs -o hellolinux.elf64
nasm -f elf32 hellolinux.asm -g -F dwarf -o hellolinux.elf64

ld -m elf_i386  -o hellolinux hellolinux.elf64
./hellolinux
