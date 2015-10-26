segment .data
       ;
       ; initialized data
       ;
segment .bss
       ;
       ; unitialized data
       ;
segment .text
    global _func
_func:
    push ebp      ; epb value is saved on the stack
    mov  ebp,esp  ; the esp register is copied into the ebp register
    sub  esp,n    ; substraction of n is how many memory is used for local variables
    push          ; save registers
       ;
       ; body of the function
       ;
    pop           ; restore registers
    mov  eax,0    ; store the return value into the eax register, here is the return value 0
    mov  esp,ebp  ; restore esp register to the initial value
    pop  ebp      ; restore ebp register to the initial value
    ret           ; return to the caller
