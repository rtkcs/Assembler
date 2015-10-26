segment .data
       ; initialized data
       ; 
       ; when the program is loaded into a memory, all the initialized values are loaded also
       
string1         DB  'abcdefghi',0
string1Length   EQU $-string1
string2         DB  'abcdefgh',0


string5         DB  'abcdfghi',0
string5Length   EQU $-string5-1
string6         DB  'abcdefgh',0
       
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

; compare 2 string till the last character differs     
    mov     ECX, string1Length      ; repeat string1Length times
    mov     ESI, string1            ; string1 location
    mov     EDI, string2            ; string1 location
    cld                             ; forward direction
    repe    cmpsb                   ; repeat until equals the comparison, 
                                    ; leaves ESI pointing in string1 to 'i'
                                    ; leaves EDI pointing in string2 to '0'
    dec     ESI
    dec     EDI
    mov     AL, [ESI]               ; 'i' = ASCII code page 105
    mov     BL, [EDI]               ;  0 = ASCII code page \null terminator 

    
; compare 2 strings as long as the comparison fails
    mov     ECX, string5Length
    mov     ESI, string5 + string5Length - 1
    mov     EDI, string6 + string5Length - 1
    std                                      ; backward direction
    repne   cmpsb
    inc     ESI                              ; leaves ESI and EDI pointing to the first characted that matches the  
    inc     EDI                              ; backward direction
    mov     AL, [ESI]                        ; 'd' = ASCII 100
    mov     BL, [EDI]                        ; 'd' = ASCII 100

    
    popa               ; restore registers
    mov eax,1          ; system call ID: sys_exit
    mov ebx,0          ; exit code 0: no error
    int 80h            ; system call
