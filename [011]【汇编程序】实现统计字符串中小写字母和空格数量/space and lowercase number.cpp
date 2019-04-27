#include <stdio.h>
#include <string.h>
char msg[] = "Hello World!";
int main()
{
	int space = 0;
	int lowercase = 0;
	for (int i = 0; i < strlen(msg); i++)
	{
		if (msg[i] >= 'a' && msg[i] <= 'z')
			lowercase++;
		if (msg[i] == ' ')
			space++;
	}
	printf("space number: %d lowercase number: %d\n", space, lowercase);
	return 0;
}