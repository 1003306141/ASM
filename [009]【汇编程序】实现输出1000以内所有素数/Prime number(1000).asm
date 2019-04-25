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
format byte '%d',9,0;format必须放在Prime上面
msg byte 32h,9,33h,9,35h,9,0
Prime dword 0 dup(1000)

.code
main Proc
	xor ecx,ecx;ecx素数个数计数器
	mov esi,6;esi==i
	jmp testing
body:
	mov edi,2;cdi==j
	jmp testing2
body2:
	mov eax,esi
	mov ebx,edi
	cdq
	div ebx
	cmp edx,0
	jne next
	jmp over
next:
	mov eax,esi
	mov ebx,2
	cdq
	div ebx
	dec eax
	cmp edi,eax
	jne over2
	mov dword ptr Prime[ecx*4],esi
	inc ecx
over2:
	inc edi
testing2:
	mov eax,esi
	mov ebx,2
	cdq
	div ebx
	cmp edi,eax
	jl body2

over:
	inc esi
testing:
	cmp esi,1000
	jl body

	pushad
	invoke printf,offset msg
	popad

	xor esi,esi
again:
	pushad
	invoke printf,offset format,dword ptr Prime[esi*4]
	popad
	inc esi
	loop again

	push 0h
	call ExitProcess
main endp
end main
