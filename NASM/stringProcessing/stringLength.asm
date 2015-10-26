


segment .data
       ; initialized data
       ; 
       ; when the program is loaded into a memory, all the initialized values are loaded also
       
STR_MAX     EQU     128
%define     STRING1 [EBP+8]
%define     STRING2 [EBP+16]
       
segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment

segment .text        ; here goeas the executable instructions


; String length procedure
; Receives a string pointer througth the stack
; IF not a string ended in \0, CF is set
; ELSE string length is returned in EAX with CF = 0

    global stringLength
stringLength:

       ;
       ; body of the function
       ;

    enter   0,0
    push    ECX
    push    EDI
    push    ES
    les     EDI, STRING1    ; copy string pointer to ES:EDI
    mov     ECX, STR_MAX    ; need to terminate loop if EDI is not pointing to a string
    cld                     ; forward search
    mov     AL, 0           ; NULL character
    repne   scasb
    jcxz    no_string       ; if ECX = 0, not a string
    dec     EDI             ; back -1, to point to NULL
    mov     EAX, EDI
    sub     EAX, [EBP+8]    ; string length in EAX
    clc                     ; clear CF, CF=0. no error
    jmp     SHORT done

.no_string:
    sts                     ; set CF = 1, no string
 
.done:
    pop     ES
    pop     EDI
    pop     ECX
    leave
    ret     8               ; clear stack and return

    
; String compare procedure
; Receives 2 string pointers through the stack - string1, string2
; IF string2 is not a string, CF is set
; ELSE string1 and string2 are compared and returns a value in EAX with CF=0
;   EAX = -1        string1 < string2
;   EAX =  0        string1 = string2
;   EAX = +1        string1 > string2
; Preserves all registers

    global stringComparison
stringComparison:   
    enter   0,0
    push    ECX
    push    EDI
    push    ESI
    push    DS
    push    ES
    
    ; find string length first
    les     EDI, STRING2    ; string2 pointer
    push    ES
    push    EDI
    call    stringLength
    jc      .no_string
    
    mov     ECX, EAX        ; string1 length in ECX
    inc     ECX             ; add 1 to include NULL
    lds     ESI, STRING1    ; string1 pointer
    cld                     ; forward search
    repe    cmpsb
    je      same
    ja      above
    
below:
    mov     EAX, -1         ; EAX = -1 => string1 < string2
    clc                     ; CF=0
    jmp     SHORT sm_done
same:
    xor     EAX, EAX        ; EAX = 0 => string1 = string2
    clc
    jmp     SHORT sm_done
above:
    mov     EAX, 1          ; EAX = -1 => string1 > string2
    clc
    jmp     SHORT sm_done
    
sm_no_string:
    stc                     ; CF = 1, no string
sm_done:
    pop     ES
    pop     DS
    pop     ESI
    pop     EDI
    pop     ECX
    leave
    ret     16              ; clear and return












	
	
	
