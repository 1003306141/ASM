#include <stdio.h>
#include <stdlib.h>

void function()
{
	printf("hello,function!\n");
	getchar();
	exit(0);
}

void test()
{
	__asm
	{
		mov eax,function
		mov [ebp+4],eax
	}
}

int main()
{
	test();
	printf("hello,world!\n");
	return 0;
}