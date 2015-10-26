segment .data

segment .bss

segment .text
    global randint
randint:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]        ; first argument

    cmp  eax,[ebp+12]       ; make certain first is smaller
    jl   inorder            ; jump if less, eax < [ebp+12]
    xchg eax,[ebp+12]       ; swap first and second
    mov  [ebp+8],eax
inorder:
    rdtsc                   ; The Time Stamp Counter (TSC) is a 64-bit register present on all x86 processors since the Pentium. 
                            ; It counts the number of cycles since reset. The instruction RDTSC returns the TSC in EDX:EAX.
    shr  eax,2              ; shift right -> 00               
    mov  ebx,[ebp+12]       ; the larger value
    add  ebx,1              ; plus one
    sub  ebx,[ebp+8]        ; the delta, ebx = ebx - [ebp+8]
    cdq                     ; clear edx, convert doubleword to quadword, The cdq instruction sign extends the EAX into the EDX
    idiv ebx                ; divide edx:eax by ebx; remainder is stored in ah, dx, edx; quotient is stored in ah, ax, eax
    add  edx,[ebp+8]        ; add the remainder to the lower bound

goback:
    mov  eax,edx
    mov  esp,ebp
    pop  ebp
    ret
