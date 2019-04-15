#include <stdio.h>
int main()
{
	int sum = 0;
	for (int i = 1; i <= 100; i++)
	{
		if (i % 2 == 0)
			sum = sum + i;
	}
	printf("the sum is : %d\n", sum);
	return 0;
}