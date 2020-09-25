			.cdecls C,LIST,"msp430.h"

			.def	swmult

			.text

swmult:
			push R10		;pushing on to stack. R10 will be C
			push R8			;R8 will be A
			push R9			;R9 will be B

			mov.w 0(SP), R9
			mov.w @R9, R9
			mov.w 2(SP), R8
			mov.w #0, R10

			clr R11
			mov.w #0, R11 	;R11 will be our counter
loop:		bit.w #1, R9
			jnz add
loop2:		add.w R8, R8
			rra.w R9
			inc.w R11
			cmp #8, R11
			jeq end
			jmp loop

add:		add.w R8, R10
			jmp loop2

end:		pop R9			;popping R9 back
			mov.w R10, 2(R9);placing value C into R9 memory
			pop R8			;pop R8 back
			pop R10			;pop R10 back
			ret
			.end
