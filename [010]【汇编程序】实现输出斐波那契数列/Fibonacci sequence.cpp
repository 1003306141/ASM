#include <stdio.h>
int array[20] = { 0 };
int main()
{
	array[0] = 1;
	array[1] = 1;
	for (int i = 2; i < 20; i++)
		array[i] = array[i - 1] + array[i - 2];
	for (int i = 0; i < 20; i++)
		printf("%d\t", array[i]);
	return 0;
}