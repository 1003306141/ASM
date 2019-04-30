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
sum dword 0
msg1 byte '%d! == %d',10,0
msg2 byte 'sum is %d',10,0
.code

main Proc
	mov esi,1
	jmp testing
body:
	push esi
	call recursion

	pushad
	invoke printf,offset msg1,esi,eax
	popad

	mov ebx,dword ptr sum
	add eax,ebx
	mov dword ptr sum,eax
	
	inc esi
testing:
	cmp esi,8
	jle body

	invoke printf,offset msg2,eax

	push 0h
	call ExitProcess
main endp

recursion proc
	push ebp
	mov ebp,esp
	push ebx
	cmp dword ptr [ebp+8],0
	jne next
	mov eax,1
	jmp over
next:
	mov ebx,dword ptr [ebp+8]
	dec ebx
	push ebx
	call recursion
	inc ebx
	imul eax,ebx
over:
	pop ebx
	pop ebp
	ret 4
recursion endp

end main
