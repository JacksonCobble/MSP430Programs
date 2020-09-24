#include <msp430.h> 
#include <stdio.h>

/**
 * main.c
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	char x[] = "Hello! Welcome to CPE325. It's a great day, isn't it?";

	int lower = 0;
	int upper = 0;
	int nums = 0;
	int tmp = 0;

	int y = 0;
	for(y = 0; y < sizeof(x); y++)
	{
	    tmp = x[y];
	    if( (tmp > 47) && (tmp < 58) )
	    {
	        nums++;
	    }
	    if( (tmp > 64) && (tmp < 91) )
	    {
	        upper++;
	    }
	    if( (tmp > 96) && (tmp < 123) )
	    {
	        lower++;
	    }
	}

	printf("String %s \n",x);
	printf("Contains: The string contains %d upper-case and %d lower-case characters and %d digits.",upper,lower,nums);

	return 0;
}
