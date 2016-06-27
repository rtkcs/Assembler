#
rm -f cpuid.o
rm -f cpuid

as -gstabs -o cpuid.o cpuid.asm
ld -o cpuid cpuid.o

# gcc -o cpuid cpuid.s

./cpuid
