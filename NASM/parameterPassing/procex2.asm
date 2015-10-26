;	Parameter passing via registers
;
;

	BUF_LEN				EQU		41
	prompt_msg_length	EQU 	24
	length_msg_length	EQU		23

segment .data
	;
	; initialized data
	;
    prompt_msg	db	"Please input a string: ",0Ah
    length_msg 	db	"The string length is: ",0Ah
    
segment .bss
	;
    ; unitialized data
    ;
    string		resb	BUF_LEN	;input string < BUF_LEN chars. 
    
segment .text
    global _start
_start:
    push 	EBP      ; epb value is saved on the stack
    mov 	EBP,ESP  ; the esp register is copied into the ebp register
    sub  	ESP,0    ; substraction of n is how many memory is used for local variables
    ;push          	 ; save registers
       ;
       ; body of the function
       ;
    mov 	EAX,4          				; system call ID: sys_write
	mov 	EBX,1          				; file descriptor for standard output
	mov 	ECX,prompt_msg     			; string address
	mov 	EDX,prompt_msg_length     	; string length
	int 	80h            				; system call  
	
	
	
	

	
	
	mov 	EAX,4          				; system call ID: sys_write
	mov 	EBX,1          				; file descriptor for standard output
	mov 	ECX,length_msg     			; string address
	mov 	EDX,length_msg_length     	; string length
	int 	80h            				; system call 
	
	
	mov 	EAX,4          				; system call ID: sys_write
	mov 	EBX,1          				; file descriptor for standard output

	mov		EBX, length_msg				;EBX = string address
	call str_len						;returns string length in AX	
	
	mov 	ECX,EAX     				; string address
	mov 	EDX,4     					; string length
	int 	80h            				; system call	
	
    
	mov eax,1          ; system call ID: sys_exit
	mov ebx,0          ; exit code 0: no error
	int 80h            ; system call
	
    ;pop           	 ; restore registers
    ;mov  	EAX,0    ; store the return value into the eax register, here is the return value 0
    ;mov  	ESP,EBP  ; restore esp register to the initial value
    ;pop  	EBP      ; restore ebp register to the initial value
    ;ret     	     ; return to the caller
 
;
;
;
str_len:
	push 	EBX
	sub		AX, AX			;string length = 0
repeat:
	cmp 	byte[EBX], 0	;compare with NULL char
	je		str_len_done	;if NULL we are done
	inc 	AX				;else, increment string length
	inc 	EBX				;point BX to the next char
	jmp 	repeat			;and repeat the process
str_len_done:
	pop		EBX
	ret









