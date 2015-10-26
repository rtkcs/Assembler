; This procedure receives 3 integers via the stack.
; It is called from the C program
;
;


segment .text

global test1

test1:
	enter 0, 0
	mov EAX, [EBP+8]		; get argument 1 - x
	add EAX, [EBP+12]		; get argument 2 - y
	sub EAX, [EBP+16]		; subtract argument 3
	leave
	ret
