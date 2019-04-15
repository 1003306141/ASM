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
	xor ecx,ecx;将ECX寄存器的值清零，相当与int sum = 0
	mov esi,1;给ESI寄存器赋初值1，相当于int i = 1
	jmp testing;跳转到条件测试
body:
	mov eax,esi;将ESI的值赋给EAX,EAX为被除数
	mov ebx,2;将2赋值给EBX,EBX为除数
	cdq
	div ebx;EAX / EBX ,EDX存有结果的余数
	cmp edx,0;EDX的值和0进行比较
	jne next;不为0则跳转到next
	add ecx,esi;为0则代表为偶数，这里进行累加，相当于sum = sum + i
next:
	inc esi;ESI = ESI + 1，相当于i++
testing:
	cmp esi,100;将esi和100的值进行比较，相当于 i <= 100
	jle body;跳转到body

	invoke printf,offset format,ecx;输出计算结果，相当于printf("%d\n",sum)
	
	push 0h
	call ExitProcess
main endp
end main