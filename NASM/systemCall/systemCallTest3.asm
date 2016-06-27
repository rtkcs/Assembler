segment .data
       ; initialized data
       ;
       ; when the program is loaded into a memory, all the initialized values are loaded also
       result:
       uptime     DD 0
       load1      DD 0
       load5      DD 0
       load15     DD 0
       totalram   DD 0
       freeram    DD 0
       sharedram  DD 0
       bufferram  DD 0
       totalswap  DD 0
       freeswap   DD 0
       procs      DW 0
       totalhigh  DD 0
       memunit    DD 0



segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
segment .text        ; here goeas the executable instructions
    global _start
_start:
;    pusha
       ;
       ; body of the function
       ;
    mov ebx, uptime
    mov eax, 116
    int 80h


;    popa         	     ; restore registers
    mov eax,1          ; system call ID: sys_exit
	  mov ebx,0          ; exit code 0: no error
    int 80h            ; system call
