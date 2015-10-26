segment .data

segment .bss

segment .text
    global gcdargs
gcdargs:
    push ebp
    mov  ebp,esp
looptop:
    mov  eax,[ebp+8]
    cmp  eax,0              ; if (x == 0) we're done
    je   goback
    mov  ebx,[ebp+12]
    cmp  eax,ebx            ; make certain x is the larger number
    jge  modulo
    mov  eax,[ebp+8]
    xchg eax,[ebp+12]
    mov  [ebp+8],eax
modulo:
    mov  ebx,[ebp+12]
    mov  eax,[ebp+8]
    cdq                    ; set up for division
    idiv ebx               ; divide edxeax by ebx
    mov  [ebp+8],edx           ; the remainder is in edx
    jmp  looptop

goback:
    mov  eax,[ebp+12]           ; return y
    mov  esp,ebp
    pop  ebp
    ret
