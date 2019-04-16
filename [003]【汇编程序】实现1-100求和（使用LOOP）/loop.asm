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
format byte 'the sum is : %d',10,0;这里的10代表换行，0代表字符串以0结尾

.code
main Proc
	xor eax,eax;将EAX寄存器的值清零，相当于int sum = 0
	mov ecx,100;给ECX寄存器赋初值100，相当于 int count = 100
again:
	add eax,ecx;EAX = EAX + ECX，相当于 sum = sum + count
	loop again;ECX = ECX - 1，相当于 count = count - 1
	
	invoke printf,offset format,eax;输出计算结果，相当于printf("%d\n",sum)

	push 0h
	call ExitProcess
main endp
end main
	