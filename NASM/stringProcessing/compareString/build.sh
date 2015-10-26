##############################

rm -f compareString.elf32
rm -f compareString


nasm -f elf32 compareString.asm -g -F dwarf -o compareString.elf32

ld -m elf_i386  -o compareString compareString.elf32
./compareString
