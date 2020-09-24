#include <msp430.h> 

#define S1 P2IN&BIT1
#define S2 P1IN&BIT1
/**
 * main.c
 */
int main(void)
{
	//WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer

	//interfacing LED 1 and LED 2 as outputs
	P1DIR |= BIT0; //P1.0 Output direction
	P4DIR |= BIT7; //P4.7 Output direction
	P1OUT &= ~BIT0; //led 1 is OFF
	P4OUT |= BIT7; //led 2 is ON

	P2DIR &= ~BIT1;
	P2REN |= BIT1;
	P2OUT |= BIT1;

	P1DIR &= ~BIT1;
	P1REN |= BIT1;
	P2OUT |= BIT1;

	unsigned int i = 0;

	while(1)
	{
	    if((S1) == 0)
	    {
	        for(i = 0; i < 2000; i++);
	        if((S1) == 0)
	        {
	            P4OUT &= ~BIT7;
	            while((S1) == 0)
	                        {
	                            for(i = 0; i < 50000; i++);
	                            P1OUT ^= BIT0;
	                        }
	            P1OUT &= ~BIT0;
	            P4OUT |= BIT7;
	        }
	        P1OUT &= ~BIT0;
	        P4OUT |= BIT7;
	    }
	    if((S2) == 0)
	    {
	        for(i = 0; i < 2000; i++);
	        if((S2) == 0)
	        {
	            P1OUT |= BIT0;
	            while((S2) == 0)
	            {
	                for(i = 0; i < 20000; i++);
	                P4OUT ^= BIT7;
	            }
	            P1OUT &= ~BIT0;
	            P4OUT |= BIT7;
	        }
	        P1OUT &= ~BIT0;
	        P4OUT |= BIT7;
	    }
	    else
	    {
	        P1OUT &= ~BIT0;
	        P4OUT |= BIT7;
	    }
	    P1OUT &= ~BIT0;
	    P4OUT |= BIT7;
	}
}
