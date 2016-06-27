rm -f systemCallTest2.elf32
rm -f systemCallTest2

nasm -f elf32 systemCallTest2.asm -g -F dwarf -o systemCallTest2.elf32

ld -m elf_i386  -o systemCallTest2 systemCallTest2.elf32
./systemCallTest2
