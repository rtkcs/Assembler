##############################

rm -f stringScanning.elf32
rm -f stringScanning

#nasm -f elf32 hellolinux.asm -g -F stabs -o hellolinux.elf64
nasm -f elf32 stringScanning.asm -g -F dwarf -o stringScanning.elf32

ld -m elf_i386  -o stringScanning stringScanning.elf32
./stringScanning
