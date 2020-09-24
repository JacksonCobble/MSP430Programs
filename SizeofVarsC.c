#include <msp430.h> 
#include <stdio.h>
#include <limits.h>
#include <float.h>

void printdash();
void printdash()
{
    int i;
        for(i = 0; i < 127; i++)
        {
            printf("-");
        }
        printf("\n");
}
/**
 * main.c
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer

	printdash();

	printf("%-30s%-20s%-24s%-52s|\n", "| Data Type", "| Size (in bytes)", "| Minimum", "| Maximum");

	printdash();

	printf("%-30s| %-18zu| %-22d| %-50d|\n", "| char", sizeof(char), SCHAR_MIN, SCHAR_MAX); //SIGNED CHAR

	printf("%-30s| %-18zu| %-22d| %-50d|\n", "| short int", sizeof(short int), SHRT_MIN, SHRT_MAX); // SIGNED SHORT INT

	printf("%-30s| %-18zu| %-22d| %-50d|\n", "| int", sizeof(int), INT_MIN, INT_MAX); // SIGNED INT

	printf("%-30s| %-18zu| %-22ld| %-50ld|\n", "| long int", sizeof(long int), LONG_MIN, LONG_MAX); // SIGNED LONG INT

	printf("%-30s| %-18zu| %-22lld| %-50lld|\n", "| long long int", sizeof(long long int), LLONG_MIN, LLONG_MAX); //SIGNED LONG LONG INT

	printf("%-30s| %-18zu| %-22d| %-50d|\n", "| unsigned char", sizeof(unsigned char), 0, UCHAR_MAX); // UNSIGNED CHAR

	printf("%-30s| %-18zu| %-22d| %-50hu|\n", "| unsigned short int", sizeof(unsigned short int), 0, USHRT_MAX); // UNSIGNED SHORT INT

	printf("%-30s| %-18zu| %-22d| %-50u|\n", "| unsigned int", sizeof(unsigned int), 0, UINT_MAX); // UNSIGNED INT

	printf("%-30s| %-18zu| %-22d| %-50lu|\n", "| unsigned long int", sizeof(unsigned long int), 0, ULONG_MAX); // UNSIGNED LONG INT

	printf("%-30s| %-18zu| %-22d| %-50llu|\n", "| unsigned long long int", sizeof(unsigned long long int), 0, ULLONG_MAX);// UNSIGNED LONG LONG INT

	printf("%-30s| %-18zu| %-22f| %-50f|\n", "| float", sizeof(float), FLT_MIN, FLT_MAX); // FLOAT

	printf("%-30s| %-18zu| %-22e| %-50e|\n", "| double", sizeof(double), DBL_MIN, DBL_MAX); // DOUBLE



	printdash();

	return 0;
}
