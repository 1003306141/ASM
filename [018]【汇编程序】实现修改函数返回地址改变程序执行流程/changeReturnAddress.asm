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
format byte '%d',0
value dword 0
msg1 byte 'the return address is ret1',10,0
msg2 byte 'the return address is ret2',10,0

.code

main Proc
	push offset ret2
	call function
ret1:invoke printf,offset msg1
ret2:invoke printf,offset msg2

	invoke scanf,offset format,offset value;������������ֹ����ֱ�ӽ����������۲�������
	push 0h
	call ExitProcess
main endp

function proc
	push ebp
	mov ebp,esp
	mov eax,dword ptr [ebp+8];ȡ���������ֵ
	mov [ebp+4],eax;�޸ķ��ص�ַ
	pop ebp
	ret 4
function endp

end main
