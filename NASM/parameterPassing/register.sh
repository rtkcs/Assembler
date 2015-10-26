#!/bin/bash

#nasm -f elf64 procex2.asm -o procex2.elf64
#nasm -f elf32 procex2.asm -o procex2.elf32
nasm -f elf32 -o procex2.elf32 -g -F stabs procex2.asm
#ld procex2.elf32 -o procex2 --verbose -b elf32-i386 --oformat=elf32-i386
ld procex2.elf32 -o procex2 -melf_i386  #--verbose
./procex2


