#include <stdio.h>

int dvar1 = 12;
int dvar2 = 6;
int dvar3 = 18;
int gcd(int a, int b)
{
	int tmp = b;
	while (a%b != 0)
	{
		tmp = a % b;
		a = b;
		b = tmp;
	}
	return tmp;
}
int main()
{
	int res = gcd(dvar1, gcd(dvar2, dvar3));
	printf("the result is : %d\n", res);
	return 0;
}