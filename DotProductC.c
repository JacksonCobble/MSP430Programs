#include <msp430.h> 
#include <stdio.h>

/**
 * main.c
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	//initializing both arrays
	int array1[] = {3, 4, 6, 7, 8};
	int array2[] = {1, 2, 3, 4, 5};

	//assigning values for out dot product, tmp , and i for loop
	int dotproduct = 0;
	unsigned int tmp;
	int i;

	for(i = 0; i < (sizeof(array1)/sizeof(int)); i++) //for loop goes through array
	{
	    tmp = array1[i] * array2[i];
	    dotproduct = dotproduct + tmp;
	}


	//printing contents of array 1 and 2 using for loops
	printf("Contents of array 1: ");
	for(i = 0; i < (sizeof(array1)/sizeof(int)); i++) //for loop goes through array
	{
	    printf("%d ", array1[i]);
	}
	printf("\n");

	printf("Contents of array 2: ");
	for(i = 0; i < (sizeof(array1)/sizeof(int)); i++) //for loop goes through array
	{
	    printf("%d ", array2[i]);
	}
	printf("\n");

	printf("The dot product is:%d", dotproduct); //printing dot product

	return 0;
}
