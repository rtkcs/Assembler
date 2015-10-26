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
    je   goback
    cmp  eax,ebx            ; make certain x is the larger number
    jge  modulo
    xchg eax,ebx            ; swap x and y
modulo:
    cdq                    ; set up for division; rozšíri eax register na edxeax ; (convert doubleword to quadword)
    idiv ebx               ; divide edxeax by ebx
    mov  eax,edx           ; the remainder is in edx
    jmp  looptop

goback:
    mov  eax,ebx           ; return y
    mov  esp,ebp
    pop  ebp
    ret
