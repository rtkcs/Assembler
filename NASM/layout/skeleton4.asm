; An assembly language program
;
;
;%include <stdio.h>

.DATA
       ; initialized data
       ;
       ; when the program is loaded into a memory, all the initialized values are loaded also


.UDATA
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
.CODE        ; here goeas the executable instructions
    .STARTUP

    pusha

       ;
       ; body of the function
       ;




;    popa         	   ; restore registers
;    mov eax,1          ; system call ID: sys_exit
;	  mov ebx,0          ; exit code 0: no error
;    int 80h            ; system call
    .EXIT
