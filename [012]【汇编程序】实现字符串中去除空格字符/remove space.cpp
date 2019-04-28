#include <stdio.h>
#include <string.h>
char string[] = "hello world ni hao shi jie!";
int main()
{
	int scanP, tailP;
	scanP = tailP = strlen(string);
	while (scanP >= 0)
	{
		if (string[scanP] == ' ')
		{
			for (int i = scanP; i < tailP; i++)
			{
				string[i] = string[i + 1];
			}
			tailP--;
		}
		scanP--;
	}
	printf("%s\n", string);
	return 0;
}