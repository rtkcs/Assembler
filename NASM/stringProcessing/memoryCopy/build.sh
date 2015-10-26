##############################

rm -f memoryCopy.elf32
rm -f memoryCopy


nasm -f elf32 memoryCopy.asm -g -F dwarf -o memoryCopy.elf32

ld -m elf_i386  -o memoryCopy memoryCopy.elf32
./memoryCopy
