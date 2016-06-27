# sudo apt-get install lib32gcc-5-dev gcc-5-multilib

rm -f cPrintfTest.elf32
rm -f cPrintfTest

#nasm -f elf32 cPrintfTest.asm -g -F dwarf -o cPrintfTest.elf32
nasm -f elf32 cPrintfTest.asm -g -F dwarf -o cPrintfTest.elf32

#ld -m elf_i386 --dynamic-linker /lib/ld-linux.so.2   -o cPrintfTest cPrintfTest.elf32
gcc -m32 -o cPrintfTest cPrintfTest.elf32
./cPrintfTest
