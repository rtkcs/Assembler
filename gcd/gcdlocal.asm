segment .data

segment .bss

segment .text
    global gcdlocal
gcdlocal:
    push ebp
    mov  ebp,esp
    sub  esp,8              ; room for local variables
    mov  eax,[ebp+8]        ; x
    mov  [ebp-4],eax
    mov  eax,[ebp+12]       ; y
    mov  [ebp-8],eax
looptop:
    mov  eax,[ebp-4]
    cmp  eax,0              ; if (x == 0) we're done
    je   goback
    cmp  eax,[ebp-8]        ; make certain x is the larger number
    jge  modulo
    xchg eax,[ebp-8]
    mov  [ebp-4],eax
modulo:
    mov  ebx,[ebp-8]
    mov  eax,[ebp-4]
    cdq                    ; set up for division;  rozšíri eax register na edxeax ; (convert doubleword to quadword)
    idiv ebx               ; divide edxeax by ebx
    mov  [ebp-4],edx       ; the remainder is in edx
    jmp  looptop

goback:
    mov  eax,[ebp-8]           ; return y
    mov  esp,ebp
    pop  ebp
    ret
