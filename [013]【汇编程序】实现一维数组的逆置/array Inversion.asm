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
array dword  12,14,168,122,-33,56,78,99,345,66,-5
format byte '%d',9,0

.code
main Proc
	mov esi,offset array
	mov edi,esi
	add edi,(lengthof array - 1)*4
	mov ecx,(lengthof array)/2
again:	
	mov eax,[esi]
	mov ebx,[edi]
	mov [esi],ebx
	mov [edi],eax
	add esi,4
	sub edi,4
	loop again

	mov ecx,lengthof array
	xor esi,esi
print:	
	pushad
	invoke printf,offset format,dword ptr array[esi*4]
	popad
	inc esi
	loop print
	
	push 0h
	call ExitProcess
main endp
end main
