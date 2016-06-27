rm -f write.elf64
rm -f write

nasm -f elf32 write.asm -g -F dwarf -o write.elf32

ld -m elf_i386  -o write write.elf32
./write
