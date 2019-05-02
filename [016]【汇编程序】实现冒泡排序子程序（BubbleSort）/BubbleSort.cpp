#include <stdio.h>

int array[10] = { 10,9,8,7,6,5,4,3,2,1 };
void BubbleSort(int arr[], int n)
{
	for (int i = 0; i < n - 1; i++)
		for (int j = 0; j < n - i - 1; j++)
		{
			if (arr[j] > arr[j + 1])
			{
				int tmp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = tmp;
			}
		}
}
int main()
{
	BubbleSort(array, 10);
	for (int i = 0; i < 10; i++)
		printf("%d\t", array[i]);
	return 0;
}