#include <stdio.h>
int main()
{
	int count = 0;
	for (int i = 0; i < 10000; i++)
	{
		int tmp = i;
		int result = 0;
		while (tmp != 0)
		{
			result = result * 10 + tmp % 10;
			tmp = tmp / 10;
		}
		if (result == i)
		{
			printf("%d\t", result);
			count++;
			if (count % 10 == 0)
				printf("\n");
		}
	}
	return 0;
}