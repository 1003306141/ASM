INCLUDELIB kernel32.lib;��������ڵ���Win32��ExitProcess API����.
INCLUDELIB ucrt.lib;�����������C������ʵ��.
INCLUDELIB legacy_stdio_definitions.lib;�����������C����������,���������������ʱ�������VS�汾�й�(VS2017�������).

.386
.model flat,stdcall

ExitProcess PROTO,
dwExitCode:DWORD

printf    PROTO C : dword,:vararg;��printf��������.
scanf    PROTO C : dword,:vararg;��scanf��������.

.data
format byte '%s',0;����printf������ʽ�����.
msg1 byte 'Hello,World!',10,0;����printf����ֱ�����.
msg2 byte 'Hello,World!',10,0;����printf��ʽ�����.

format2 byte '%d%d',0;����scanf������ʽ������.
format3 byte 'value1 = %d value2 = %d',10,0;����printf������ʽ�����.
msg3 byte 'please input two number:',10,0;����printf���������ʾ��Ϣ.
value1 dword 0;���ڴ��scanf���������ֵ.
value2 dword 0;���ڴ��scanf���������ֵ.

.code
main Proc
	invoke printf,offset msg1
	invoke printf,offset format,offset msg2
	invoke printf,offset msg3
	invoke scanf,offset format2,offset value1,offset value2
	invoke printf,offset format3,dword ptr value1,dword ptr value2
	push 0h
	call ExitProcess
main endp
end main
