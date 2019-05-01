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
dvar1 dword 12
dvar2 dword 6
dvar3 dword 18
msg byte 'the result is : %d',10,0

.code

main Proc
	push dword ptr dvar3
	push dword ptr dvar2
	call gcd
	push eax
	push dword ptr dvar1
	call gcd

	invoke printf,offset msg,eax

	push 0h
	call ExitProcess
main endp

gcd proc
	push ebp
	mov ebp,esp

	push ebx
	push ecx
	push edx

	mov ecx,dword ptr [ebp+12]
	jmp testing
body:
	mov eax,dword ptr [ebp+8]
	mov ebx,dword ptr [ebp+12]
	cdq
	div ebx
	mov ecx,edx
	mov dword ptr [ebp+8],ebx
	mov dword ptr [ebp+12],ecx
testing:
	mov eax,dword ptr [ebp+8]
	mov ebx,dword ptr [ebp+12]
	cdq
	div ebx
	cmp edx,0
	jne body

	mov eax,ecx

	pop edx
	pop ecx
	pop ebx

	pop ebp
	ret 8
gcd endp

end main
