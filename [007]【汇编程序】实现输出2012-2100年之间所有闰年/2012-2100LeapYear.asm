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
Lyear dword 25 dup(0)
msg byte 'Leap year is follow:',10,0
format byte '%d',9,0

.code
main Proc
	xor ecx,ecx
	mov esi,2012
	jmp testing
body:
	mov eax,esi
	mov ebx,4
	cdq
	div ebx
	cmp edx,0
	jne next
	mov eax,esi
	mov ebx,100
	cdq
	div ebx
	cmp edx,0
	je next
	mov dword ptr Lyear[ecx*4],esi
	inc ecx
	jmp over
next:
	mov eax,esi
	mov ebx,400
	cdq
	div ebx
	cmp edx,0
	jne over
	mov dword ptr Lyear[ecx*4],esi
	inc ecx
over:
	inc esi
testing:
	cmp esi,2100
	jl body
	
	pushad
	invoke printf,offset msg
	popad
	xor esi,esi
again:
	pushad
	invoke printf,offset format,dword ptr Lyear[esi*4]
	popad
	inc esi
	loop again

	push 0h
	call ExitProcess
main endp
end main
