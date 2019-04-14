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
msg byte 'Hello,Assembly!'

.code
main Proc
	mov eax,offset msg
	push 0h
	push 0h
	push eax
	push 0h
	call MessageBoxA
	push 0h
	call ExitProcess
main endp
end main