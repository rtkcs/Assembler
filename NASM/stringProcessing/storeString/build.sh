##############################

rm -f storeString.elf32
rm -f storeString


nasm -f elf32 storeString.asm -g -F dwarf -o storeString.elf32

ld -m elf_i386  -o storeString storeString.elf32
./storeString
