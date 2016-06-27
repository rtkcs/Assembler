; sudo apt-get install lib32gcc-5-dev gcc-5-multilib
; man 3 printf
; man 3 sleep       unsigned int sleep(unsigned int seconds);
; man 3 exit
;
; strace ./cPrintfTest
; strace -c ./cPrintfTest

segment .data
       ; initialized data
       ;
       ; when the program is loaded into a memory, all the initialized values are loaded also
       output1  db  "This is a test", 10, 0
       output2  db  "This is formatted test, number=%d", 10, 0

segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
segment .text        ; here goeas the executable instructions

extern  printf
extern  sleep
extern  exit
    global main
main:
    pusha
    ; body of the function

    mov   ecx, 10
loop1:
    push  ecx

    push  output1
    call  printf      ; call c function int printf(char format, ... )
    add   esp, 4      ; reset stack pointer, clear the input values off of the stack

    pop   ecx
    push  ecx
    push  ecx
    push  output2
    call  printf      ; call c function int printf(char format, ... )
    add   esp, 8      ; reset stack pointer, clear the input values off of the stack

    push  5
    call  sleep       ; call c function unsigned int sleep(unsigned int seconds);
    add   esp, 4      ; reset stack pointer, clear the input values off of the stack

    pop   ecx
    loop  loop1

    popa         	    ; restore registers
    push  0
    call  exit        ; call c function exit(int status)
