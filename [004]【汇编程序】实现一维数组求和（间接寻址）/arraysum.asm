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
format byte 'the sum is : %d',10,0;�����10�����У�0�����ַ�����0��β
array dword 0h,1h,2h,3h,4h,5h,6h,7h,8h,9h;����һά���飬����ʼ����ֵ
 
.code
main Proc
	mov ecx,lengthof array;��������Ԫ�ظ�������ECX�Ĵ�����
	xor eax,eax;��EAX�Ĵ������㣬�൱��int sum = 0
	mov esi,offset array;������ĵ�ַ����ESI�Ĵ����У��൱��int* p = array
again:
	add eax,[esi];�൱��sum = sum + *p
	add esi,4;ESI = ESI + 4���൱��p++
	loop again;ECX = ECX - 1������ѭ������

	invoke printf,offset format,eax;������������൱��printf("%d\n",sum)

	push 0h
	call ExitProcess
main endp
end main
