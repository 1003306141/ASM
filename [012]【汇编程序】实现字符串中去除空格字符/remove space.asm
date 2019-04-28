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
string byte 'hello world ni hao shi jie!',0
format byte '%s',10,0

.code
main Proc
	mov esi,lengthof string - 1;esi==scanP
	mov edi,esi;edi==tailP
	jmp testing
body:
	cmp byte ptr string[esi],20h
	jne over

	mov ebx,esi;ebx==moveP
	jmp testing2
body2:
	mov al,byte ptr string[ebx+1]
	mov byte ptr string[ebx],al
	inc ebx
testing2:
	cmp ebx,edi
	jl body2

	dec edi
over:
	dec esi
testing:
	cmp esi,0
	jge body

	invoke printf,offset format,offset string

	push 0h
	call ExitProcess
main endp
end main
