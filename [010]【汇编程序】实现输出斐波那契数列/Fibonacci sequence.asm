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
array dword 20 dup(0)
format byte '%d',9,0

.code
main Proc
	mov dword ptr array[0],1
	mov dword ptr array[4],1
	mov esi,2
	jmp testing
body:
	mov eax,dword ptr array[esi*4 - 4]
	mov ebx,dword ptr array[esi*4 - 8]
	add eax,ebx
	mov dword ptr array[esi*4],eax
	inc esi
testing:
	cmp esi,20
	jl body

	xor esi,esi
	mov ecx,20
again:
	pushad
	invoke printf,offset format,dword ptr array[esi]
	popad
	add esi,4
	loop again 

	push 0h
	call ExitProcess
main endp
end main
