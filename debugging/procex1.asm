;Parameter passing via registers
;Objective: To show parameter passing via registers.
;Input: Requests two integers from the user.
; Output: Outputs the sum of the input integers.

%include "io.mac"
.DATA
prompt_msgl DB "Please input the first number: ",0
prompt_msg2 DB "Please input the second number: ",0
sum_msg     DB "The sum is ",0

.CODE
  .STARTUP
  PutStr prompt_msgl  ; request first number
  GetInt CX           ; CX = first number
  
  PutStr prompt_msg2  ; request second number
  GetInt DX           ; DX = second number
  
  call sum            ; returns sum in AX
  PutStr sum_msg      ; display sum
  PutInt AX
  nwln

done:
  .EXIT

;Procedure sum receives two integers in CX and DX.
;The sum of the two integers is returned in AX.

sum:
  mov AX,CX ; sum = first number
  add AX,DX ; sum = sum + second number
  ret

;nasm -f elf -g -F stabs procex1.asm
;ld -o procex1 procex1.o io.o
