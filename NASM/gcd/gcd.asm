; loads the 2 input variabled into registers
;
;
;
segment data

segment bss

segment text
    global gcd
gcd:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]        ; x
    mov  ebx,[ebp+12]       ; y
looptop:
    cmp  eax,0              ; if (x == 0) we're done
    je   goback             ; if eax == 0 -> goback
    cmp  eax,ebx            ; make certain x is the larger number
    jge  modulo
    xchg eax,ebx            ; swap x and y
modulo:
    cdq                    ; set up for division; convert dobleword(32-bit) to quadword(64-bit), eax -> edxeax
    idiv ebx               ; divide edxeax by ebx, signed divide
    mov  eax,edx           ; the remainder is in edx; modulo is in edx
    jmp  looptop

goback:
    mov  eax,ebx           ; return y; eax register is the return value in C
    mov  esp,ebp
    pop  ebp
    ret
