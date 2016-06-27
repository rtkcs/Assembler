#cpuid.s Sample program to extract the processor Vendor ID
.section .data
output:
  .ascii  "The processor Vendor ID is 'xxxxxxxxxxxx'\n"

.section .text
# gcc looks for "main" label to determine the start of the program
# .globl main
# main:
# linker looks for "_start" label to determine the start of the program
.globl _start
_start:
  movl  $0, %eax          #mov 0 -> EAX register, output the Vendor ID string
  cpuid
  movl  $output, %edi     # memory location of output is loaded into EDI
                          # Vendor ID string is divided into EBX, EDX, ECX registers
  movl  %ebx, 28(%edi)    # move the content of EBX into memory location in EDI + 28 bytes
  movl  %edx, 32(%edi)    # move the content of EDX into memory location in EDI + 32 bytes
  movl  %ecx, 36(%edi)    # move the content of ECX into memory location in EDI + 36 bytes

# interrupt, write output to STDOUT
  movl  $4, %eax          # write to file
  movl  $1, %ebx          # write to STDOUT
  movl  $output, %ecx     # write the content of $output
  movl  $42,  %edx        # length 42 bytes
  int   $0x80

# interrupt, program termination
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80
