segment .data
       ; initialized data
       ;
       ; when the program is loaded into a memory, all the initialized values are loaded also
      output DB  "This is a test message.",10,0 ; length 26
      len EQU $-output

segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
segment .text        ; here goeas the executable instructions
    global _start
_start:
    pusha

       ;
       ; body of the function
       ;
     mov eax, 4       ; man 2 write, ssize_t write(int fd, const void *buf, size_t count)
     mov ebx, 1       ; integer file descripton, 0 -STDIN, 1 - STDOUT, 2 - STDERR
     mov ecx, output  ; memory address of the string to display
     mov edx, len     ; size of the string to dispaly
     int 80h



    popa         	   ; restore registers
    mov eax,1          ; system call ID: sys_exit
    mov ebx,0          ; exit code 0: no error
    int 80h            ; system call
