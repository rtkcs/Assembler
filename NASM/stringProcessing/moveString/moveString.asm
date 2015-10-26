segment .data
        ; initialized data
       
string1         db  'Hello World from string loading',0
string1Length   EQU $ - string1

segment .bss
       ; unitialized data

string2			resb	80

segment .text
    global _start
_start:
    pusha 
       ; body of the function

       
    mov	ECX, string1Length		; repeat string1Length times, includes NULL
    mov	ESI, string1			; source string1
    mov EDI, string2			; destination string2

    cld                         ; clear DF -> forwart direction
    rep movsb                   ; mov instruction dows not change any of the flags, 
                                ; repe / repne should not be used with this instruction 

;   start ddd, put a break point at line 32 and see the memory at addresses string1, string2
;   x/lsb	&string1
;   x/lsb	&string1

    
    popa                ; restore registers
    mov eax,1           ; system call ID: sys_exit
    mov ebx,0           ; exit code 0: no error
    int 80h             ; system call
