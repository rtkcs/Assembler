segment .data
       ; initialized data
       ; 
       ; when the program is loaded into a memory, all the initialized values are loaded also
segment .bss
       ; unitialized data
       ; block started by symbol
       ; the thing stored in the object file is the size of the segment
segment .text        ; here goeas the executable instructions
    global _func     ; the global symbol is the name called by execution
_func:
    enter n,0   ; save the context and set up the stack, n - number of bytes to be alocated for local variables, 0 - I do not want allocate any temporary workspace
    push        ; save registers
       ;
       ; body of the function
       ;
    pop         ; restore registers
    mov eax,0   ; put the return value into eax register
    leave       ; inverse of the enter instruction, remove the local workspace from the stack and restore the original context
    ret         ; return to the caller
