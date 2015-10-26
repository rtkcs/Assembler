segment .data
       ;
       ; initialized data
       ;
       
string1			DB	'abcdefgh',0
string1Length	EQU	$ - string1

string5         DB  '     xyz',0
string5Length   EQU $-string5

segment .bss
       ;
       ; unitialized data
       ;
segment .text
    global _start
_start:
    pusha 

       ;
       ; body of the function
       ;

; searching a particular character 'e' in string1
    mov	    ECX, string1Length		; repeat string1Length times
    mov	    EDI, string1			; search in string1
    mov     AL, 'e'					; character to be searched
    cld							    ; clear DF -> forwart direction
    repne   scasb
    dec     EDI						; the searched charecter is in memory on EDI,
    							    ; the position on string is in ECX register

; skip initial blanks
    mov     ECX, string5Length
    mov     EDI, string5
    mov     AL, ' '             ; character to be searched
    cld                         ; forward direction
    repe    scasb               ; repeat until scan equals ' ' = string5[ECX]
    dec     EDI    

    
    popa         ; restore registers
;    mov eax,0   ; put the return value into eax register
    
    mov eax,1          ; system call ID: sys_exit
	mov ebx,0          ; exit code 0: no error
	int 80h            ; system call
