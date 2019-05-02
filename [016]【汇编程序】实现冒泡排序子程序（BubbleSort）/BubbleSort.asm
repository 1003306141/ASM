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
array dword 10,9,8,7,6,5,4,3,2,1
msg byte '%d',9,0

.code

main Proc
	mov ecx,lengthof array - 1
	mov esi,offset array
	push ecx
	push esi
	call BubbleSort

	mov ecx,lengthof array
	xor esi,esi
again:
	pushad
	invoke printf,offset msg,dword ptr array[esi*4]
	popad
	inc esi
	loop again

	push 0h
	call ExitProcess
main endp

BubbleSort proc
	push ebp
	mov ebp,esp

	pushad

	mov edx,dword ptr [ebp+8]
	mov ecx,dword ptr [ebp+12]
again:
	push ecx
	xor esi,esi

l1:
	mov eax,[edx + esi*4]
	mov ebx,[edx + esi*4 + 4]
	cmp eax,ebx
	jle next
	mov [edx + esi*4],ebx
	mov [edx + esi*4 + 4],eax
next:
	inc esi
	loop l1

	pop ecx
	loop again

	popad

	pop ebp
	ret 8
BubbleSort endp

end main
