; Add 2 integers together in ASCII form 
; Adding is performed from right to left
;


segment .data
       ; initialized data
       ; 
       ; when the program is loaded into a memory, all the initialized values are loaded also
sum_msg		db	'The sum is: ',0
number1		db	'1234567890'
number2		db	'9876543210'
sum			db	'           ',10,13,0	;
sumLength 	EQU	$-sum
;sumLength 	dw '11'
       
segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
segment .text        ; here goeas the executable instructions
    global _start     ; the global symbol is the name called by execution
_start:
    enter 0,0   ; save the context and set up the stack, n - number of bytes to be alocated for local variables, 0 - I do not want allocate any temporary workspace
    pusha        ; save registers
       ;
       ; body of the function
       ;
       
       
       ;ESI is used as index into number1, number2 and sum

	mov	ESI, 9	; ESI point to rightmost digit
	mov	ECX, 10	; iteration count 10
	clc			; clear carry flag, we use ADC not ADD

add_loop:
	mov	AL, [number1 + ESI]
	adc	AL, [number2 + ESI]
	aaa	        		; ASCII adjust
	pushf	   			; save flags because of OR
	or	AL, 30H			; changes CF that we need in the next iteration
	popf				; restore flags
	mov [sum + ESI], AL	; store the sum byte
	dec ESI				; decrement ESI
	loop add_loop

	call putString
	
	
    popa         ; restore registers
    
    mov eax,1          ; system call ID: sys_exit
	mov ebx,0          ; exit code 0: no error
	int 80h            ; system call    
    
;    mov eax,0   ; put the return value into eax register
;    leave       ; inverse of the enter instruction, remove the local workspace from the stack and restore the original context
;    ret         ; return to the caller



;-------------------------------------------------------
; Put character procedure receives the character in AL.
;-------------------------------------------------------
putString:
	pusha

;	mov	[temp_char], AL
	mov	EAX, 4				; 4 = write
	mov	EBX, 1				; 1 = std out (display)
	mov ECX, sum			; pointer to char buffer
	mov	EDX, sumLength		; bytes = 11
;	mov	EDX, 14			; bytes = 11
	int	0x80
	popa
	ret
