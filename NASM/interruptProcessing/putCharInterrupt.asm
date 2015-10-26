;
; Put character procedure receives the character in AL.
;


segment .data


segment .bss

temp_char resb 1

segment .text

global _start

_start:
    enter 0,0   ; save the context and set up the stack, n - number of bytes to be alocated for local variables, 0 - I do not want allocate any temporary workspace
    pusha        ; save registers

	mov AL,32
	call putChar
	
	mov AL,'H'
	call putChar
	
	mov AL,'e'
	call putChar    

	mov AL,'l'
	call putChar
	
	mov AL,'l'
	call putChar	

	mov AL,'o'
	call putChar

	mov AL,'!'
	call putChar
    
	mov AL,0x0A
	call putChar
	
	
	
    popa         ; restore registers
;    mov eax,0   ; put the return value into eax register
    
    mov eax,1          ; system call ID: sys_exit
	mov ebx,0          ; exit code 0: no error
	int 80h            ; system call
    

	

;-------------------------------------------------------
; Put character procedure receives the character in AL.
;-------------------------------------------------------
putChar:
	pusha

	mov	[temp_char], AL
	mov	EAX, 4				; 4 = write
	mov	EBX, 1				; 1 = std out (display)
	mov ECX, temp_char		; pointer to char buffer
	mov	EDX, 1				; bytes = 1
	int	0x80
	popa
	ret

;------------------------------------------------------------------------------------- 
; Get string procedure receives input buffer pointer in EDI and the buffer size in ESI 
;-------------------------------------------------------------------------------------

getstr:
	pusha					; save all registers
	pushf					; save flag register
	mov	EAX, 3				; file read service
	mov	EBX, 0				; 0 = std input, keyboard
	mov	ECX, EDI			; pointer to input buffer
	mov EDX, ESI			; input buffer size
	int 0x80				; the file read system call returns the number of read characters in EAX
	dec EAX					; after decrenting EAX -> we appeand NULL at the end of the string
done_getstr:
	mov byte[EDI+EAX], 0	; append NULL character
	popf					; restore flag register
	popa					; restore all registers from stack
	ret















