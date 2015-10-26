##############################

rm -f asciiAdd.elf32
rm -f asciiAdd

#nasm -f elf32 hellolinux.asm -g -F stabs -o hellolinux.elf64
nasm -f elf32 asciiAdd.asm -g -F dwarf -o asciiAdd.elf32

ld -m elf_i386  -o asciiAdd asciiAdd.elf32
./asciiAdd
