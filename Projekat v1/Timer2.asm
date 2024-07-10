_Timer2_Init:
;Timer2.c,6 :: 		void Timer2_Init(double period) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
; period start address is: 0 (R0)
VMOV.F32	S1, S0
; period end address is: 0 (R0)
; period start address is: 4 (R1)
;Timer2.c,9 :: 		uint32_t Y=0;
;Timer2.c,10 :: 		double X=0.0;
;Timer2.c,11 :: 		X = 60000000.0 * period;
MOVW	R1, #57792
MOVT	R1, #19556
VMOV	S0, R1
VMUL.F32	S0, S0, S1
; period end address is: 4 (R1)
;Timer2.c,12 :: 		Y =(uint32_t) X;
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
;Timer2.c,14 :: 		SIM_SCGC6 |= (1ul << PIT);     // Enable clock gating for Periodic interrupt timers
MOVW	R1, #lo_addr(SIM_SCGC6+0)
MOVT	R1, #hi_addr(SIM_SCGC6+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #8388608
MOVW	R1, #lo_addr(SIM_SCGC6+0)
MOVT	R1, #hi_addr(SIM_SCGC6+0)
STR	R2, [R1, #0]
;Timer2.c,15 :: 		PIT_MCR = 0x00;
MOVS	R2, #0
MOVW	R1, #lo_addr(PIT_MCR+0)
MOVT	R1, #hi_addr(PIT_MCR+0)
STR	R2, [R1, #0]
;Timer2.c,17 :: 		PIT_LDVAL2 = Y;       // Set timer prescaler. (120MHz, 500ms),  PIT_LDVAL2 = 120 [MHz] / 2 * interval [sec] , pri cemu je ovde interval 0.5 sekundi
MOVW	R1, #lo_addr(PIT_LDVAL2+0)
MOVT	R1, #hi_addr(PIT_LDVAL2+0)
STR	R3, [R1, #0]
;Timer2.c,19 :: 		NVIC_IntEnable(IVT_INT_PIT2);  // Enable timer interrupts
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;Timer2.c,20 :: 		PIT_TCTRL2 = (1 << TIE);              // enable Timer 2 interrupts
MOVW	R2, #2
MOVW	R1, #lo_addr(PIT_TCTRL2+0)
MOVT	R1, #hi_addr(PIT_TCTRL2+0)
STR	R2, [R1, #0]
;Timer2.c,21 :: 		PIT_TCTRL2 |= (1 << TEN);             // start Timer 2
MOVW	R1, #lo_addr(PIT_TCTRL2+0)
MOVT	R1, #hi_addr(PIT_TCTRL2+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(PIT_TCTRL2+0)
MOVT	R1, #hi_addr(PIT_TCTRL2+0)
STR	R2, [R1, #0]
;Timer2.c,23 :: 		}
L_end_Timer2_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_Init
