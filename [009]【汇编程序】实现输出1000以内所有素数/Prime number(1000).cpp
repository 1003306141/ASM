#include <stdio.h>
int Prime[1000];
int main()
{
	int Pcounter = 0;
	for (int i = 6; i < 1000; i++)
	{
		for (int j = 2; j < i/2; j++)
		{
			if (i%j == 0)
				break;
			if (j == i / 2 - 1)
				Prime[Pcounter++] = i;
		}
	}
	printf("2\t3\t5\t");
	for (int i = 0; i < Pcounter; i++)
		printf("%d\t", Prime[i]);
	return 0;
}