			.cdecls C,LIST,"msp430.h"

			.def	calcpwr
			.ref 	swmult
			.ref 	hwmult
			.text

calcpwr:
			mov.w 6(SP), R8		;R8 holds value to be multiplied
			mov.w 4(SP), R9		;R9 holds address of hwarr
			mov.w R8, 0(R9)		;puts first value of hwarr in place

			clr R10
			mov.w #1, R10		;make R10 our counter

hwloop:		call #hwmult		;subroutine call

			inc.w R9			;inc by 2 because our addresses are 2 bytes large
			inc.w R9
			inc.w R10			;inc counter and check to see if it has been done 5 times
			cmp #5, R10
			jne hwloop

			mov.w 2(SP), R9
			mov.w R8, 0(R9)

			clr R10
			mov.w #1, R10

swloop:		call #swmult

			inc.w R9			;inc by 2 because our addresses are 2 bytes large
			inc.w R9
			inc.w R10			;inc counter and check to see if it has been done 5 times
			cmp #5, R10
			jne swloop

			ret







			.end
