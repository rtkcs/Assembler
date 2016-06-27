# cpuid2.s
# Vies the CPUID Vendor ID string using C library calls
.section .data
#;initialized data here
output:
  .asciz  "The processor Vendor ID is '%s'\n" # .asciz - zero terminated string

.section .bss
#; uninitialized data here
  .lcomm  buffer, 12                          # 12-byte buffer for Vendor ID string

.section .text
.globl _start
_start:           #instructions code goes here
#.globl main
#main:

  nop
  movl  $0, %eax
  cpuid
  movl  $buffer,  %edi
  movl  %ebx, (%edi)
  movl  %edx, 4(%edi)
  movl  %ecx, 8(%edi)
                                              # call printf(output, buffer)
  push $buffer                               # push $buffer, $output to the stack, in reverse order
  push $output
  call  printf
  addl  $8, %esp                              # clear the parameters on the stack

  push $0                                    # exit(0),
  call  exit
