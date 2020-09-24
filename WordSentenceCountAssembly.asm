;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.

myStr:		.string "Sentence 1! Sentence 2? Sentence 3.", ''
			.data
sent_count:	.int	0
w_count:	.int	1

			.retain

			.retainrefs

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
			bis.b #0FFh,&P1DIR
			bis.b #0FFh,&P2DIR
			mov.w	#myStr, R4

loop1:		mov.b	@R4+, R6
			cmp		#0, R6
			jeq		end
			cmp 	#' ', R6
			jne 	comp1
			inc.w 	w_count
			jmp 	comp1
comp1:
			cmp 	#'.', R6
			jne		comp2
			inc.w	sent_count
			jmp 	loop1
comp2:
			cmp		#'!', R6
			jne		comp3
			inc.w	sent_count
			jmp 	loop1
comp3:
			cmp		#'?', R6
			jne 	loop1
			inc.w	sent_count
			jmp 	loop1

end:		mov.b	sent_count,&P1OUT
			mov.b	w_count,&P2OUT

			bis.w	#LPM4,SR
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
            
