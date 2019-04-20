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
msg byte 'please input the letter.',10,0
msg1 byte 'Lowercase letter!',10,0
msg2 byte 'Uppercase letter!',10,0
format byte '%c',0
ch1 byte 0

.code
main Proc
	invoke printf,offset msg
	invoke scanf,offset format,offset ch1
	
	xor edx,edx
	mov dl,byte ptr ch1
	cmp edx,61h
	jl next
	cmp edx,7Ah
	jg next
	invoke printf,offset msg1
	jmp over
next:
	cmp edx,41h
	jl over
	cmp edx,5Ah
	jg over
	invoke printf,offset msg2
over:
	push 0h
	call ExitProcess
main endp
end main
