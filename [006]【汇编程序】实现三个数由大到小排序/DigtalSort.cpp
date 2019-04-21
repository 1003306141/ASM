#include <stdio.h>

int value1 = 0;
int value2 = 0;
int value3 = 0;
int main()
{
	printf("Please input three number.\n");
	scanf("%d%d%d", &value1, &value2, &value3);
	if (value1 < value2)
	{
		int tmp = value1;
		value1 = value2;
		value2 = tmp;
	}
	if (value1 < value3)
	{
		int tmp = value1;
		value1 = value3;
		value3 = tmp;
	}
	if (value2 < value3)
	{
		int tmp = value2;
		value2 = value3;
		value3 = tmp;
	}
	printf("%d > %d > %d\n",value1,value2,value3);
	return 0;
}