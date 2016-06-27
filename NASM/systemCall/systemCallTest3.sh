rm -f systemCallTest3.elf32
rm -f systemCallTest3

nasm -f elf32 systemCallTest3.asm -g -F dwarf -o systemCallTest3.elf32

ld -m elf_i386  -o systemCallTest3 systemCallTest3.elf32
./systemCallTest3
