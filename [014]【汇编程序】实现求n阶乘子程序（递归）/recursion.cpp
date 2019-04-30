#include <stdio.h>

int sum = 0;
int recursion(int n)
{
	if (n == 0)
		return 1;
	return n * recursion(n - 1);
}
int main()
{
	for (int i = 1; i <= 8; i++)
	{
		int tmp = recursion(i);
		printf("%d! == %d\n", i, tmp);
		sum = sum + tmp;
	}
	printf("sum is %d\n", sum);
	return 0;
}