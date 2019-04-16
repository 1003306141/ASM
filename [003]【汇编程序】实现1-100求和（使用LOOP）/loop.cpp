#include <stdio.h>
int main()
{
	int sum = 0;
	int count = 100;
	do
	{
		sum = sum + count;
		count = count - 1;
	} while (count != 0);
	printf("the sum is : %d\n", sum);
	return 0;
}