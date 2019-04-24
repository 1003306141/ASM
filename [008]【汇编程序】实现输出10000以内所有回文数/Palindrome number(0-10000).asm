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
count dword 0
msg1 byte '%d',9,0
msg2 byte 10,0

.code
main Proc
	mov esi,0;esi == i
	jmp testing
body:
	mov eax,esi;eax == tmp
	mov ecx,0;ecx == result
	jmp testing2
body2:
	mov ebx,10
	cdq
	div ebx
	imul ecx,10
	add ecx,edx
testing2:
	cmp eax,0
	jne body2
	
	cmp ecx,esi
	jne over
	pushad
	invoke printf,offset msg1,ecx
	popad
	mov ebx,dword ptr count
	inc ebx
	mov dword ptr count,ebx
	mov eax,ebx
	mov ebx,10
	cdq
	div ebx
	cmp edx,0
	jne over
	pushad
	invoke printf,offset msg2
	popad

over:
	inc esi
testing:
	cmp esi,10000
	jl body

	push 0h
	call ExitProcess
main endp
end main
