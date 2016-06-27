; /usr/include/x86_64-linux-gnu/asm/unistd_32.h
; #define __NR_nanosleep 162
;
; man 2 nanosleep
; #include <time.h>
; int nanosleep(const struct timespec *req, struct timespec *rem);
; struct timespec {
;    time_t tv_sec;        /* seconds */      long, 32-bint integer, 4 bytes,  DD
;    long   tv_nsec;       /* nanoseconds */  long, 32-bint integer, 4 bytes,  DD
; };
;
;
; ./nanoTest &
; [1] 4531
; sudo strace -p 4531



segment .data
       ; initialized data
       ;
       ; when the program is loaded into a memory, all the initialized values are loaded also
       timespec DD  5, 0 ; sleeping for 5 seconds and 0 nanoseconds, input struct for system call nanosleep
       output   DB  "This is a test", 10, 0 ; null terminated string
       len      EQU $ - output  ; length of the string

segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
       rem    resb 4  ; used for return valus from system call nanosleep

segment .text        ; here goeas the executable instructions
    global _start
_start:
    pusha
       ;
       ; body of the function
       ;
    mov ecx, 10h  ; loop 10 times
loop1:
    push ecx      ; preserve the value of ecx, push it to the stack

    mov eax, 4    ; write to STDOUT
    mov ebx, 1
    mov ecx, output
    mov edx, len
    int 80h

    mov eax, 162  ; sleep for 5 seconds, call nanosleep
    mov ebx, timespec
    mov ecx, rem
    int 80h

    pop ecx
    loop loop1


    ; program termination
    popa         	   ; restore registers
    mov eax,1          ; system call ID: sys_exit
	  mov ebx,0          ; exit code 0: no error
    int 80h            ; system call
