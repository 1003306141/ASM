INCLUDELIB kernel32.lib
INCLUDELIB ucrt.lib
INCLUDELIB legacy_stdio_definitions.lib

.386
.model flat,stdcall

ExitProcess PROTO,
dwExitCode:DWORD

printf    PROTO C : dword,:vararg
scanf    PROTO C : dword,:vararg

.data
msg byte 'Hello World!',0
format byte 'space number: %d lowercase number: %d',10,0

.code
main Proc
	xor eax,eax
	xor ebx,ebx
	mov ecx,lengthof msg - 1
	mov esi,offset msg
again:
	mov dl,[esi]
	cmp dl,20h
	jne next
	inc eax
	jmp over
next:
	mov dl,[esi]
	cmp dl,61h
	jl over
	mov dl,[esi]
	cmp dl,7Ah
	jg over
	inc ebx
over:
	inc esi
	loop again

	invoke printf,offset format,eax,ebx

	push 0h
	call ExitProcess
main endp
end main
