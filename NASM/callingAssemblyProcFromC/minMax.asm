; Assembly program for the min_max function - called from the C program minMax.c
; This function finds the minimum and maximum of the 3 integers it receives.

global min_max

min_max:

	enter 	0, 0
	;EAX keeps minimum number and EDX maximum
	mov		EAX, [EBP+8]	; get value2
	mov 	EDX, [EBP+12]	; get value3
	cmp 	EAX, EDX		; is value1 < value2 <
	jl 		skip1			; if so, do nothing
	xchg 	EAX, EDX		; else, exchange
skip1:
	mov		ECX, [EBP+16]	; get value3
	cmp		ECX, EAX		; is value3 < min in EAX ?
	jl		new_min
	cmp		ECX, EDX		; is value3 < max in EDX ?
	jl		store_result
	mov		EDX, ECX
	jmp		store_result
new_min:
	mov		EAX, ECX
store_result:
	mov		EBX, [EBP+20]	; EBX = &min
	mov		[EBX], EAX
	mov 	EBX, [EBP+24]	; EBX = &max
	mov		[EBX], EDX
	leave
	ret
