INCLUDELIB kernel32.lib
INCLUDELIB user32.lib
 
.386
.model flat,stdcall
 
MessageBoxA PROTO,
hwnd:DWORD,
lpText:DWORD,
lpCaption:DWORD,
uType:DWORD

ExitProcess PROTO,
dwExitCode:DWORD
 
.data
msg byte 'Hello,Assembly Language!',0

.code
main Proc
	;push 0h
	;push 1h
	;push 2h
	;push 3h
	push 4h
	;push 5h
	;push 6h
	;push 10h
	;push 20h
	;push 30h
	;push 40h
	;push 1000h
	;push 2000h
	mov eax,offset msg
	push 0h
	push eax
	push 0h
	call MessageBoxA

	push 0h
	call ExitProcess
main endp
end main
