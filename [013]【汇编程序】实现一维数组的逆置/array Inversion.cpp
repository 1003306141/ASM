#include <stdio.h>
int array[] = { 12,14,168,122,-33,56,78,99,345,66,-5 };
int main()
{
	int i = 0;
	int j = (sizeof(array) / 4) - 1;
	for (int count = 0; count < sizeof(array) / (4 * 2); count++)
	{
		int tmp = array[i];
		array[i] = array[j];
		array[j] = tmp;
		i++;
		j--;
	}
	for (int i = 0; i < sizeof(array) / 4; i++)
		printf("%d\t", array[i]);
	return 0;
}