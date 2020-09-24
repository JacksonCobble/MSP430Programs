;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
myStr:		.string	"4+5+2-1", ''
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
main:
			bis.b #0FFh,&P2DIR
            mov.w #myStr,R4
            mov.b @R4+, R6
           	jmp num01
num01:
			cmp #'1', R6
			jne num02
			mov.b #1, R6
			jmp solve
num02:
			cmp #'2', R6
			jne num03
			mov.b #2, R6
			jmp solve
num03:
			cmp #'3', R6
			jne num04
			mov.b #3, R6
			jmp solve
num04:
			cmp #'4', R6
			jne num05
			mov.b #4, R6
			jmp solve
num05:
			cmp #'5', R6
			jne num06
			mov.b #5, R6
			jmp solve
num06:
			cmp #'6', R6
			jne num07
			mov.b #6, R6
			jmp solve
num07:
			cmp #'7', R6
			jne num08
			mov.b #7, R6
			jmp solve
num08:
			cmp #'8', R6
			jne num09
			mov.b #8, R6
			jmp solve
num09:
			mov.b #9, R6
			jmp solve
solve:
			mov.b @R4+, R7
			cmp #0, R7
			jeq end
			mov.b @R4+, R8
			jmp num1
num1:
			cmp #'1', R8
			jne num2
			mov.b #1, R8
			jmp oper
num2:
			cmp #'2', R8
			jne num3
			mov.b #2, R8
			jmp oper
num3:
			cmp #'3', R8
			jne num4
			mov.b #3, R8
			jmp oper
num4:
			cmp #'4', R8
			jne num5
			mov.b #4, R8
			jmp oper
num5:
			cmp #'5', R8
			jne num6
			mov.b #5, R8
			jmp oper
num6:
			cmp #'6', R8
			jne num7
			mov.b #6, R8
			jmp oper
num7:
			cmp #'7', R8
			jne num8
			mov.b #7, R8
			jmp oper
num8:
			cmp #'8', R8
			jne num9
			mov.b #8, R8
			jmp oper
num9:
			mov.b #9, R8
			jmp oper
oper:
			cmp #'+', R7
			jeq plus
			jmp minus
plus:
			add.b R8, R6
			jmp solve
minus:
			sub.b R8, R6
			jmp solve
end:
			mov.b R6,&P2OUT
			nop
;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
