; Memory to memory copy using the string instructions
; Input:    none
; Output:   outputs the copied array
;


segment .data
       ; initialized data
       ; 
       ; when the program is loaded into a memory, all the initialized values are loaded also
       
in_array    DD  10, 20, 30, 40, 50, 60, 70, 80, 90, 100
array_size  EQU ($ - in_array)/4
out_message DB  'The copied array is: ',0
       
segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
       
out_array   RESD    array_size    
       
segment .text        ; here goeas the executable instructions
    global _start
_start:
    pusha 

       ;
       ; body of the function
       ;
    mov ECX, array_size ; ECX = array size
    mov ESI, in_array   ; ESI = in array pointer
    mov EDI, out_array  ; EDI = out array pointer
    cld
    rep movsd           ; moves in_array -> out_array
    ; ddd memoryCopy 
    ; set breakpoint after rep movsd
    ; x/10id &in_array
    ; x/10id &out_array
 

    
    popa         	   ; restore registers
    mov eax,1          ; system call ID: sys_exit
	mov ebx,0          ; exit code 0: no error
	int 80h            ; system call
