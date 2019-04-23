#include <stdio.h>
int main()
{
	printf("Leap year is follow:\n");
	for (int i = 2012; i < 2100; i++)
	{
		if ((i % 4 == 0 && i % 100 != 0) || (i % 400 == 0))
			printf("%d\t",i);
	}
	return 0;
}