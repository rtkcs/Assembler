rm -f nanoTest.elf32
rm -f nanoTest

nasm -f elf32 nanoTest.asm -g -F dwarf -o nanoTest.elf32

ld -m elf_i386  -o nanoTest nanoTest.elf32
./nanoTest
