_main:
;MyProject_main.c,21 :: 		void main() {
;MyProject_main.c,23 :: 		TFT_Rotate_180(1);
MOVS	R0, #1
BL	_TFT_Rotate_180+0
;MyProject_main.c,24 :: 		Start_TP();
BL	_Start_TP+0
;MyProject_main.c,26 :: 		while (1) {
L_main0:
;MyProject_main.c,28 :: 		Check_TP();
BL	_Check_TP+0
;MyProject_main.c,30 :: 		}
IT	AL
BAL	L_main0
;MyProject_main.c,31 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
