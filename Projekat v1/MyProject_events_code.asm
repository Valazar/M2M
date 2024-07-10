_Timer2_interrupt:
;MyProject_events_code.c,54 :: 		void Timer2_interrupt() iv IVT_INT_PIT2 {
;MyProject_events_code.c,56 :: 		seconds ++;
MOVW	R1, #lo_addr(_seconds+0)
MOVT	R1, #hi_addr(_seconds+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,64 :: 		PIT_TFLG2.TIF = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(PIT_TFLG2+0)
MOVT	R0, #hi_addr(PIT_TFLG2+0)
_SX	[R0, ByteOffset(PIT_TFLG2+0)]
;MyProject_events_code.c,66 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_startGame:
;MyProject_events_code.c,68 :: 		void startGame(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,70 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_events_code.c,71 :: 		newGame = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,72 :: 		seconds = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_seconds+0)
MOVT	R0, #hi_addr(_seconds+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,73 :: 		minutes = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_minutes+0)
MOVT	R0, #hi_addr(_minutes+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,74 :: 		Timer2_Init(1);
VMOV.F32	S0, #1
BL	_Timer2_Init+0
;MyProject_events_code.c,75 :: 		}
L_end_startGame:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _startGame
_showImage1:
;MyProject_events_code.c,78 :: 		void showImage1(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,80 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage10
;MyProject_events_code.c,81 :: 		buttonNum =1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,82 :: 		pictureNum =1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,83 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,84 :: 		TFT_image(60,45,bajic_bmp,1);
MOVW	R0, #lo_addr(_bajic_bmp+0)
MOVT	R0, #hi_addr(_bajic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #45
MOVS	R0, #60
BL	_TFT_Image+0
;MyProject_events_code.c,85 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,86 :: 		}
L_showImage10:
;MyProject_events_code.c,88 :: 		}
L_end_showImage1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage1
_showImage2:
;MyProject_events_code.c,90 :: 		void showImage2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,92 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage21
;MyProject_events_code.c,93 :: 		buttonNum =2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,94 :: 		pictureNum =4;
MOVS	R1, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,95 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,96 :: 		TFT_image(180,45,miraa_bmp,1);
MOVW	R0, #lo_addr(_miraa_bmp+0)
MOVT	R0, #hi_addr(_miraa_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #45
MOVS	R0, #180
BL	_TFT_Image+0
;MyProject_events_code.c,97 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,98 :: 		}
L_showImage21:
;MyProject_events_code.c,100 :: 		}
L_end_showImage2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage2
_showImage3:
;MyProject_events_code.c,102 :: 		void showImage3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,104 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage32
;MyProject_events_code.c,105 :: 		buttonNum =3;
MOVS	R1, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,106 :: 		pictureNum =2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,107 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,108 :: 		TFT_image(300,45,bodic_bmp,1);
MOVW	R0, #lo_addr(_bodic_bmp+0)
MOVT	R0, #hi_addr(_bodic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #45
MOVW	R0, #300
BL	_TFT_Image+0
;MyProject_events_code.c,109 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,110 :: 		}
L_showImage32:
;MyProject_events_code.c,112 :: 		}
L_end_showImage3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage3
_showImage4:
;MyProject_events_code.c,114 :: 		void showImage4(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,116 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage43
;MyProject_events_code.c,117 :: 		buttonNum =4;
MOVS	R1, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,118 :: 		pictureNum =3;
MOVS	R1, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,119 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,120 :: 		TFT_image(420,45,kalman_bmp,1);
MOVW	R0, #lo_addr(_kalman_bmp+0)
MOVT	R0, #hi_addr(_kalman_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #45
MOVW	R0, #420
BL	_TFT_Image+0
;MyProject_events_code.c,121 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,122 :: 		}
L_showImage43:
;MyProject_events_code.c,124 :: 		}
L_end_showImage4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage4
_showImage5:
;MyProject_events_code.c,126 :: 		void showImage5(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,128 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage54
;MyProject_events_code.c,129 :: 		buttonNum =5;
MOVS	R1, #5
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,130 :: 		pictureNum =5;
MOVS	R1, #5
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,131 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,132 :: 		TFT_image(60,145,rajss_bmp,1);
MOVW	R0, #lo_addr(_rajss_bmp+0)
MOVT	R0, #hi_addr(_rajss_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #145
MOVS	R0, #60
BL	_TFT_Image+0
;MyProject_events_code.c,133 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,134 :: 		}
L_showImage54:
;MyProject_events_code.c,136 :: 		}
L_end_showImage5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage5
_showImage6:
;MyProject_events_code.c,138 :: 		void showImage6(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,140 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage65
;MyProject_events_code.c,141 :: 		buttonNum =6;
MOVS	R1, #6
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,142 :: 		pictureNum =6;
MOVS	R1, #6
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,143 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,144 :: 		TFT_image(180,145,brkicc_bmp,1);
MOVW	R0, #lo_addr(_brkicc_bmp+0)
MOVT	R0, #hi_addr(_brkicc_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #145
MOVS	R0, #180
BL	_TFT_Image+0
;MyProject_events_code.c,145 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,146 :: 		}
L_showImage65:
;MyProject_events_code.c,148 :: 		}
L_end_showImage6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage6
_showImage7:
;MyProject_events_code.c,150 :: 		void showImage7(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,152 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage76
;MyProject_events_code.c,153 :: 		buttonNum =7;
MOVS	R1, #7
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,154 :: 		pictureNum =4;
MOVS	R1, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,155 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,156 :: 		TFT_image(300,145,miraa_bmp,1);
MOVW	R0, #lo_addr(_miraa_bmp+0)
MOVT	R0, #hi_addr(_miraa_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #145
MOVW	R0, #300
BL	_TFT_Image+0
;MyProject_events_code.c,157 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,158 :: 		}
L_showImage76:
;MyProject_events_code.c,160 :: 		}
L_end_showImage7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage7
_showImage8:
;MyProject_events_code.c,162 :: 		void showImage8(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,164 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage87
;MyProject_events_code.c,165 :: 		buttonNum =8;
MOVS	R1, #8
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,166 :: 		pictureNum =7;
MOVS	R1, #7
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,167 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,168 :: 		TFT_image(420,145,kisic_bmp,1);
MOVW	R0, #lo_addr(_kisic_bmp+0)
MOVT	R0, #hi_addr(_kisic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #145
MOVW	R0, #420
BL	_TFT_Image+0
;MyProject_events_code.c,169 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,171 :: 		}
L_showImage87:
;MyProject_events_code.c,173 :: 		}
L_end_showImage8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage8
_showImage9:
;MyProject_events_code.c,175 :: 		void showImage9(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,177 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage98
;MyProject_events_code.c,178 :: 		buttonNum =9;
MOVS	R1, #9
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,179 :: 		pictureNum =8;
MOVS	R1, #8
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,180 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,181 :: 		TFT_image(60,245,tomic_bmp,1);
MOVW	R0, #lo_addr(_tomic_bmp+0)
MOVT	R0, #hi_addr(_tomic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #245
MOVS	R0, #60
BL	_TFT_Image+0
;MyProject_events_code.c,182 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,183 :: 		}
L_showImage98:
;MyProject_events_code.c,185 :: 		}
L_end_showImage9:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage9
_showImage10:
;MyProject_events_code.c,187 :: 		void showImage10(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,189 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage109
;MyProject_events_code.c,190 :: 		buttonNum =10;
MOVS	R1, #10
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,191 :: 		pictureNum =6;
MOVS	R1, #6
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,192 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,193 :: 		TFT_image(180,245,brkicc_bmp,1);
MOVW	R0, #lo_addr(_brkicc_bmp+0)
MOVT	R0, #hi_addr(_brkicc_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #245
MOVS	R0, #180
BL	_TFT_Image+0
;MyProject_events_code.c,194 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,195 :: 		}
L_showImage109:
;MyProject_events_code.c,197 :: 		}
L_end_showImage10:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage10
_showImage11:
;MyProject_events_code.c,199 :: 		void showImage11(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,201 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage1110
;MyProject_events_code.c,202 :: 		buttonNum =11;
MOVS	R1, #11
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,203 :: 		pictureNum =7;
MOVS	R1, #7
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,204 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,205 :: 		TFT_image(300,245,kisic_bmp,1);
MOVW	R0, #lo_addr(_kisic_bmp+0)
MOVT	R0, #hi_addr(_kisic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #245
MOVW	R0, #300
BL	_TFT_Image+0
;MyProject_events_code.c,206 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,207 :: 		}
L_showImage1110:
;MyProject_events_code.c,209 :: 		}
L_end_showImage11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage11
_showImage12:
;MyProject_events_code.c,211 :: 		void showImage12(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,213 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage1211
;MyProject_events_code.c,214 :: 		buttonNum =12;
MOVS	R1, #12
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,215 :: 		pictureNum =8;
MOVS	R1, #8
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,216 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,217 :: 		TFT_image(420,245,tomic_bmp,1);
MOVW	R0, #lo_addr(_tomic_bmp+0)
MOVT	R0, #hi_addr(_tomic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #245
MOVW	R0, #420
BL	_TFT_Image+0
;MyProject_events_code.c,218 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,219 :: 		}
L_showImage1211:
;MyProject_events_code.c,221 :: 		}
L_end_showImage12:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage12
_showImage13:
;MyProject_events_code.c,223 :: 		void showImage13(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,225 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage1312
;MyProject_events_code.c,226 :: 		buttonNum =13;
MOVS	R1, #13
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,227 :: 		pictureNum =3;
MOVS	R1, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,228 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,229 :: 		TFT_image(60,345,kalman_bmp,1);
MOVW	R0, #lo_addr(_kalman_bmp+0)
MOVT	R0, #hi_addr(_kalman_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVW	R1, #345
MOVS	R0, #60
BL	_TFT_Image+0
;MyProject_events_code.c,230 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,231 :: 		}
L_showImage1312:
;MyProject_events_code.c,233 :: 		}
L_end_showImage13:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage13
_showImage14:
;MyProject_events_code.c,235 :: 		void showImage14(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,237 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage1413
;MyProject_events_code.c,238 :: 		buttonNum =14;
MOVS	R1, #14
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,239 :: 		pictureNum =2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,240 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,241 :: 		TFT_image(180,345,bodic_bmp,1);
MOVW	R0, #lo_addr(_bodic_bmp+0)
MOVT	R0, #hi_addr(_bodic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVW	R1, #345
MOVS	R0, #180
BL	_TFT_Image+0
;MyProject_events_code.c,242 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,243 :: 		}
L_showImage1413:
;MyProject_events_code.c,245 :: 		}
L_end_showImage14:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage14
_showImage15:
;MyProject_events_code.c,247 :: 		void showImage15(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,249 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage1514
;MyProject_events_code.c,250 :: 		buttonNum =15;
MOVS	R1, #15
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,251 :: 		pictureNum =5;
MOVS	R1, #5
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,252 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,253 :: 		TFT_image(300,345,rajss_bmp,1);
MOVW	R0, #lo_addr(_rajss_bmp+0)
MOVT	R0, #hi_addr(_rajss_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVW	R1, #345
MOVW	R0, #300
BL	_TFT_Image+0
;MyProject_events_code.c,254 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,255 :: 		}
L_showImage1514:
;MyProject_events_code.c,257 :: 		}
L_end_showImage15:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage15
_showImage16:
;MyProject_events_code.c,259 :: 		void showImage16(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,261 :: 		if (newGame ==1){
MOVW	R0, #lo_addr(_newGame+0)
MOVT	R0, #hi_addr(_newGame+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_showImage1615
;MyProject_events_code.c,262 :: 		buttonNum =16;
MOVS	R1, #16
SXTH	R1, R1
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,263 :: 		pictureNum =1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,264 :: 		counter ++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,265 :: 		TFT_image(420,345,bajic_bmp,1);
MOVW	R0, #lo_addr(_bajic_bmp+0)
MOVT	R0, #hi_addr(_bajic_bmp+0)
MOVS	R3, #1
MOV	R2, R0
MOVW	R1, #345
MOVW	R0, #420
BL	_TFT_Image+0
;MyProject_events_code.c,266 :: 		imageFound();
BL	_imageFound+0
;MyProject_events_code.c,267 :: 		}
L_showImage1615:
;MyProject_events_code.c,269 :: 		}
L_end_showImage16:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showImage16
_imageFound:
;MyProject_events_code.c,271 :: 		void imageFound() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,272 :: 		switch(counter) {
IT	AL
BAL	L_imageFound16
;MyProject_events_code.c,273 :: 		case 1:
L_imageFound18:
;MyProject_events_code.c,274 :: 		oldCard = pictureNum;
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_oldCard+0)
MOVT	R0, #hi_addr(_oldCard+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,275 :: 		oldButtonNum = buttonNum;
MOVW	R0, #lo_addr(_buttonNum+0)
MOVT	R0, #hi_addr(_buttonNum+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_oldButtonNum+0)
MOVT	R0, #hi_addr(_oldButtonNum+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,276 :: 		break;
IT	AL
BAL	L_imageFound17
;MyProject_events_code.c,277 :: 		case 2:
L_imageFound19:
;MyProject_events_code.c,278 :: 		if(oldCard == pictureNum) {
MOVW	R0, #lo_addr(_pictureNum+0)
MOVT	R0, #hi_addr(_pictureNum+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_oldCard+0)
MOVT	R0, #hi_addr(_oldCard+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_imageFound20
;MyProject_events_code.c,279 :: 		counter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,280 :: 		guessedCounter++;
MOVW	R1, #lo_addr(_guessedCounter+0)
MOVT	R1, #hi_addr(_guessedCounter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,281 :: 		Delay_ms(50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_imageFound21:
SUBS	R7, R7, #1
BNE	L_imageFound21
NOP
NOP
NOP
;MyProject_events_code.c,283 :: 		if(guessedCounter == 8) {
MOVW	R0, #lo_addr(_guessedCounter+0)
MOVT	R0, #hi_addr(_guessedCounter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #8
IT	NE
BNE	L_imageFound23
;MyProject_events_code.c,284 :: 		win++;
MOVW	R1, #lo_addr(_win+0)
MOVT	R1, #hi_addr(_win+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,285 :: 		Delay_ms(50);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_imageFound24:
SUBS	R7, R7, #1
BNE	L_imageFound24
NOP
NOP
NOP
;MyProject_events_code.c,286 :: 		endGame();
BL	_endGame+0
;MyProject_events_code.c,287 :: 		guessedCounter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_guessedCounter+0)
MOVT	R0, #hi_addr(_guessedCounter+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,288 :: 		}
L_imageFound23:
;MyProject_events_code.c,290 :: 		} else {
IT	AL
BAL	L_imageFound26
L_imageFound20:
;MyProject_events_code.c,291 :: 		counter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,292 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_imageFound27:
SUBS	R7, R7, #1
BNE	L_imageFound27
NOP
NOP
NOP
;MyProject_events_code.c,293 :: 		flip();
BL	_flip+0
;MyProject_events_code.c,294 :: 		}
L_imageFound26:
;MyProject_events_code.c,295 :: 		break;
IT	AL
BAL	L_imageFound17
;MyProject_events_code.c,296 :: 		default:
L_imageFound29:
;MyProject_events_code.c,297 :: 		break;
IT	AL
BAL	L_imageFound17
;MyProject_events_code.c,298 :: 		}
L_imageFound16:
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_imageFound18
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_imageFound19
IT	AL
BAL	L_imageFound29
L_imageFound17:
;MyProject_events_code.c,299 :: 		}
L_end_imageFound:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _imageFound
_flip:
;MyProject_events_code.c,302 :: 		void flip() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,304 :: 		buttonNum--;
MOVW	R1, #lo_addr(_buttonNum+0)
MOVT	R1, #hi_addr(_buttonNum+0)
LDRSH	R0, [R1, #0]
SUBS	R2, R0, #1
SXTH	R2, R2
STRH	R2, [R1, #0]
;MyProject_events_code.c,305 :: 		oldButtonNum--;
MOVW	R1, #lo_addr(_oldButtonNum+0)
MOVT	R1, #hi_addr(_oldButtonNum+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,306 :: 		DrawButton(&Button1 + buttonNum);
MOVS	R0, #68
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
ADDS	R0, R0, R1
BL	_DrawButton+0
;MyProject_events_code.c,307 :: 		DrawButton(&Button1 + oldButtonNum);
MOVW	R0, #lo_addr(_oldButtonNum+0)
MOVT	R0, #hi_addr(_oldButtonNum+0)
LDRSH	R1, [R0, #0]
MOVS	R0, #68
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
ADDS	R0, R0, R1
BL	_DrawButton+0
;MyProject_events_code.c,309 :: 		}
L_end_flip:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _flip
_endGame:
;MyProject_events_code.c,311 :: 		void endGame(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,313 :: 		switch (win){
IT	AL
BAL	L_endGame30
;MyProject_events_code.c,314 :: 		case 1:
L_endGame32:
;MyProject_events_code.c,315 :: 		results[0] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+0)
MOVT	R0, #hi_addr(_results+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,316 :: 		IntToStr(results[0],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,317 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,318 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,319 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,322 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,323 :: 		case 2:
L_endGame33:
;MyProject_events_code.c,324 :: 		results[1] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+2)
MOVT	R0, #hi_addr(_results+2)
STRH	R1, [R0, #0]
;MyProject_events_code.c,325 :: 		IntToStr(results[1],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,326 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,327 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,328 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,331 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,332 :: 		case 3:
L_endGame34:
;MyProject_events_code.c,333 :: 		results[2] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+4)
MOVT	R0, #hi_addr(_results+4)
STRH	R1, [R0, #0]
;MyProject_events_code.c,334 :: 		IntToStr(results[2],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,335 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,336 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,337 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,340 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,341 :: 		case 4:
L_endGame35:
;MyProject_events_code.c,342 :: 		results[3] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+6)
MOVT	R0, #hi_addr(_results+6)
STRH	R1, [R0, #0]
;MyProject_events_code.c,343 :: 		IntToStr(results[3],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,344 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,345 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,346 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,348 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,349 :: 		case 5:
L_endGame36:
;MyProject_events_code.c,350 :: 		results[4] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+8)
MOVT	R0, #hi_addr(_results+8)
STRH	R1, [R0, #0]
;MyProject_events_code.c,351 :: 		IntToStr(results[4],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,352 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,353 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,354 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,355 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,357 :: 		case 6:
L_endGame37:
;MyProject_events_code.c,358 :: 		results[5] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+10)
MOVT	R0, #hi_addr(_results+10)
STRH	R1, [R0, #0]
;MyProject_events_code.c,359 :: 		IntToStr(results[5],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,360 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,361 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,362 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,363 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,365 :: 		case 7:
L_endGame38:
;MyProject_events_code.c,366 :: 		results[6] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+12)
MOVT	R0, #hi_addr(_results+12)
STRH	R1, [R0, #0]
;MyProject_events_code.c,367 :: 		IntToStr(results[6],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,368 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,369 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,370 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,371 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,373 :: 		case 8:
L_endGame39:
;MyProject_events_code.c,374 :: 		results[7] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+14)
MOVT	R0, #hi_addr(_results+14)
STRH	R1, [R0, #0]
;MyProject_events_code.c,375 :: 		IntToStr(results[7],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,376 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,377 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,378 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,379 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,381 :: 		case 9:
L_endGame40:
;MyProject_events_code.c,382 :: 		results[8] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+16)
MOVT	R0, #hi_addr(_results+16)
STRH	R1, [R0, #0]
;MyProject_events_code.c,383 :: 		IntToStr(results[8],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,384 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,385 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,386 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,387 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,389 :: 		case 10:
L_endGame41:
;MyProject_events_code.c,390 :: 		results[9] = seconds;
MOVW	R2, #lo_addr(_seconds+0)
MOVT	R2, #hi_addr(_seconds+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_results+18)
MOVT	R0, #hi_addr(_results+18)
STRH	R1, [R0, #0]
;MyProject_events_code.c,391 :: 		IntToStr(results[9],timeArraySeconds);
MOV	R0, R2
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
BL	_IntToStr+0
;MyProject_events_code.c,392 :: 		Label3.Caption = timeArraySeconds;
MOVW	R1, #lo_addr(_timeArraySeconds+0)
MOVT	R1, #hi_addr(_timeArraySeconds+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,393 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,394 :: 		DrawLabel(&Label3);
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
BL	_DrawLabel+0
;MyProject_events_code.c,395 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,397 :: 		default:
L_endGame42:
;MyProject_events_code.c,398 :: 		Label3.Caption ="Pokrenite igricu ponovo";
MOVW	R1, #lo_addr(?lstr1_MyProject_events_code+0)
MOVT	R1, #hi_addr(?lstr1_MyProject_events_code+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,399 :: 		DrawBox(&Box1);
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
BL	_DrawBox+0
;MyProject_events_code.c,400 :: 		DrawLabel(&Label2);
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
BL	_DrawLabel+0
;MyProject_events_code.c,401 :: 		break;
IT	AL
BAL	L_endGame31
;MyProject_events_code.c,402 :: 		}
L_endGame30:
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_endGame32
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_endGame33
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_endGame34
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_endGame35
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_endGame36
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_endGame37
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_endGame38
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_endGame39
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_endGame40
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_endGame41
IT	AL
BAL	L_endGame42
L_endGame31:
;MyProject_events_code.c,405 :: 		}
L_end_endGame:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _endGame
_showResults:
;MyProject_events_code.c,407 :: 		void showResults(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,409 :: 		bubbleSort(results, win);
MOVW	R0, #lo_addr(_win+0)
MOVT	R0, #hi_addr(_win+0)
LDRSH	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #lo_addr(_results+0)
MOVT	R0, #hi_addr(_results+0)
BL	_bubbleSort+0
;MyProject_events_code.c,411 :: 		if (results[0] != 0){
MOVW	R0, #lo_addr(_results+0)
MOVT	R0, #hi_addr(_results+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_showResults43
;MyProject_events_code.c,412 :: 		IntToStr(results[0], first);
MOVW	R0, #lo_addr(_results+0)
MOVT	R0, #hi_addr(_results+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_first+0)
MOVT	R1, #hi_addr(_first+0)
BL	_IntToStr+0
;MyProject_events_code.c,413 :: 		Label4.Caption = first;
MOVW	R1, #lo_addr(_first+0)
MOVT	R1, #hi_addr(_first+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,414 :: 		}
L_showResults43:
;MyProject_events_code.c,415 :: 		if (results[1] != 0){
MOVW	R0, #lo_addr(_results+2)
MOVT	R0, #hi_addr(_results+2)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_showResults44
;MyProject_events_code.c,416 :: 		IntToStr(results[1], second);
MOVW	R0, #lo_addr(_results+2)
MOVT	R0, #hi_addr(_results+2)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_second+0)
MOVT	R1, #hi_addr(_second+0)
BL	_IntToStr+0
;MyProject_events_code.c,417 :: 		Label5.Caption = second;
MOVW	R1, #lo_addr(_second+0)
MOVT	R1, #hi_addr(_second+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,418 :: 		}
L_showResults44:
;MyProject_events_code.c,420 :: 		if (results[2] != 0) {
MOVW	R0, #lo_addr(_results+4)
MOVT	R0, #hi_addr(_results+4)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_showResults45
;MyProject_events_code.c,421 :: 		IntToStr(results[2], third);
MOVW	R0, #lo_addr(_results+4)
MOVT	R0, #hi_addr(_results+4)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_third+0)
MOVT	R1, #hi_addr(_third+0)
BL	_IntToStr+0
;MyProject_events_code.c,422 :: 		Label6.Caption = third;
MOVW	R1, #lo_addr(_third+0)
MOVT	R1, #hi_addr(_third+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,423 :: 		}
L_showResults45:
;MyProject_events_code.c,425 :: 		if (results[3] != 0){
MOVW	R0, #lo_addr(_results+6)
MOVT	R0, #hi_addr(_results+6)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_showResults46
;MyProject_events_code.c,426 :: 		IntToStr(results[3], fourth);
MOVW	R0, #lo_addr(_results+6)
MOVT	R0, #hi_addr(_results+6)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_fourth+0)
MOVT	R1, #hi_addr(_fourth+0)
BL	_IntToStr+0
;MyProject_events_code.c,427 :: 		Label7.Caption = fourth;
MOVW	R1, #lo_addr(_fourth+0)
MOVT	R1, #hi_addr(_fourth+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,428 :: 		}
L_showResults46:
;MyProject_events_code.c,430 :: 		if (results[4] != 0) {
MOVW	R0, #lo_addr(_results+8)
MOVT	R0, #hi_addr(_results+8)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_showResults47
;MyProject_events_code.c,431 :: 		IntToStr(results[4], fifth);
MOVW	R0, #lo_addr(_results+8)
MOVT	R0, #hi_addr(_results+8)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_fifth+0)
MOVT	R1, #hi_addr(_fifth+0)
BL	_IntToStr+0
;MyProject_events_code.c,432 :: 		Label8.Caption = fifth;
MOVW	R1, #lo_addr(_fifth+0)
MOVT	R1, #hi_addr(_fifth+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;MyProject_events_code.c,433 :: 		}
L_showResults47:
;MyProject_events_code.c,435 :: 		}
L_end_showResults:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _showResults
_bubbleSort:
;MyProject_events_code.c,437 :: 		void bubbleSort(int array[], int n)
; n start address is: 4 (R1)
; array start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; n end address is: 4 (R1)
; array end address is: 0 (R0)
; array start address is: 0 (R0)
; n start address is: 4 (R1)
;MyProject_events_code.c,440 :: 		for (i = 0; i < n-1; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; n end address is: 4 (R1)
; array end address is: 0 (R0)
; i end address is: 20 (R5)
SXTH	R4, R1
MOV	R1, R0
L_bubbleSort48:
; i start address is: 20 (R5)
; n start address is: 16 (R4)
; array start address is: 4 (R1)
SUBS	R2, R4, #1
SXTH	R2, R2
CMP	R5, R2
IT	GE
BGE	L_bubbleSort49
;MyProject_events_code.c,441 :: 		for (j = 0; j < n-i-1; j++)
; j start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; array end address is: 4 (R1)
; j end address is: 0 (R0)
; n end address is: 16 (R4)
; i end address is: 20 (R5)
STRH	R0, [SP, #4]
MOV	R0, R1
LDRSH	R1, [SP, #4]
L_bubbleSort51:
; j start address is: 4 (R1)
; array start address is: 0 (R0)
; n start address is: 16 (R4)
; i start address is: 20 (R5)
SUB	R2, R4, R5
SXTH	R2, R2
SUBS	R2, R2, #1
SXTH	R2, R2
CMP	R1, R2
IT	GE
BGE	L_bubbleSort52
;MyProject_events_code.c,442 :: 		if (array[j] > array[j+1])
LSLS	R2, R1, #1
ADDS	R2, R0, R2
LDRSH	R3, [R2, #0]
ADDS	R2, R1, #1
SXTH	R2, R2
LSLS	R2, R2, #1
ADDS	R2, R0, R2
LDRSH	R2, [R2, #0]
CMP	R3, R2
IT	LE
BLE	L_bubbleSort54
;MyProject_events_code.c,443 :: 		replace(&array[j], &array[j+1]);
ADDS	R2, R1, #1
SXTH	R2, R2
LSLS	R2, R2, #1
ADDS	R3, R0, R2
LSLS	R2, R1, #1
ADDS	R2, R0, R2
STR	R0, [SP, #4]
STRH	R1, [SP, #8]
MOV	R1, R3
MOV	R0, R2
BL	_replace+0
LDRSH	R1, [SP, #8]
LDR	R0, [SP, #4]
L_bubbleSort54:
;MyProject_events_code.c,441 :: 		for (j = 0; j < n-i-1; j++)
ADDS	R1, R1, #1
SXTH	R1, R1
;MyProject_events_code.c,443 :: 		replace(&array[j], &array[j+1]);
; j end address is: 4 (R1)
IT	AL
BAL	L_bubbleSort51
L_bubbleSort52:
;MyProject_events_code.c,440 :: 		for (i = 0; i < n-1; i++)
ADDS	R5, R5, #1
SXTH	R5, R5
;MyProject_events_code.c,443 :: 		replace(&array[j], &array[j+1]);
MOV	R1, R0
; array end address is: 0 (R0)
; n end address is: 16 (R4)
; i end address is: 20 (R5)
IT	AL
BAL	L_bubbleSort48
L_bubbleSort49:
;MyProject_events_code.c,445 :: 		}
L_end_bubbleSort:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _bubbleSort
_replace:
;MyProject_events_code.c,447 :: 		void replace(int *xp, int *yp)
; yp start address is: 4 (R1)
; xp start address is: 0 (R0)
; yp end address is: 4 (R1)
; xp end address is: 0 (R0)
; xp start address is: 0 (R0)
; yp start address is: 4 (R1)
;MyProject_events_code.c,449 :: 		int temp = *xp;
LDRSH	R2, [R0, #0]
; temp start address is: 12 (R3)
SXTH	R3, R2
;MyProject_events_code.c,450 :: 		*xp = *yp;
LDRSH	R2, [R1, #0]
STRH	R2, [R0, #0]
; xp end address is: 0 (R0)
;MyProject_events_code.c,451 :: 		*yp = temp;
STRH	R3, [R1, #0]
; yp end address is: 4 (R1)
; temp end address is: 12 (R3)
;MyProject_events_code.c,453 :: 		}
L_end_replace:
BX	LR
; end of _replace
