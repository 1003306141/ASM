#include <stdio.h>
int main()
{
	char ch1;
	printf("please input the letter.\n");
	scanf("%c", &ch1);
	if (ch1 >= 'a' && ch1 <= 'z')
		printf("Lowercase letter!\n");
	else if (ch1 >= 'A' && ch1 <= 'Z')
		printf("Uppercase letter!\n");
	return 0;
}