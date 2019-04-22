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
sformat byte '%d',0
msg byte 'please input the year.',10,0
msg1 byte '%d is leap year.',10,0
msg2 byte '%d is not leap year.',10,0
year dword 0

.code
main Proc
	invoke printf,offset msg
	invoke scanf,offset sformat,offset year

	mov eax,dword ptr year
	mov ebx,4
	cdq
	div ebx
	cmp edx,0
	jne next
	mov eax,dword ptr year
	mov ebx,100
	cdq
	div ebx
	cmp edx,100
	je next
	invoke printf,offset msg1,dword ptr year;success
	jmp over
next:
	mov eax,dword ptr year
	mov ebx,400
	cdq
	div ebx
	cmp edx,0
	jne next2
	invoke printf,offset msg1,dword ptr year;success
	jmp over
next2:
	invoke printf,offset msg2,dword ptr year;unsuccess

over:
	push 0h
	call ExitProcess
main endp
end main
	