#include <stdio.h>
int array[] = { 0,1,2,3,4,5,6,7,8,9 };

int main()
{
	int sum = 0;
	int* p = array;

	for (int i = 0; i < 10; i++)
	{
		sum = sum + *p;
		p++;
	}

	printf("the sum is : %d\n", sum);
	return 0;
}