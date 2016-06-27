#
rm -f cpuid2.o
rm -f cpuid2

as -gstabs --32 -o cpuid2.o cpuid2.s
#ld -o cpuid2 cpuid2.o   # undefined reference to `printf', undefined reference to `exit'
ld -m elf_i386 --dynamic-linker /lib32/ld-linux.so.2 -o cpuid2 -lc cpuid2.o


# gcc -m32 -v -o cpuid2 cpuid2.s

./cpuid2
