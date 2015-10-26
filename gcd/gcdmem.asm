segment .data

segment .bss
x:    resd  1
y:    resd  1
segment .text
    global gcdmem
gcdmem:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]        ; x
    mov  [x],eax
    mov  eax,[ebp+12]       ; y
    mov  [y],eax
looptop:
    mov  eax,[x]
    cmp  eax,0              ; if (x == 0) we're done
    je   goback
    mov  ebx,[y]
    cmp  eax,ebx            ; make certain x is the larger number
    jge  modulo
    mov  [x],ebx
    mov  [y],eax
modulo:
    mov  ebx,[y]
    mov  eax,[x]
    cdq                    ; set up for division;  rozšíri eax register na edxeax ; (convert doubleword to quadword)
    idiv ebx               ; divide edxeax by ebx
    mov  [x],edx           ; the remainder is in edx
    jmp  looptop

goback:
    mov  eax,[y]           ; return y
    mov  esp,ebp
    pop  ebp
    ret
