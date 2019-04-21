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
msg byte 'Please input three number.',10,0
format1 byte '%d%d%d',0
format2 byte '%d > %d > %d',10,0
value1 dword 0
value2 dword 0
value3 dword 0

.code
main Proc
	invoke printf,offset msg
	invoke scanf,offset format1,offset value1,offset value2,offset value3

	mov eax,dword ptr value1
	mov ebx,dword ptr value2
	cmp eax,ebx
	jge next
	mov dword ptr value1,ebx
	mov dword ptr value2,eax
next:
	mov eax,dword ptr value1
	mov ebx,dword ptr value3
	cmp eax,ebx
	jge next2
	mov dword ptr value1,ebx
	mov dword ptr value3,eax
next2:
	mov eax,dword ptr value2
	mov ebx,dword ptr value3
	jge next3
	mov dword ptr value2,ebx
	mov dword ptr value3,eax
next3:

	invoke printf,offset format2,dword ptr value1,dword ptr value2,dword ptr value3
	push 0h
	call ExitProcess
main endp
end main
	