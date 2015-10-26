segment .data

segment .bss
char_hold:  resd 1            ;reserves 1 Doubleword, 32 bit, 4 Byt
str_hold:   resb 20           ;reserver 20 Bytes
str_len:    equ  $-str_hold-1 ;
value:      resd 1             ;reserves 1 Doubleword, 32 bit, 4 Byt


segment .text


    extern out_string
    extern getchar
    
    
    global in_char
in_char:
    enter  0,0  ; allocate stack frame
    pushad      ; pushes all 32-bit general registers onto the stack> EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI
    pushfd      ; pushes the 32-bit flags register EFLAGS onto the stack

    push   dword [ebp+8] ; pushes [ebb+8] to the stack ad double word, ebp - base pointer
    call   out_string ; calls the out_string function
    pop    eax
    mov    byte [char_hold],' ' ; move to [char_hold] location an space
    call   getchar
    cmp    eax,10   ; compare eax with enter
    jz     .in_char_finish ; jump if zero, zf=1
    mov    [char_hold],al ;move left 8 bits from the 32-bit register EAX to [char_hold] location

.in_char_flush:
    call   getchar
    cmp    eax,10
    jnz    .in_char_flush

.in_char_finish:
    popfd     ; pops the 32-bit EFLAGS register from the stack
    popad     ; pops the 32-bit general registers from the stack
    mov    al,[char_hold]
    leave   ; the reverse of the enter instruction
    ret     ; return from a procedure



    global  in_string
in_string:
    enter  0,0  ; allocate stack frame
    pushad      ; pushes all 32-bit general registers onto the stack> EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI
    pushfd      ; pushes the 32-bit flags register EFLAGS onto the stack

    push   dword [ebp+8]  ; pushes DoubleWord (32-bit,4 Byt) to stack from [ebp+8]; ebp - 32-bit base pointer
    call   out_string     ; calling function out_string
    pop    eax            ; pops 32-bit number from the stack to eax registry

    mov    ebx,str_hold    ; address to store string
    mov    byte [ebx],0    ; str_hold = 0; empty string
    mov    ecx,str_len     ; maximum string length
.in_string_loop:
    call   getchar          ; call extern function getchar
    cmp    eax,10           ; compare eax - the return from getchar with ENTER 
    jz     .in_string_finish ; jump zero - if equals -> jump to .in_string_finish 

    mov    [ebx],al
    add    ebx,1
    mov    byte [ebx],0
    sub    ecx,1
    jnz    .in_string_loop

.in_string_flush:
    call   getchar
    cmp    eax,10
    jnz    .in_string_flush

.in_string_finish:
    popfd
    popad
    mov    eax,str_hold
    leave
    ret



    global  in_integer
in_integer:
    enter  0,0
    pushad
    pushfd

    push   dword [ebp+8]
    call   in_string
    pop    ebx
    xor    ecx,ecx

.in_integer_loop:
    xor    ebx,ebx
    mov    bl,[eax]
    cmp    bl,0x30
    jl     .in_integer_finish
    cmp    bl,0x39
    jg     .in_integer_finish
    sub    ebx,0x30
    mov    edx,ecx
    shl    edx,1
    shl    ecx,3
    add    ecx,edx
    add    ecx,ebx
    add    eax,1
    jmp    .in_integer_loop

.in_integer_finish:
    mov    [value],ecx
    popfd
    popad
    mov    eax,[value]
    leave
    ret
