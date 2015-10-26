rm -f sum.o
rm -f mainline.o

# -o 	outfile
# -g 	generate debug information in selected format
# -f	output format elf32
# -F 	select a debugging format
nasm -f elf32 -o sum.o -g -F stabs sum.asm 

# -m32	Generate code for a 32-bit environment
gcc mainline.c sum.o  -m32 -o mainline
./mainline


# these 32-bit libraries must be installed 

#sudo apt-get install gcc-multilib 
#sudo apt-get install libc6-i386
#sudo apt-get install libc6:i386
#sudo apt-get install libc6-dev-i386
#sudo apt-get install libc6-dev:i386

#The following packages will be REMOVED:
#  build-essential dkms g++ g++-4.8 gcc gcc-4.8 gcc-4.8-multilib gcc-multilib nvidia-319 virtualbox-dkms

# at the end I have also installed all the previously removed packages
