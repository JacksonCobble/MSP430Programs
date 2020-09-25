			.cdecls C,LIST,"msp430.h"

			.def	hwmult
			.text

hwmult:
			push R8				;push R8 on stack
			push R9				;push R9 on stack

			mov.w 0(SP), R9		;basic use of multiplication, reusing R8/R9
			mov.w 2(SP), R8
			mov.w @R9, R9
			mov R9, &MPY
			mov R8, &OP2

			nop
			nop
			nop

			pop R9				;pop R9 back
			pop R8				;pop R8 back

			mov.w RESLO, 2(R9)	;place value into our array
			ret




			.end
