INCLUDELIB kernel32.lib;这个库用于调用Win32的ExitProcess API函数.
INCLUDELIB ucrt.lib;这个库里面有C函数的实现.
INCLUDELIB legacy_stdio_definitions.lib;这个库里面有C函数的声明,不包含这个库链接时会出错，跟VS版本有关(VS2017必须包含).

.386
.model flat,stdcall

ExitProcess PROTO,
dwExitCode:DWORD

printf    PROTO C : dword,:vararg;对printf函数声明.
scanf    PROTO C : dword,:vararg;对scanf函数声明.

.data
format byte '%s',0;用于printf函数格式化输出.
msg1 byte 'Hello,World!',10,0;用于printf函数直接输出.
msg2 byte 'Hello,World!',10,0;用于printf格式化输出.

format2 byte '%d%d',0;用于scanf函数格式化输入.
format3 byte 'value1 = %d value2 = %d',10,0;用于printf函数格式化输出.
msg3 byte 'please input two number:',10,0;用于printf函数输出提示信息.
value1 dword 0;用于存放scanf函数读入的值.
value2 dword 0;用于存放scanf函数读入的值.

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
