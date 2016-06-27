rm -f systemCallTest3.elf64
rm -f systemCallTest3-64

nasm -f elf64 systemCallTest3.asm -g -F dwarf -o systemCallTest3.elf64

ld -m elf_x86_64  -o systemCallTest3-64 systemCallTest3.elf64
./systemCallTest3-64
