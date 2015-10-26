nasm -f elf64 hellolinux.asm -g -F stabs -o helloworld.elf64
ld helloworld.elf64 -o helloworld
./helloworld
