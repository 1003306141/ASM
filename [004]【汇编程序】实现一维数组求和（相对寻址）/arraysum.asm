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
array dword 0h,1h,2h,3h,4h,5h,6h,7h,8h,9h;定义一维数组，并初始化赋值
 
.code
main Proc
	mov ecx,lengthof array;将数组中元素个数放入ECX寄存器中
	xor eax,eax;将EAX寄存器清零，相当于int sum = 0
	xor esi,esi;将ESI寄存器清零，相当于int i = 0
again:
	add eax,dword ptr array[esi*4];相当于 sum = sum + array[i]
	inc esi;ESI = ESI + 1，相当于i++
	loop again;ECX = ECX - 1，用于循环计数

	invoke printf,offset format,eax;输出计算结果，相当于printf("%d\n",sum)

	push 0h
	call ExitProcess
main endp
end main
