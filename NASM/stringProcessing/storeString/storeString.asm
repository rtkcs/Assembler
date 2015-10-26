segment .data
        ; initialized data
       
string1         db  'Hello World From String Loading And Storing',0
string1Length   EQU $ - string1


segment .bss
       ; unitialized data

initializeString    resw	100    ;reserve 100 words, 100 x 16-bits
string2             resb    string1Length

segment .text
    global _start
_start:
    pusha 
       ; body of the function

       
    mov	ECX, 100		      ; repeat 100 times
    mov EDI, initializeString ; destination
    mov AX, 32                ; initialize initializeString with value -1

    cld                         ; clear DF -> forwart direction
    rep stosw                   ; mov instruction dows not change any of the flags, 
                                ; repe / repne should not be used with this instruction 

;   start ddd, put a break point at line 46 and see the memory at addresses string1, string2, initializeString
;   x/lsw	&initializeString
    
    mov ECX, string1Length      ; repeat string1Length times
    mov ESI, string1            ; source string1
    mov EDI, string2            ; destination string2
    cld
loop1:
    lodsb                       ; load character from string1 into AL register, increment ESI register
    or AL, 20H                  ; convert UPPERCASE letters to lowercase
    stosb                       ; store AL register into string2, increment EDI register
    loop loop1
    
;   x/lsb	&string1
;   x/lsb	&string2

    
    popa                ; restore registers
    mov eax,1           ; system call ID: sys_exit
    mov ebx,0           ; exit code 0: no error
    int 80h             ; system call
