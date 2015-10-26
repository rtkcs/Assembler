##############################

rm -f moveString.elf32
rm -f moveString


nasm -f elf32 moveString.asm -g -F dwarf -o moveString.elf32

ld -m elf_i386  -o moveString moveString.elf32
./moveString
