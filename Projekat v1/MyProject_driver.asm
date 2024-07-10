_Write_to_Data_Lines:
;MyProject_driver.c,47 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;MyProject_driver.c,48 :: 		GPIOD_PDOR = (unsigned int) (_lo | (_hi << 8));
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOD_PDOR+0)
MOVT	R2, #hi_addr(GPIOD_PDOR+0)
STR	R3, [R2, #0]
;MyProject_driver.c,49 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;MyProject_driver.c,51 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;MyProject_driver.c,52 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,53 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;MyProject_driver.c,54 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,55 :: 		asm nop;
NOP
;MyProject_driver.c,56 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,57 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;MyProject_driver.c,59 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;MyProject_driver.c,60 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,61 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;MyProject_driver.c,62 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,63 :: 		asm nop;
NOP
;MyProject_driver.c,64 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,65 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;MyProject_driver.c,67 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;MyProject_driver.c,68 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,69 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;MyProject_driver.c,70 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,71 :: 		asm nop;
NOP
;MyProject_driver.c,72 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,73 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
MyProject_driver_InitializeTouchPanel:
;MyProject_driver.c,75 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,76 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;MyProject_driver.c,77 :: 		TFT_Init_SSD1963_Board_50(800, 480);
MOVW	R1, #480
MOVW	R0, #800
BL	_TFT_Init_SSD1963_Board_50+0
;MyProject_driver.c,79 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;MyProject_driver.c,81 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,82 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;MyProject_driver.c,83 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,84 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MyProject_driver_InitializeTouchPanel
MyProject_driver_InitializeObjects:
;MyProject_driver.c,269 :: 		static void InitializeObjects() {
;MyProject_driver.c,270 :: 		Screen1.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,271 :: 		Screen1.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,272 :: 		Screen1.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,273 :: 		Screen1.ButtonsCount              = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,274 :: 		Screen1.Buttons                   = Screen1_Buttons;
MOVW	R1, #lo_addr(_Screen1_Buttons+0)
MOVT	R1, #hi_addr(_Screen1_Buttons+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;MyProject_driver.c,275 :: 		Screen1.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,276 :: 		Screen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;MyProject_driver.c,277 :: 		Screen1.LabelsCount               = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,278 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;MyProject_driver.c,279 :: 		Screen1.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,280 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;MyProject_driver.c,281 :: 		Screen1.BoxesCount                = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,282 :: 		Screen1.Boxes                     = Screen1_Boxes;
MOVW	R1, #lo_addr(_Screen1_Boxes+0)
MOVT	R1, #hi_addr(_Screen1_Boxes+0)
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;MyProject_driver.c,283 :: 		Screen1.ObjectsCount              = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,284 :: 		Screen1.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+56)
MOVT	R0, #hi_addr(_Screen1+56)
STR	R1, [R0, #0]
;MyProject_driver.c,285 :: 		Screen1.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+60)
MOVT	R0, #hi_addr(_Screen1+60)
STR	R1, [R0, #0]
;MyProject_driver.c,286 :: 		Screen1.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+48)
MOVT	R0, #hi_addr(_Screen1+48)
STR	R1, [R0, #0]
;MyProject_driver.c,287 :: 		Screen1.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+52)
MOVT	R0, #hi_addr(_Screen1+52)
STR	R1, [R0, #0]
;MyProject_driver.c,288 :: 		Screen1.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+64)
MOVT	R0, #hi_addr(_Screen1+64)
STR	R1, [R0, #0]
;MyProject_driver.c,289 :: 		Screen1.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+68)
MOVT	R0, #hi_addr(_Screen1+68)
STR	R1, [R0, #0]
;MyProject_driver.c,292 :: 		Button1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,293 :: 		Button1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+4)
MOVT	R0, #hi_addr(_Button1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,294 :: 		Button1.Left            = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Button1+6)
MOVT	R0, #hi_addr(_Button1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,295 :: 		Button2.OnClickPtr = showImage2;
MOVW	R0, #lo_addr(_showImage2+0)
MOVT	R0, #hi_addr(_showImage2+0)
MOVW	R2, #lo_addr(_Button2+60)
MOVT	R2, #hi_addr(_Button2+60)
STR	R0, [R2, #0]
;MyProject_driver.c,296 :: 		Button1.Top             = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Button1+8)
MOVT	R0, #hi_addr(_Button1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,297 :: 		Button1.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button1+10)
MOVT	R0, #hi_addr(_Button1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,298 :: 		Button1.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button1+12)
MOVT	R0, #hi_addr(_Button1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,299 :: 		Button1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+14)
MOVT	R0, #hi_addr(_Button1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,300 :: 		Button1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+16)
MOVT	R0, #hi_addr(_Button1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,301 :: 		Button1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+18)
MOVT	R0, #hi_addr(_Button1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,302 :: 		Button1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+19)
MOVT	R0, #hi_addr(_Button1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,303 :: 		Button1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+20)
MOVT	R0, #hi_addr(_Button1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,304 :: 		Button1.Caption         = Button1_Caption;
MOVW	R1, #lo_addr(_Button1_Caption+0)
MOVT	R1, #hi_addr(_Button1_Caption+0)
MOVW	R0, #lo_addr(_Button1+24)
MOVT	R0, #hi_addr(_Button1+24)
STR	R1, [R0, #0]
;MyProject_driver.c,305 :: 		Button1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+28)
MOVT	R0, #hi_addr(_Button1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,306 :: 		Button1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+29)
MOVT	R0, #hi_addr(_Button1+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,307 :: 		Button1.FontName        = Tahoma11x13_Regular;
MOVW	R3, #lo_addr(_Tahoma11x13_Regular+0)
MOVT	R3, #hi_addr(_Tahoma11x13_Regular+0)
MOVW	R0, #lo_addr(_Button1+32)
MOVT	R0, #hi_addr(_Button1+32)
STR	R3, [R0, #0]
;MyProject_driver.c,308 :: 		Button1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+48)
MOVT	R0, #hi_addr(_Button1+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,309 :: 		Button1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+36)
MOVT	R0, #hi_addr(_Button1+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,310 :: 		Button1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+38)
MOVT	R0, #hi_addr(_Button1+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,311 :: 		Button1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+39)
MOVT	R0, #hi_addr(_Button1+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,312 :: 		Button1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+40)
MOVT	R0, #hi_addr(_Button1+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,313 :: 		Button1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button1+42)
MOVT	R0, #hi_addr(_Button1+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,314 :: 		Button1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button1+44)
MOVT	R0, #hi_addr(_Button1+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,315 :: 		Button1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button1+46)
MOVT	R0, #hi_addr(_Button1+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,316 :: 		Button1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button1+50)
MOVT	R0, #hi_addr(_Button1+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,317 :: 		Button1.OnClickPtr = showImage1;
MOVW	R1, #lo_addr(_showImage1+0)
MOVT	R1, #hi_addr(_showImage1+0)
MOVW	R0, #lo_addr(_Button1+60)
MOVT	R0, #hi_addr(_Button1+60)
STR	R1, [R0, #0]
;MyProject_driver.c,319 :: 		Button2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button2+0)
MOVT	R0, #hi_addr(_Button2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,320 :: 		Button2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+4)
MOVT	R0, #hi_addr(_Button2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,321 :: 		Button2.Left            = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_Button2+6)
MOVT	R0, #hi_addr(_Button2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,322 :: 		Button2.Top             = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Button2+8)
MOVT	R0, #hi_addr(_Button2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,323 :: 		Button2.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button2+10)
MOVT	R0, #hi_addr(_Button2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,324 :: 		Button2.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button2+12)
MOVT	R0, #hi_addr(_Button2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,325 :: 		Button2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+14)
MOVT	R0, #hi_addr(_Button2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,326 :: 		Button2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+16)
MOVT	R0, #hi_addr(_Button2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,327 :: 		Button2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+18)
MOVT	R0, #hi_addr(_Button2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,328 :: 		Button2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+19)
MOVT	R0, #hi_addr(_Button2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,329 :: 		Button2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+20)
MOVT	R0, #hi_addr(_Button2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,330 :: 		Button2.Caption         = Button2_Caption;
MOVW	R1, #lo_addr(_Button2_Caption+0)
MOVT	R1, #hi_addr(_Button2_Caption+0)
MOVW	R0, #lo_addr(_Button2+24)
MOVT	R0, #hi_addr(_Button2+24)
STR	R1, [R0, #0]
;MyProject_driver.c,331 :: 		Button2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+28)
MOVT	R0, #hi_addr(_Button2+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,332 :: 		Button2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+29)
MOVT	R0, #hi_addr(_Button2+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,333 :: 		Button2.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button2+32)
MOVT	R0, #hi_addr(_Button2+32)
STR	R3, [R0, #0]
;MyProject_driver.c,334 :: 		Button2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+48)
MOVT	R0, #hi_addr(_Button2+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,335 :: 		Button2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+36)
MOVT	R0, #hi_addr(_Button2+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,336 :: 		Button2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+38)
MOVT	R0, #hi_addr(_Button2+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,337 :: 		Button2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+39)
MOVT	R0, #hi_addr(_Button2+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,338 :: 		Button2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+40)
MOVT	R0, #hi_addr(_Button2+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,339 :: 		Button2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button2+42)
MOVT	R0, #hi_addr(_Button2+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,340 :: 		Button2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button2+44)
MOVT	R0, #hi_addr(_Button2+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,341 :: 		Button2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button2+46)
MOVT	R0, #hi_addr(_Button2+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,342 :: 		Button2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button2+50)
MOVT	R0, #hi_addr(_Button2+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,343 :: 		Button2.OnClickPtr = showImage2;
MOVW	R0, #lo_addr(_showImage2+0)
MOVT	R0, #hi_addr(_showImage2+0)
STR	R0, [R2, #0]
;MyProject_driver.c,345 :: 		Button3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,346 :: 		Button3.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Button3+4)
MOVT	R0, #hi_addr(_Button3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,347 :: 		Button3.Left            = 300;
MOVW	R1, #300
MOVW	R0, #lo_addr(_Button3+6)
MOVT	R0, #hi_addr(_Button3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,348 :: 		Button3.Top             = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Button3+8)
MOVT	R0, #hi_addr(_Button3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,349 :: 		Button3.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button3+10)
MOVT	R0, #hi_addr(_Button3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,350 :: 		Button3.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button3+12)
MOVT	R0, #hi_addr(_Button3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,351 :: 		Button3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+14)
MOVT	R0, #hi_addr(_Button3+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,352 :: 		Button3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+16)
MOVT	R0, #hi_addr(_Button3+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,353 :: 		Button3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+18)
MOVT	R0, #hi_addr(_Button3+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,354 :: 		Button3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+19)
MOVT	R0, #hi_addr(_Button3+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,355 :: 		Button3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+20)
MOVT	R0, #hi_addr(_Button3+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,356 :: 		Button3.Caption         = Button3_Caption;
MOVW	R1, #lo_addr(_Button3_Caption+0)
MOVT	R1, #hi_addr(_Button3_Caption+0)
MOVW	R0, #lo_addr(_Button3+24)
MOVT	R0, #hi_addr(_Button3+24)
STR	R1, [R0, #0]
;MyProject_driver.c,357 :: 		Button3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+28)
MOVT	R0, #hi_addr(_Button3+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,358 :: 		Button3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+29)
MOVT	R0, #hi_addr(_Button3+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,359 :: 		Button3.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button3+32)
MOVT	R0, #hi_addr(_Button3+32)
STR	R3, [R0, #0]
;MyProject_driver.c,360 :: 		Button3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+48)
MOVT	R0, #hi_addr(_Button3+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,361 :: 		Button3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+36)
MOVT	R0, #hi_addr(_Button3+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,362 :: 		Button3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+38)
MOVT	R0, #hi_addr(_Button3+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,363 :: 		Button3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+39)
MOVT	R0, #hi_addr(_Button3+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,364 :: 		Button3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+40)
MOVT	R0, #hi_addr(_Button3+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,365 :: 		Button3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button3+42)
MOVT	R0, #hi_addr(_Button3+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,366 :: 		Button3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button3+44)
MOVT	R0, #hi_addr(_Button3+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,367 :: 		Button3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button3+46)
MOVT	R0, #hi_addr(_Button3+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,368 :: 		Button3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button3+50)
MOVT	R0, #hi_addr(_Button3+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,369 :: 		Button3.OnClickPtr = showImage3;
MOVW	R1, #lo_addr(_showImage3+0)
MOVT	R1, #hi_addr(_showImage3+0)
MOVW	R0, #lo_addr(_Button3+60)
MOVT	R0, #hi_addr(_Button3+60)
STR	R1, [R0, #0]
;MyProject_driver.c,371 :: 		Button4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,372 :: 		Button4.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Button4+4)
MOVT	R0, #hi_addr(_Button4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,373 :: 		Button4.Left            = 420;
MOVW	R1, #420
MOVW	R0, #lo_addr(_Button4+6)
MOVT	R0, #hi_addr(_Button4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,374 :: 		Button4.Top             = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Button4+8)
MOVT	R0, #hi_addr(_Button4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,375 :: 		Button4.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button4+10)
MOVT	R0, #hi_addr(_Button4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,376 :: 		Button4.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button4+12)
MOVT	R0, #hi_addr(_Button4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,377 :: 		Button4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+14)
MOVT	R0, #hi_addr(_Button4+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,378 :: 		Button4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+16)
MOVT	R0, #hi_addr(_Button4+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,379 :: 		Button4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+18)
MOVT	R0, #hi_addr(_Button4+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,380 :: 		Button4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+19)
MOVT	R0, #hi_addr(_Button4+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,381 :: 		Button4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+20)
MOVT	R0, #hi_addr(_Button4+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,382 :: 		Button4.Caption         = Button4_Caption;
MOVW	R1, #lo_addr(_Button4_Caption+0)
MOVT	R1, #hi_addr(_Button4_Caption+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
STR	R1, [R0, #0]
;MyProject_driver.c,383 :: 		Button4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+28)
MOVT	R0, #hi_addr(_Button4+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,384 :: 		Button4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+29)
MOVT	R0, #hi_addr(_Button4+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,385 :: 		Button4.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button4+32)
MOVT	R0, #hi_addr(_Button4+32)
STR	R3, [R0, #0]
;MyProject_driver.c,386 :: 		Button4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+48)
MOVT	R0, #hi_addr(_Button4+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,387 :: 		Button4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+36)
MOVT	R0, #hi_addr(_Button4+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,388 :: 		Button4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+38)
MOVT	R0, #hi_addr(_Button4+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,389 :: 		Button4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+39)
MOVT	R0, #hi_addr(_Button4+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,390 :: 		Button4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+40)
MOVT	R0, #hi_addr(_Button4+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,391 :: 		Button4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button4+42)
MOVT	R0, #hi_addr(_Button4+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,392 :: 		Button4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button4+44)
MOVT	R0, #hi_addr(_Button4+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,393 :: 		Button4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button4+46)
MOVT	R0, #hi_addr(_Button4+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,394 :: 		Button4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button4+50)
MOVT	R0, #hi_addr(_Button4+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,395 :: 		Button4.OnClickPtr = showImage4;
MOVW	R1, #lo_addr(_showImage4+0)
MOVT	R1, #hi_addr(_showImage4+0)
MOVW	R0, #lo_addr(_Button4+60)
MOVT	R0, #hi_addr(_Button4+60)
STR	R1, [R0, #0]
;MyProject_driver.c,397 :: 		Button5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button5+0)
MOVT	R0, #hi_addr(_Button5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,398 :: 		Button5.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Button5+4)
MOVT	R0, #hi_addr(_Button5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,399 :: 		Button5.Left            = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button5+6)
MOVT	R0, #hi_addr(_Button5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,400 :: 		Button5.Top             = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Button5+8)
MOVT	R0, #hi_addr(_Button5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,401 :: 		Button5.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button5+10)
MOVT	R0, #hi_addr(_Button5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,402 :: 		Button5.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button5+12)
MOVT	R0, #hi_addr(_Button5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,403 :: 		Button5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+14)
MOVT	R0, #hi_addr(_Button5+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,404 :: 		Button5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+16)
MOVT	R0, #hi_addr(_Button5+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,405 :: 		Button5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+18)
MOVT	R0, #hi_addr(_Button5+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,406 :: 		Button5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+19)
MOVT	R0, #hi_addr(_Button5+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,407 :: 		Button5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+20)
MOVT	R0, #hi_addr(_Button5+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,408 :: 		Button5.Caption         = Button5_Caption;
MOVW	R1, #lo_addr(_Button5_Caption+0)
MOVT	R1, #hi_addr(_Button5_Caption+0)
MOVW	R0, #lo_addr(_Button5+24)
MOVT	R0, #hi_addr(_Button5+24)
STR	R1, [R0, #0]
;MyProject_driver.c,409 :: 		Button5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+28)
MOVT	R0, #hi_addr(_Button5+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,410 :: 		Button5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+29)
MOVT	R0, #hi_addr(_Button5+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,411 :: 		Button5.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button5+32)
MOVT	R0, #hi_addr(_Button5+32)
STR	R3, [R0, #0]
;MyProject_driver.c,412 :: 		Button5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+48)
MOVT	R0, #hi_addr(_Button5+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,413 :: 		Button5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+36)
MOVT	R0, #hi_addr(_Button5+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,414 :: 		Button5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+38)
MOVT	R0, #hi_addr(_Button5+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,415 :: 		Button5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+39)
MOVT	R0, #hi_addr(_Button5+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,416 :: 		Button5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+40)
MOVT	R0, #hi_addr(_Button5+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,417 :: 		Button5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button5+42)
MOVT	R0, #hi_addr(_Button5+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,418 :: 		Button5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button5+44)
MOVT	R0, #hi_addr(_Button5+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,419 :: 		Button5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button5+46)
MOVT	R0, #hi_addr(_Button5+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,420 :: 		Button5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button5+50)
MOVT	R0, #hi_addr(_Button5+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,421 :: 		Button5.OnClickPtr = showImage5;
MOVW	R1, #lo_addr(_showImage5+0)
MOVT	R1, #hi_addr(_showImage5+0)
MOVW	R0, #lo_addr(_Button5+60)
MOVT	R0, #hi_addr(_Button5+60)
STR	R1, [R0, #0]
;MyProject_driver.c,423 :: 		Button6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button6+0)
MOVT	R0, #hi_addr(_Button6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,424 :: 		Button6.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Button6+4)
MOVT	R0, #hi_addr(_Button6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,425 :: 		Button6.Left            = 179;
MOVS	R1, #179
MOVW	R0, #lo_addr(_Button6+6)
MOVT	R0, #hi_addr(_Button6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,426 :: 		Button6.Top             = 145;
MOVS	R1, #145
MOVW	R0, #lo_addr(_Button6+8)
MOVT	R0, #hi_addr(_Button6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,427 :: 		Button6.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button6+10)
MOVT	R0, #hi_addr(_Button6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,428 :: 		Button6.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button6+12)
MOVT	R0, #hi_addr(_Button6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,429 :: 		Button6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+14)
MOVT	R0, #hi_addr(_Button6+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,430 :: 		Button6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+16)
MOVT	R0, #hi_addr(_Button6+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,431 :: 		Button6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+18)
MOVT	R0, #hi_addr(_Button6+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,432 :: 		Button6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+19)
MOVT	R0, #hi_addr(_Button6+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,433 :: 		Button6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+20)
MOVT	R0, #hi_addr(_Button6+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,434 :: 		Button6.Caption         = Button6_Caption;
MOVW	R1, #lo_addr(_Button6_Caption+0)
MOVT	R1, #hi_addr(_Button6_Caption+0)
MOVW	R0, #lo_addr(_Button6+24)
MOVT	R0, #hi_addr(_Button6+24)
STR	R1, [R0, #0]
;MyProject_driver.c,435 :: 		Button6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+28)
MOVT	R0, #hi_addr(_Button6+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,436 :: 		Button6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+29)
MOVT	R0, #hi_addr(_Button6+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,437 :: 		Button6.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button6+32)
MOVT	R0, #hi_addr(_Button6+32)
STR	R3, [R0, #0]
;MyProject_driver.c,438 :: 		Button6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+48)
MOVT	R0, #hi_addr(_Button6+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,439 :: 		Button6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+36)
MOVT	R0, #hi_addr(_Button6+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,440 :: 		Button6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+38)
MOVT	R0, #hi_addr(_Button6+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,441 :: 		Button6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+39)
MOVT	R0, #hi_addr(_Button6+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,442 :: 		Button6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+40)
MOVT	R0, #hi_addr(_Button6+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,443 :: 		Button6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button6+42)
MOVT	R0, #hi_addr(_Button6+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,444 :: 		Button6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button6+44)
MOVT	R0, #hi_addr(_Button6+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,445 :: 		Button6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button6+46)
MOVT	R0, #hi_addr(_Button6+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,446 :: 		Button6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button6+50)
MOVT	R0, #hi_addr(_Button6+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,447 :: 		Button6.OnClickPtr = showImage6;
MOVW	R1, #lo_addr(_showImage6+0)
MOVT	R1, #hi_addr(_showImage6+0)
MOVW	R0, #lo_addr(_Button6+60)
MOVT	R0, #hi_addr(_Button6+60)
STR	R1, [R0, #0]
;MyProject_driver.c,449 :: 		Button7.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button7+0)
MOVT	R0, #hi_addr(_Button7+0)
STR	R1, [R0, #0]
;MyProject_driver.c,450 :: 		Button7.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Button7+4)
MOVT	R0, #hi_addr(_Button7+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,451 :: 		Button7.Left            = 299;
MOVW	R1, #299
MOVW	R0, #lo_addr(_Button7+6)
MOVT	R0, #hi_addr(_Button7+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,452 :: 		Button7.Top             = 145;
MOVS	R1, #145
MOVW	R0, #lo_addr(_Button7+8)
MOVT	R0, #hi_addr(_Button7+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,453 :: 		Button7.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button7+10)
MOVT	R0, #hi_addr(_Button7+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,454 :: 		Button7.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button7+12)
MOVT	R0, #hi_addr(_Button7+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,455 :: 		Button7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+14)
MOVT	R0, #hi_addr(_Button7+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,456 :: 		Button7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+16)
MOVT	R0, #hi_addr(_Button7+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,457 :: 		Button7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+18)
MOVT	R0, #hi_addr(_Button7+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,458 :: 		Button7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+19)
MOVT	R0, #hi_addr(_Button7+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,459 :: 		Button7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+20)
MOVT	R0, #hi_addr(_Button7+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,460 :: 		Button7.Caption         = Button7_Caption;
MOVW	R1, #lo_addr(_Button7_Caption+0)
MOVT	R1, #hi_addr(_Button7_Caption+0)
MOVW	R0, #lo_addr(_Button7+24)
MOVT	R0, #hi_addr(_Button7+24)
STR	R1, [R0, #0]
;MyProject_driver.c,461 :: 		Button7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+28)
MOVT	R0, #hi_addr(_Button7+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,462 :: 		Button7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+29)
MOVT	R0, #hi_addr(_Button7+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,463 :: 		Button7.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button7+32)
MOVT	R0, #hi_addr(_Button7+32)
STR	R3, [R0, #0]
;MyProject_driver.c,464 :: 		Button7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+48)
MOVT	R0, #hi_addr(_Button7+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,465 :: 		Button7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+36)
MOVT	R0, #hi_addr(_Button7+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,466 :: 		Button7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+38)
MOVT	R0, #hi_addr(_Button7+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,467 :: 		Button7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+39)
MOVT	R0, #hi_addr(_Button7+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,468 :: 		Button7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+40)
MOVT	R0, #hi_addr(_Button7+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,469 :: 		Button7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button7+42)
MOVT	R0, #hi_addr(_Button7+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,470 :: 		Button7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button7+44)
MOVT	R0, #hi_addr(_Button7+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,471 :: 		Button7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button7+46)
MOVT	R0, #hi_addr(_Button7+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,472 :: 		Button7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button7+50)
MOVT	R0, #hi_addr(_Button7+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,473 :: 		Button7.OnClickPtr = showImage7;
MOVW	R1, #lo_addr(_showImage7+0)
MOVT	R1, #hi_addr(_showImage7+0)
MOVW	R0, #lo_addr(_Button7+60)
MOVT	R0, #hi_addr(_Button7+60)
STR	R1, [R0, #0]
;MyProject_driver.c,475 :: 		Button8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button8+0)
MOVT	R0, #hi_addr(_Button8+0)
STR	R1, [R0, #0]
;MyProject_driver.c,476 :: 		Button8.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Button8+4)
MOVT	R0, #hi_addr(_Button8+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,477 :: 		Button8.Left            = 421;
MOVW	R1, #421
MOVW	R0, #lo_addr(_Button8+6)
MOVT	R0, #hi_addr(_Button8+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,478 :: 		Button8.Top             = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Button8+8)
MOVT	R0, #hi_addr(_Button8+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,479 :: 		Button8.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button8+10)
MOVT	R0, #hi_addr(_Button8+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,480 :: 		Button8.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button8+12)
MOVT	R0, #hi_addr(_Button8+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,481 :: 		Button8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+14)
MOVT	R0, #hi_addr(_Button8+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,482 :: 		Button8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+16)
MOVT	R0, #hi_addr(_Button8+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,483 :: 		Button8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+18)
MOVT	R0, #hi_addr(_Button8+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,484 :: 		Button8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+19)
MOVT	R0, #hi_addr(_Button8+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,485 :: 		Button8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+20)
MOVT	R0, #hi_addr(_Button8+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,486 :: 		Button8.Caption         = Button8_Caption;
MOVW	R1, #lo_addr(_Button8_Caption+0)
MOVT	R1, #hi_addr(_Button8_Caption+0)
MOVW	R0, #lo_addr(_Button8+24)
MOVT	R0, #hi_addr(_Button8+24)
STR	R1, [R0, #0]
;MyProject_driver.c,487 :: 		Button8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+28)
MOVT	R0, #hi_addr(_Button8+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,488 :: 		Button8.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+29)
MOVT	R0, #hi_addr(_Button8+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,489 :: 		Button8.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button8+32)
MOVT	R0, #hi_addr(_Button8+32)
STR	R3, [R0, #0]
;MyProject_driver.c,490 :: 		Button8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+48)
MOVT	R0, #hi_addr(_Button8+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,491 :: 		Button8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+36)
MOVT	R0, #hi_addr(_Button8+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,492 :: 		Button8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+38)
MOVT	R0, #hi_addr(_Button8+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,493 :: 		Button8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+39)
MOVT	R0, #hi_addr(_Button8+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,494 :: 		Button8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+40)
MOVT	R0, #hi_addr(_Button8+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,495 :: 		Button8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button8+42)
MOVT	R0, #hi_addr(_Button8+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,496 :: 		Button8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button8+44)
MOVT	R0, #hi_addr(_Button8+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,497 :: 		Button8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button8+46)
MOVT	R0, #hi_addr(_Button8+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,498 :: 		Button8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button8+50)
MOVT	R0, #hi_addr(_Button8+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,499 :: 		Button8.OnClickPtr = showImage8;
MOVW	R1, #lo_addr(_showImage8+0)
MOVT	R1, #hi_addr(_showImage8+0)
MOVW	R0, #lo_addr(_Button8+60)
MOVT	R0, #hi_addr(_Button8+60)
STR	R1, [R0, #0]
;MyProject_driver.c,501 :: 		Button9.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button9+0)
MOVT	R0, #hi_addr(_Button9+0)
STR	R1, [R0, #0]
;MyProject_driver.c,502 :: 		Button9.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Button9+4)
MOVT	R0, #hi_addr(_Button9+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,503 :: 		Button9.Left            = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_Button9+6)
MOVT	R0, #hi_addr(_Button9+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,504 :: 		Button9.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_Button9+8)
MOVT	R0, #hi_addr(_Button9+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,505 :: 		Button9.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button9+10)
MOVT	R0, #hi_addr(_Button9+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,506 :: 		Button9.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button9+12)
MOVT	R0, #hi_addr(_Button9+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,507 :: 		Button9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+14)
MOVT	R0, #hi_addr(_Button9+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,508 :: 		Button9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+16)
MOVT	R0, #hi_addr(_Button9+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,509 :: 		Button9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+18)
MOVT	R0, #hi_addr(_Button9+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,510 :: 		Button9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+19)
MOVT	R0, #hi_addr(_Button9+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,511 :: 		Button9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+20)
MOVT	R0, #hi_addr(_Button9+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,512 :: 		Button9.Caption         = Button9_Caption;
MOVW	R1, #lo_addr(_Button9_Caption+0)
MOVT	R1, #hi_addr(_Button9_Caption+0)
MOVW	R0, #lo_addr(_Button9+24)
MOVT	R0, #hi_addr(_Button9+24)
STR	R1, [R0, #0]
;MyProject_driver.c,513 :: 		Button9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+28)
MOVT	R0, #hi_addr(_Button9+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,514 :: 		Button9.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+29)
MOVT	R0, #hi_addr(_Button9+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,515 :: 		Button9.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button9+32)
MOVT	R0, #hi_addr(_Button9+32)
STR	R3, [R0, #0]
;MyProject_driver.c,516 :: 		Button9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+48)
MOVT	R0, #hi_addr(_Button9+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,517 :: 		Button9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+36)
MOVT	R0, #hi_addr(_Button9+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,518 :: 		Button9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+38)
MOVT	R0, #hi_addr(_Button9+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,519 :: 		Button9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+39)
MOVT	R0, #hi_addr(_Button9+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,520 :: 		Button9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+40)
MOVT	R0, #hi_addr(_Button9+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,521 :: 		Button9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button9+42)
MOVT	R0, #hi_addr(_Button9+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,522 :: 		Button9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button9+44)
MOVT	R0, #hi_addr(_Button9+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,523 :: 		Button9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button9+46)
MOVT	R0, #hi_addr(_Button9+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,524 :: 		Button9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button9+50)
MOVT	R0, #hi_addr(_Button9+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,525 :: 		Button9.OnClickPtr = showImage9;
MOVW	R1, #lo_addr(_showImage9+0)
MOVT	R1, #hi_addr(_showImage9+0)
MOVW	R0, #lo_addr(_Button9+60)
MOVT	R0, #hi_addr(_Button9+60)
STR	R1, [R0, #0]
;MyProject_driver.c,527 :: 		Button10.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button10+0)
MOVT	R0, #hi_addr(_Button10+0)
STR	R1, [R0, #0]
;MyProject_driver.c,528 :: 		Button10.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Button10+4)
MOVT	R0, #hi_addr(_Button10+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,529 :: 		Button10.Left            = 179;
MOVS	R1, #179
MOVW	R0, #lo_addr(_Button10+6)
MOVT	R0, #hi_addr(_Button10+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,530 :: 		Button10.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_Button10+8)
MOVT	R0, #hi_addr(_Button10+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,531 :: 		Button10.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button10+10)
MOVT	R0, #hi_addr(_Button10+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,532 :: 		Button10.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button10+12)
MOVT	R0, #hi_addr(_Button10+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,533 :: 		Button10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+14)
MOVT	R0, #hi_addr(_Button10+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,534 :: 		Button10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button10+16)
MOVT	R0, #hi_addr(_Button10+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,535 :: 		Button10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+18)
MOVT	R0, #hi_addr(_Button10+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,536 :: 		Button10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+19)
MOVT	R0, #hi_addr(_Button10+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,537 :: 		Button10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+20)
MOVT	R0, #hi_addr(_Button10+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,538 :: 		Button10.Caption         = Button10_Caption;
MOVW	R1, #lo_addr(_Button10_Caption+0)
MOVT	R1, #hi_addr(_Button10_Caption+0)
MOVW	R0, #lo_addr(_Button10+24)
MOVT	R0, #hi_addr(_Button10+24)
STR	R1, [R0, #0]
;MyProject_driver.c,539 :: 		Button10.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+28)
MOVT	R0, #hi_addr(_Button10+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,540 :: 		Button10.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+29)
MOVT	R0, #hi_addr(_Button10+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,541 :: 		Button10.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button10+32)
MOVT	R0, #hi_addr(_Button10+32)
STR	R3, [R0, #0]
;MyProject_driver.c,542 :: 		Button10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+48)
MOVT	R0, #hi_addr(_Button10+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,543 :: 		Button10.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button10+36)
MOVT	R0, #hi_addr(_Button10+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,544 :: 		Button10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button10+38)
MOVT	R0, #hi_addr(_Button10+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,545 :: 		Button10.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button10+39)
MOVT	R0, #hi_addr(_Button10+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,546 :: 		Button10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button10+40)
MOVT	R0, #hi_addr(_Button10+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,547 :: 		Button10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button10+42)
MOVT	R0, #hi_addr(_Button10+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,548 :: 		Button10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button10+44)
MOVT	R0, #hi_addr(_Button10+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,549 :: 		Button10.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button10+46)
MOVT	R0, #hi_addr(_Button10+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,550 :: 		Button10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button10+50)
MOVT	R0, #hi_addr(_Button10+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,551 :: 		Button10.OnClickPtr = showImage10;
MOVW	R1, #lo_addr(_showImage10+0)
MOVT	R1, #hi_addr(_showImage10+0)
MOVW	R0, #lo_addr(_Button10+60)
MOVT	R0, #hi_addr(_Button10+60)
STR	R1, [R0, #0]
;MyProject_driver.c,553 :: 		Button11.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button11+0)
MOVT	R0, #hi_addr(_Button11+0)
STR	R1, [R0, #0]
;MyProject_driver.c,554 :: 		Button11.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Button11+4)
MOVT	R0, #hi_addr(_Button11+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,555 :: 		Button11.Left            = 299;
MOVW	R1, #299
MOVW	R0, #lo_addr(_Button11+6)
MOVT	R0, #hi_addr(_Button11+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,556 :: 		Button11.Top             = 245;
MOVS	R1, #245
MOVW	R0, #lo_addr(_Button11+8)
MOVT	R0, #hi_addr(_Button11+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,557 :: 		Button11.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button11+10)
MOVT	R0, #hi_addr(_Button11+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,558 :: 		Button11.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button11+12)
MOVT	R0, #hi_addr(_Button11+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,559 :: 		Button11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+14)
MOVT	R0, #hi_addr(_Button11+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,560 :: 		Button11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button11+16)
MOVT	R0, #hi_addr(_Button11+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,561 :: 		Button11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+18)
MOVT	R0, #hi_addr(_Button11+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,562 :: 		Button11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+19)
MOVT	R0, #hi_addr(_Button11+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,563 :: 		Button11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+20)
MOVT	R0, #hi_addr(_Button11+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,564 :: 		Button11.Caption         = Button11_Caption;
MOVW	R1, #lo_addr(_Button11_Caption+0)
MOVT	R1, #hi_addr(_Button11_Caption+0)
MOVW	R0, #lo_addr(_Button11+24)
MOVT	R0, #hi_addr(_Button11+24)
STR	R1, [R0, #0]
;MyProject_driver.c,565 :: 		Button11.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+28)
MOVT	R0, #hi_addr(_Button11+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,566 :: 		Button11.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+29)
MOVT	R0, #hi_addr(_Button11+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,567 :: 		Button11.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button11+32)
MOVT	R0, #hi_addr(_Button11+32)
STR	R3, [R0, #0]
;MyProject_driver.c,568 :: 		Button11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+48)
MOVT	R0, #hi_addr(_Button11+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,569 :: 		Button11.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button11+36)
MOVT	R0, #hi_addr(_Button11+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,570 :: 		Button11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button11+38)
MOVT	R0, #hi_addr(_Button11+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,571 :: 		Button11.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button11+39)
MOVT	R0, #hi_addr(_Button11+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,572 :: 		Button11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button11+40)
MOVT	R0, #hi_addr(_Button11+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,573 :: 		Button11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button11+42)
MOVT	R0, #hi_addr(_Button11+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,574 :: 		Button11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button11+44)
MOVT	R0, #hi_addr(_Button11+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,575 :: 		Button11.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button11+46)
MOVT	R0, #hi_addr(_Button11+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,576 :: 		Button11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button11+50)
MOVT	R0, #hi_addr(_Button11+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,577 :: 		Button11.OnClickPtr = showImage11;
MOVW	R1, #lo_addr(_showImage11+0)
MOVT	R1, #hi_addr(_showImage11+0)
MOVW	R0, #lo_addr(_Button11+60)
MOVT	R0, #hi_addr(_Button11+60)
STR	R1, [R0, #0]
;MyProject_driver.c,579 :: 		Button12.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button12+0)
MOVT	R0, #hi_addr(_Button12+0)
STR	R1, [R0, #0]
;MyProject_driver.c,580 :: 		Button12.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Button12+4)
MOVT	R0, #hi_addr(_Button12+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,581 :: 		Button12.Left            = 419;
MOVW	R1, #419
MOVW	R0, #lo_addr(_Button12+6)
MOVT	R0, #hi_addr(_Button12+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,582 :: 		Button12.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_Button12+8)
MOVT	R0, #hi_addr(_Button12+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,583 :: 		Button12.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button12+10)
MOVT	R0, #hi_addr(_Button12+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,584 :: 		Button12.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button12+12)
MOVT	R0, #hi_addr(_Button12+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,585 :: 		Button12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+14)
MOVT	R0, #hi_addr(_Button12+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,586 :: 		Button12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button12+16)
MOVT	R0, #hi_addr(_Button12+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,587 :: 		Button12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+18)
MOVT	R0, #hi_addr(_Button12+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,588 :: 		Button12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+19)
MOVT	R0, #hi_addr(_Button12+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,589 :: 		Button12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+20)
MOVT	R0, #hi_addr(_Button12+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,590 :: 		Button12.Caption         = Button12_Caption;
MOVW	R1, #lo_addr(_Button12_Caption+0)
MOVT	R1, #hi_addr(_Button12_Caption+0)
MOVW	R0, #lo_addr(_Button12+24)
MOVT	R0, #hi_addr(_Button12+24)
STR	R1, [R0, #0]
;MyProject_driver.c,591 :: 		Button12.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+28)
MOVT	R0, #hi_addr(_Button12+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,592 :: 		Button12.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+29)
MOVT	R0, #hi_addr(_Button12+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,593 :: 		Button12.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button12+32)
MOVT	R0, #hi_addr(_Button12+32)
STR	R3, [R0, #0]
;MyProject_driver.c,594 :: 		Button12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+48)
MOVT	R0, #hi_addr(_Button12+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,595 :: 		Button12.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button12+36)
MOVT	R0, #hi_addr(_Button12+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,596 :: 		Button12.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button12+38)
MOVT	R0, #hi_addr(_Button12+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,597 :: 		Button12.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button12+39)
MOVT	R0, #hi_addr(_Button12+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,598 :: 		Button12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button12+40)
MOVT	R0, #hi_addr(_Button12+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,599 :: 		Button12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button12+42)
MOVT	R0, #hi_addr(_Button12+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,600 :: 		Button12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button12+44)
MOVT	R0, #hi_addr(_Button12+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,601 :: 		Button12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button12+46)
MOVT	R0, #hi_addr(_Button12+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,602 :: 		Button12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button12+50)
MOVT	R0, #hi_addr(_Button12+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,603 :: 		Button12.OnClickPtr = showImage12;
MOVW	R1, #lo_addr(_showImage12+0)
MOVT	R1, #hi_addr(_showImage12+0)
MOVW	R0, #lo_addr(_Button12+60)
MOVT	R0, #hi_addr(_Button12+60)
STR	R1, [R0, #0]
;MyProject_driver.c,605 :: 		Button13.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button13+0)
MOVT	R0, #hi_addr(_Button13+0)
STR	R1, [R0, #0]
;MyProject_driver.c,606 :: 		Button13.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Button13+4)
MOVT	R0, #hi_addr(_Button13+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,607 :: 		Button13.Left            = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_Button13+6)
MOVT	R0, #hi_addr(_Button13+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,608 :: 		Button13.Top             = 345;
MOVW	R1, #345
MOVW	R0, #lo_addr(_Button13+8)
MOVT	R0, #hi_addr(_Button13+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,609 :: 		Button13.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button13+10)
MOVT	R0, #hi_addr(_Button13+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,610 :: 		Button13.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button13+12)
MOVT	R0, #hi_addr(_Button13+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,611 :: 		Button13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+14)
MOVT	R0, #hi_addr(_Button13+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,612 :: 		Button13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button13+16)
MOVT	R0, #hi_addr(_Button13+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,613 :: 		Button13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+18)
MOVT	R0, #hi_addr(_Button13+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,614 :: 		Button13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+19)
MOVT	R0, #hi_addr(_Button13+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,615 :: 		Button13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+20)
MOVT	R0, #hi_addr(_Button13+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,616 :: 		Button13.Caption         = Button13_Caption;
MOVW	R1, #lo_addr(_Button13_Caption+0)
MOVT	R1, #hi_addr(_Button13_Caption+0)
MOVW	R0, #lo_addr(_Button13+24)
MOVT	R0, #hi_addr(_Button13+24)
STR	R1, [R0, #0]
;MyProject_driver.c,617 :: 		Button13.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+28)
MOVT	R0, #hi_addr(_Button13+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,618 :: 		Button13.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+29)
MOVT	R0, #hi_addr(_Button13+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,619 :: 		Button13.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button13+32)
MOVT	R0, #hi_addr(_Button13+32)
STR	R3, [R0, #0]
;MyProject_driver.c,620 :: 		Button13.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+48)
MOVT	R0, #hi_addr(_Button13+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,621 :: 		Button13.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button13+36)
MOVT	R0, #hi_addr(_Button13+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,622 :: 		Button13.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button13+38)
MOVT	R0, #hi_addr(_Button13+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,623 :: 		Button13.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button13+39)
MOVT	R0, #hi_addr(_Button13+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,624 :: 		Button13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button13+40)
MOVT	R0, #hi_addr(_Button13+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,625 :: 		Button13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button13+42)
MOVT	R0, #hi_addr(_Button13+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,626 :: 		Button13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button13+44)
MOVT	R0, #hi_addr(_Button13+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,627 :: 		Button13.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button13+46)
MOVT	R0, #hi_addr(_Button13+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,628 :: 		Button13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button13+50)
MOVT	R0, #hi_addr(_Button13+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,629 :: 		Button13.OnClickPtr = showImage13;
MOVW	R1, #lo_addr(_showImage13+0)
MOVT	R1, #hi_addr(_showImage13+0)
MOVW	R0, #lo_addr(_Button13+60)
MOVT	R0, #hi_addr(_Button13+60)
STR	R1, [R0, #0]
;MyProject_driver.c,631 :: 		Button14.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button14+0)
MOVT	R0, #hi_addr(_Button14+0)
STR	R1, [R0, #0]
;MyProject_driver.c,632 :: 		Button14.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Button14+4)
MOVT	R0, #hi_addr(_Button14+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,633 :: 		Button14.Left            = 181;
MOVS	R1, #181
MOVW	R0, #lo_addr(_Button14+6)
MOVT	R0, #hi_addr(_Button14+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,634 :: 		Button14.Top             = 345;
MOVW	R1, #345
MOVW	R0, #lo_addr(_Button14+8)
MOVT	R0, #hi_addr(_Button14+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,635 :: 		Button14.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button14+10)
MOVT	R0, #hi_addr(_Button14+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,636 :: 		Button14.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button14+12)
MOVT	R0, #hi_addr(_Button14+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,637 :: 		Button14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+14)
MOVT	R0, #hi_addr(_Button14+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,638 :: 		Button14.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button14+16)
MOVT	R0, #hi_addr(_Button14+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,639 :: 		Button14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+18)
MOVT	R0, #hi_addr(_Button14+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,640 :: 		Button14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+19)
MOVT	R0, #hi_addr(_Button14+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,641 :: 		Button14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+20)
MOVT	R0, #hi_addr(_Button14+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,642 :: 		Button14.Caption         = Button14_Caption;
MOVW	R1, #lo_addr(_Button14_Caption+0)
MOVT	R1, #hi_addr(_Button14_Caption+0)
MOVW	R0, #lo_addr(_Button14+24)
MOVT	R0, #hi_addr(_Button14+24)
STR	R1, [R0, #0]
;MyProject_driver.c,643 :: 		Button14.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+28)
MOVT	R0, #hi_addr(_Button14+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,644 :: 		Button14.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+29)
MOVT	R0, #hi_addr(_Button14+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,645 :: 		Button14.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button14+32)
MOVT	R0, #hi_addr(_Button14+32)
STR	R3, [R0, #0]
;MyProject_driver.c,646 :: 		Button14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+48)
MOVT	R0, #hi_addr(_Button14+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,647 :: 		Button14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button14+36)
MOVT	R0, #hi_addr(_Button14+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,648 :: 		Button14.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button14+38)
MOVT	R0, #hi_addr(_Button14+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,649 :: 		Button14.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button14+39)
MOVT	R0, #hi_addr(_Button14+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,650 :: 		Button14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button14+40)
MOVT	R0, #hi_addr(_Button14+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,651 :: 		Button14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button14+42)
MOVT	R0, #hi_addr(_Button14+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,652 :: 		Button14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button14+44)
MOVT	R0, #hi_addr(_Button14+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,653 :: 		Button14.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button14+46)
MOVT	R0, #hi_addr(_Button14+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,654 :: 		Button14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button14+50)
MOVT	R0, #hi_addr(_Button14+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,655 :: 		Button14.OnClickPtr = showImage14;
MOVW	R1, #lo_addr(_showImage14+0)
MOVT	R1, #hi_addr(_showImage14+0)
MOVW	R0, #lo_addr(_Button14+60)
MOVT	R0, #hi_addr(_Button14+60)
STR	R1, [R0, #0]
;MyProject_driver.c,657 :: 		Button15.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button15+0)
MOVT	R0, #hi_addr(_Button15+0)
STR	R1, [R0, #0]
;MyProject_driver.c,658 :: 		Button15.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Button15+4)
MOVT	R0, #hi_addr(_Button15+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,659 :: 		Button15.Left            = 301;
MOVW	R1, #301
MOVW	R0, #lo_addr(_Button15+6)
MOVT	R0, #hi_addr(_Button15+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,660 :: 		Button15.Top             = 345;
MOVW	R1, #345
MOVW	R0, #lo_addr(_Button15+8)
MOVT	R0, #hi_addr(_Button15+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,661 :: 		Button15.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button15+10)
MOVT	R0, #hi_addr(_Button15+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,662 :: 		Button15.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button15+12)
MOVT	R0, #hi_addr(_Button15+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,663 :: 		Button15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+14)
MOVT	R0, #hi_addr(_Button15+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,664 :: 		Button15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button15+16)
MOVT	R0, #hi_addr(_Button15+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,665 :: 		Button15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+18)
MOVT	R0, #hi_addr(_Button15+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,666 :: 		Button15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+19)
MOVT	R0, #hi_addr(_Button15+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,667 :: 		Button15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+20)
MOVT	R0, #hi_addr(_Button15+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,668 :: 		Button15.Caption         = Button15_Caption;
MOVW	R1, #lo_addr(_Button15_Caption+0)
MOVT	R1, #hi_addr(_Button15_Caption+0)
MOVW	R0, #lo_addr(_Button15+24)
MOVT	R0, #hi_addr(_Button15+24)
STR	R1, [R0, #0]
;MyProject_driver.c,669 :: 		Button15.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+28)
MOVT	R0, #hi_addr(_Button15+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,670 :: 		Button15.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+29)
MOVT	R0, #hi_addr(_Button15+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,671 :: 		Button15.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button15+32)
MOVT	R0, #hi_addr(_Button15+32)
STR	R3, [R0, #0]
;MyProject_driver.c,672 :: 		Button15.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+48)
MOVT	R0, #hi_addr(_Button15+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,673 :: 		Button15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button15+36)
MOVT	R0, #hi_addr(_Button15+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,674 :: 		Button15.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button15+38)
MOVT	R0, #hi_addr(_Button15+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,675 :: 		Button15.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button15+39)
MOVT	R0, #hi_addr(_Button15+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,676 :: 		Button15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button15+40)
MOVT	R0, #hi_addr(_Button15+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,677 :: 		Button15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button15+42)
MOVT	R0, #hi_addr(_Button15+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,678 :: 		Button15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button15+44)
MOVT	R0, #hi_addr(_Button15+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,679 :: 		Button15.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button15+46)
MOVT	R0, #hi_addr(_Button15+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,680 :: 		Button15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button15+50)
MOVT	R0, #hi_addr(_Button15+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,681 :: 		Button15.OnClickPtr = showImage15;
MOVW	R1, #lo_addr(_showImage15+0)
MOVT	R1, #hi_addr(_showImage15+0)
MOVW	R0, #lo_addr(_Button15+60)
MOVT	R0, #hi_addr(_Button15+60)
STR	R1, [R0, #0]
;MyProject_driver.c,683 :: 		Button16.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button16+0)
MOVT	R0, #hi_addr(_Button16+0)
STR	R1, [R0, #0]
;MyProject_driver.c,684 :: 		Button16.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Button16+4)
MOVT	R0, #hi_addr(_Button16+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,685 :: 		Button16.Left            = 421;
MOVW	R1, #421
MOVW	R0, #lo_addr(_Button16+6)
MOVT	R0, #hi_addr(_Button16+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,686 :: 		Button16.Top             = 345;
MOVW	R1, #345
MOVW	R0, #lo_addr(_Button16+8)
MOVT	R0, #hi_addr(_Button16+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,687 :: 		Button16.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Button16+10)
MOVT	R0, #hi_addr(_Button16+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,688 :: 		Button16.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Button16+12)
MOVT	R0, #hi_addr(_Button16+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,689 :: 		Button16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+14)
MOVT	R0, #hi_addr(_Button16+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,690 :: 		Button16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button16+16)
MOVT	R0, #hi_addr(_Button16+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,691 :: 		Button16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+18)
MOVT	R0, #hi_addr(_Button16+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,692 :: 		Button16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+19)
MOVT	R0, #hi_addr(_Button16+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,693 :: 		Button16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+20)
MOVT	R0, #hi_addr(_Button16+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,694 :: 		Button16.Caption         = Button16_Caption;
MOVW	R1, #lo_addr(_Button16_Caption+0)
MOVT	R1, #hi_addr(_Button16_Caption+0)
MOVW	R0, #lo_addr(_Button16+24)
MOVT	R0, #hi_addr(_Button16+24)
STR	R1, [R0, #0]
;MyProject_driver.c,695 :: 		Button16.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+28)
MOVT	R0, #hi_addr(_Button16+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,696 :: 		Button16.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+29)
MOVT	R0, #hi_addr(_Button16+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,697 :: 		Button16.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button16+32)
MOVT	R0, #hi_addr(_Button16+32)
STR	R3, [R0, #0]
;MyProject_driver.c,698 :: 		Button16.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+48)
MOVT	R0, #hi_addr(_Button16+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,699 :: 		Button16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button16+36)
MOVT	R0, #hi_addr(_Button16+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,700 :: 		Button16.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button16+38)
MOVT	R0, #hi_addr(_Button16+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,701 :: 		Button16.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button16+39)
MOVT	R0, #hi_addr(_Button16+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,702 :: 		Button16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button16+40)
MOVT	R0, #hi_addr(_Button16+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,703 :: 		Button16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button16+42)
MOVT	R0, #hi_addr(_Button16+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,704 :: 		Button16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button16+44)
MOVT	R0, #hi_addr(_Button16+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,705 :: 		Button16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button16+46)
MOVT	R0, #hi_addr(_Button16+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,706 :: 		Button16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button16+50)
MOVT	R0, #hi_addr(_Button16+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,707 :: 		Button16.OnClickPtr = showImage16;
MOVW	R1, #lo_addr(_showImage16+0)
MOVT	R1, #hi_addr(_showImage16+0)
MOVW	R0, #lo_addr(_Button16+60)
MOVT	R0, #hi_addr(_Button16+60)
STR	R1, [R0, #0]
;MyProject_driver.c,709 :: 		ButtonRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,710 :: 		ButtonRound1.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,711 :: 		ButtonRound1.Left            = 676;
MOVW	R1, #676
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,712 :: 		ButtonRound1.Top             = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,713 :: 		ButtonRound1.Width           = 99;
MOVS	R1, #99
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,714 :: 		ButtonRound1.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,715 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,716 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,717 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,718 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,719 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,720 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;MyProject_driver.c,721 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,722 :: 		ButtonRound1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+29)
MOVT	R0, #hi_addr(_ButtonRound1+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,723 :: 		ButtonRound1.FontName        = Tahoma12x16_Regular;
MOVW	R2, #lo_addr(_Tahoma12x16_Regular+0)
MOVT	R2, #hi_addr(_Tahoma12x16_Regular+0)
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R2, [R0, #0]
;MyProject_driver.c,724 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+49)
MOVT	R0, #hi_addr(_ButtonRound1+49)
STRB	R1, [R0, #0]
;MyProject_driver.c,725 :: 		ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,726 :: 		ButtonRound1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,727 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,728 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,729 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,730 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,731 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,732 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+50)
MOVT	R0, #hi_addr(_ButtonRound1+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,733 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,734 :: 		ButtonRound1.OnClickPtr = startGame;
MOVW	R1, #lo_addr(_startGame+0)
MOVT	R1, #hi_addr(_startGame+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;MyProject_driver.c,736 :: 		ButtonRound2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,737 :: 		ButtonRound2.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,738 :: 		ButtonRound2.Left            = 676;
MOVW	R1, #676
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,739 :: 		ButtonRound2.Top             = 377;
MOVW	R1, #377
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,740 :: 		ButtonRound2.Width           = 99;
MOVS	R1, #99
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,741 :: 		ButtonRound2.Height          = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,742 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,743 :: 		ButtonRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,744 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,745 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,746 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,747 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;MyProject_driver.c,748 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,749 :: 		ButtonRound2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+29)
MOVT	R0, #hi_addr(_ButtonRound2+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,750 :: 		ButtonRound2.FontName        = Tahoma12x16_Regular;
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R2, [R0, #0]
;MyProject_driver.c,751 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+49)
MOVT	R0, #hi_addr(_ButtonRound2+49)
STRB	R1, [R0, #0]
;MyProject_driver.c,752 :: 		ButtonRound2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,753 :: 		ButtonRound2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,754 :: 		ButtonRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,755 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,756 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,757 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,758 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,759 :: 		ButtonRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound2+50)
MOVT	R0, #hi_addr(_ButtonRound2+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,760 :: 		ButtonRound2.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,761 :: 		ButtonRound2.OnClickPtr = showResults;
MOVW	R1, #lo_addr(_showResults+0)
MOVT	R1, #hi_addr(_showResults+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;MyProject_driver.c,763 :: 		Vreme.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Vreme+0)
MOVT	R0, #hi_addr(_Vreme+0)
STR	R1, [R0, #0]
;MyProject_driver.c,764 :: 		Vreme.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Vreme+4)
MOVT	R0, #hi_addr(_Vreme+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,765 :: 		Vreme.Left            = 569;
MOVW	R1, #569
MOVW	R0, #lo_addr(_Vreme+6)
MOVT	R0, #hi_addr(_Vreme+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,766 :: 		Vreme.Top             = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Vreme+8)
MOVT	R0, #hi_addr(_Vreme+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,767 :: 		Vreme.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_Vreme+10)
MOVT	R0, #hi_addr(_Vreme+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,768 :: 		Vreme.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Vreme+12)
MOVT	R0, #hi_addr(_Vreme+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,769 :: 		Vreme.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Vreme+27)
MOVT	R0, #hi_addr(_Vreme+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,770 :: 		Vreme.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Vreme+28)
MOVT	R0, #hi_addr(_Vreme+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,771 :: 		Vreme.Caption         = Vreme_Caption;
MOVW	R1, #lo_addr(_Vreme_Caption+0)
MOVT	R1, #hi_addr(_Vreme_Caption+0)
MOVW	R0, #lo_addr(_Vreme+16)
MOVT	R0, #hi_addr(_Vreme+16)
STR	R1, [R0, #0]
;MyProject_driver.c,772 :: 		Vreme.FontName        = Tahoma20x24_Regular;
MOVW	R2, #lo_addr(_Tahoma20x24_Regular+0)
MOVT	R2, #hi_addr(_Tahoma20x24_Regular+0)
MOVW	R0, #lo_addr(_Vreme+20)
MOVT	R0, #hi_addr(_Vreme+20)
STR	R2, [R0, #0]
;MyProject_driver.c,773 :: 		Vreme.Font_Color      = 0xCFFF;
MOVW	R1, #53247
MOVW	R0, #lo_addr(_Vreme+24)
MOVT	R0, #hi_addr(_Vreme+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,774 :: 		Vreme.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Vreme+26)
MOVT	R0, #hi_addr(_Vreme+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,776 :: 		Rang_lista.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Rang_lista+0)
MOVT	R0, #hi_addr(_Rang_lista+0)
STR	R1, [R0, #0]
;MyProject_driver.c,777 :: 		Rang_lista.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Rang_lista+4)
MOVT	R0, #hi_addr(_Rang_lista+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,778 :: 		Rang_lista.Left            = 678;
MOVW	R1, #678
MOVW	R0, #lo_addr(_Rang_lista+6)
MOVT	R0, #hi_addr(_Rang_lista+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,779 :: 		Rang_lista.Top             = 84;
MOVS	R1, #84
MOVW	R0, #lo_addr(_Rang_lista+8)
MOVT	R0, #hi_addr(_Rang_lista+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,780 :: 		Rang_lista.Width           = 96;
MOVS	R1, #96
MOVW	R0, #lo_addr(_Rang_lista+10)
MOVT	R0, #hi_addr(_Rang_lista+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,781 :: 		Rang_lista.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Rang_lista+12)
MOVT	R0, #hi_addr(_Rang_lista+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,782 :: 		Rang_lista.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Rang_lista+27)
MOVT	R0, #hi_addr(_Rang_lista+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,783 :: 		Rang_lista.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Rang_lista+28)
MOVT	R0, #hi_addr(_Rang_lista+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,784 :: 		Rang_lista.Caption         = Rang_lista_Caption;
MOVW	R1, #lo_addr(_Rang_lista_Caption+0)
MOVT	R1, #hi_addr(_Rang_lista_Caption+0)
MOVW	R0, #lo_addr(_Rang_lista+16)
MOVT	R0, #hi_addr(_Rang_lista+16)
STR	R1, [R0, #0]
;MyProject_driver.c,785 :: 		Rang_lista.FontName        = Tahoma20x24_Regular;
MOVW	R0, #lo_addr(_Rang_lista+20)
MOVT	R0, #hi_addr(_Rang_lista+20)
STR	R2, [R0, #0]
;MyProject_driver.c,786 :: 		Rang_lista.Font_Color      = 0xCFFF;
MOVW	R1, #53247
MOVW	R0, #lo_addr(_Rang_lista+24)
MOVT	R0, #hi_addr(_Rang_lista+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,787 :: 		Rang_lista.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Rang_lista+26)
MOVT	R0, #hi_addr(_Rang_lista+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,789 :: 		Box1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,790 :: 		Box1.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,791 :: 		Box1.Left            = 564;
MOVW	R1, #564
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,792 :: 		Box1.Top             = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,793 :: 		Box1.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,794 :: 		Box1.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,795 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,796 :: 		Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,797 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,798 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,799 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,800 :: 		Box1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,801 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,802 :: 		Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,803 :: 		Box1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,804 :: 		Box1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,805 :: 		Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,806 :: 		Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,808 :: 		Box2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,809 :: 		Box2.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,810 :: 		Box2.Left            = 685;
MOVW	R1, #685
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,811 :: 		Box2.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,812 :: 		Box2.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,813 :: 		Box2.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,814 :: 		Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,815 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,816 :: 		Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,817 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,818 :: 		Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,819 :: 		Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,820 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,821 :: 		Box2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,822 :: 		Box2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,823 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,824 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,825 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,827 :: 		Box3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,828 :: 		Box3.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,829 :: 		Box3.Left            = 685;
MOVW	R1, #685
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,830 :: 		Box3.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,831 :: 		Box3.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,832 :: 		Box3.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,833 :: 		Box3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,834 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,835 :: 		Box3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,836 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,837 :: 		Box3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,838 :: 		Box3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,839 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,840 :: 		Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,841 :: 		Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,842 :: 		Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,843 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,844 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,846 :: 		Box4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box4+0)
MOVT	R0, #hi_addr(_Box4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,847 :: 		Box4.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box4+4)
MOVT	R0, #hi_addr(_Box4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,848 :: 		Box4.Left            = 685;
MOVW	R1, #685
MOVW	R0, #lo_addr(_Box4+6)
MOVT	R0, #hi_addr(_Box4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,849 :: 		Box4.Top             = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_Box4+8)
MOVT	R0, #hi_addr(_Box4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,850 :: 		Box4.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box4+10)
MOVT	R0, #hi_addr(_Box4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,851 :: 		Box4.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box4+12)
MOVT	R0, #hi_addr(_Box4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,852 :: 		Box4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+14)
MOVT	R0, #hi_addr(_Box4+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,853 :: 		Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+16)
MOVT	R0, #hi_addr(_Box4+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,854 :: 		Box4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+18)
MOVT	R0, #hi_addr(_Box4+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,855 :: 		Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+19)
MOVT	R0, #hi_addr(_Box4+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,856 :: 		Box4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+20)
MOVT	R0, #hi_addr(_Box4+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,857 :: 		Box4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+21)
MOVT	R0, #hi_addr(_Box4+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,858 :: 		Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+22)
MOVT	R0, #hi_addr(_Box4+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,859 :: 		Box4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box4+24)
MOVT	R0, #hi_addr(_Box4+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,860 :: 		Box4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+26)
MOVT	R0, #hi_addr(_Box4+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,861 :: 		Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+28)
MOVT	R0, #hi_addr(_Box4+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,862 :: 		Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+30)
MOVT	R0, #hi_addr(_Box4+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,863 :: 		Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box4+32)
MOVT	R0, #hi_addr(_Box4+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,865 :: 		Box5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box5+0)
MOVT	R0, #hi_addr(_Box5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,866 :: 		Box5.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Box5+4)
MOVT	R0, #hi_addr(_Box5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,867 :: 		Box5.Left            = 685;
MOVW	R1, #685
MOVW	R0, #lo_addr(_Box5+6)
MOVT	R0, #hi_addr(_Box5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,868 :: 		Box5.Top             = 241;
MOVS	R1, #241
MOVW	R0, #lo_addr(_Box5+8)
MOVT	R0, #hi_addr(_Box5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,869 :: 		Box5.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box5+10)
MOVT	R0, #hi_addr(_Box5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,870 :: 		Box5.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box5+12)
MOVT	R0, #hi_addr(_Box5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,871 :: 		Box5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+14)
MOVT	R0, #hi_addr(_Box5+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,872 :: 		Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+16)
MOVT	R0, #hi_addr(_Box5+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,873 :: 		Box5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+18)
MOVT	R0, #hi_addr(_Box5+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,874 :: 		Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+19)
MOVT	R0, #hi_addr(_Box5+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,875 :: 		Box5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+20)
MOVT	R0, #hi_addr(_Box5+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,876 :: 		Box5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+21)
MOVT	R0, #hi_addr(_Box5+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,877 :: 		Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+22)
MOVT	R0, #hi_addr(_Box5+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,878 :: 		Box5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box5+24)
MOVT	R0, #hi_addr(_Box5+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,879 :: 		Box5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+26)
MOVT	R0, #hi_addr(_Box5+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,880 :: 		Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+28)
MOVT	R0, #hi_addr(_Box5+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,881 :: 		Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+30)
MOVT	R0, #hi_addr(_Box5+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,882 :: 		Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box5+32)
MOVT	R0, #hi_addr(_Box5+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,884 :: 		Box6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,885 :: 		Box6.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box6+4)
MOVT	R0, #hi_addr(_Box6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,886 :: 		Box6.Left            = 685;
MOVW	R1, #685
MOVW	R0, #lo_addr(_Box6+6)
MOVT	R0, #hi_addr(_Box6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,887 :: 		Box6.Top             = 284;
MOVW	R1, #284
MOVW	R0, #lo_addr(_Box6+8)
MOVT	R0, #hi_addr(_Box6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,888 :: 		Box6.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Box6+10)
MOVT	R0, #hi_addr(_Box6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,889 :: 		Box6.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box6+12)
MOVT	R0, #hi_addr(_Box6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,890 :: 		Box6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+14)
MOVT	R0, #hi_addr(_Box6+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,891 :: 		Box6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+16)
MOVT	R0, #hi_addr(_Box6+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,892 :: 		Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+18)
MOVT	R0, #hi_addr(_Box6+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,893 :: 		Box6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+19)
MOVT	R0, #hi_addr(_Box6+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,894 :: 		Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+20)
MOVT	R0, #hi_addr(_Box6+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,895 :: 		Box6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+21)
MOVT	R0, #hi_addr(_Box6+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,896 :: 		Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+22)
MOVT	R0, #hi_addr(_Box6+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,897 :: 		Box6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+24)
MOVT	R0, #hi_addr(_Box6+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,898 :: 		Box6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box6+26)
MOVT	R0, #hi_addr(_Box6+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,899 :: 		Box6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box6+28)
MOVT	R0, #hi_addr(_Box6+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,900 :: 		Box6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+30)
MOVT	R0, #hi_addr(_Box6+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,901 :: 		Box6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box6+32)
MOVT	R0, #hi_addr(_Box6+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,903 :: 		Image5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,904 :: 		Image5.Order           = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,905 :: 		Image5.Left            = 551;
MOVW	R1, #551
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,906 :: 		Image5.Top             = 242;
MOVS	R1, #242
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,907 :: 		Image5.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,908 :: 		Image5.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,909 :: 		Image5.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,910 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,911 :: 		Image5.Picture_Name    = bajic_bmp;
MOVW	R1, #lo_addr(_bajic_bmp+0)
MOVT	R1, #hi_addr(_bajic_bmp+0)
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;MyProject_driver.c,912 :: 		Image5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,913 :: 		Image5.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,915 :: 		Image1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,916 :: 		Image1.Order           = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,917 :: 		Image1.Left            = 556;
MOVW	R1, #556
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,918 :: 		Image1.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,919 :: 		Image1.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,920 :: 		Image1.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,921 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,922 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,923 :: 		Image1.Picture_Name    = rajss_bmp;
MOVW	R1, #lo_addr(_rajss_bmp+0)
MOVT	R1, #hi_addr(_rajss_bmp+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;MyProject_driver.c,924 :: 		Image1.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,925 :: 		Image1.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,927 :: 		Image2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,928 :: 		Image2.Order           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,929 :: 		Image2.Left            = 554;
MOVW	R1, #554
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,930 :: 		Image2.Top             = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,931 :: 		Image2.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,932 :: 		Image2.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,933 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,934 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,935 :: 		Image2.Picture_Name    = bodic_bmp;
MOVW	R1, #lo_addr(_bodic_bmp+0)
MOVT	R1, #hi_addr(_bodic_bmp+0)
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;MyProject_driver.c,936 :: 		Image2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,937 :: 		Image2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,939 :: 		Image3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,940 :: 		Image3.Order           = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,941 :: 		Image3.Left            = 551;
MOVW	R1, #551
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,942 :: 		Image3.Top             = 252;
MOVS	R1, #252
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,943 :: 		Image3.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,944 :: 		Image3.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,945 :: 		Image3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,946 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,947 :: 		Image3.Picture_Name    = kalman_bmp;
MOVW	R1, #lo_addr(_kalman_bmp+0)
MOVT	R1, #hi_addr(_kalman_bmp+0)
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;MyProject_driver.c,948 :: 		Image3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,949 :: 		Image3.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,951 :: 		Image4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,952 :: 		Image4.Order           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,953 :: 		Image4.Left            = 552;
MOVW	R1, #552
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,954 :: 		Image4.Top             = 247;
MOVS	R1, #247
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,955 :: 		Image4.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,956 :: 		Image4.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,957 :: 		Image4.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,958 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,959 :: 		Image4.Picture_Name    = brkicc_bmp;
MOVW	R1, #lo_addr(_brkicc_bmp+0)
MOVT	R1, #hi_addr(_brkicc_bmp+0)
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;MyProject_driver.c,960 :: 		Image4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,961 :: 		Image4.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,963 :: 		Image6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,964 :: 		Image6.Order           = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,965 :: 		Image6.Left            = 553;
MOVW	R1, #553
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,966 :: 		Image6.Top             = 241;
MOVS	R1, #241
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,967 :: 		Image6.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,968 :: 		Image6.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,969 :: 		Image6.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,970 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,971 :: 		Image6.Picture_Name    = miraa_bmp;
MOVW	R1, #lo_addr(_miraa_bmp+0)
MOVT	R1, #hi_addr(_miraa_bmp+0)
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R1, [R0, #0]
;MyProject_driver.c,972 :: 		Image6.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,973 :: 		Image6.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,975 :: 		Image7.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;MyProject_driver.c,976 :: 		Image7.Order           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,977 :: 		Image7.Left            = 548;
MOVW	R1, #548
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,978 :: 		Image7.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,979 :: 		Image7.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,980 :: 		Image7.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,981 :: 		Image7.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,982 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,983 :: 		Image7.Picture_Name    = kisic_bmp;
MOVW	R1, #lo_addr(_kisic_bmp+0)
MOVT	R1, #hi_addr(_kisic_bmp+0)
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R1, [R0, #0]
;MyProject_driver.c,984 :: 		Image7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,985 :: 		Image7.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,987 :: 		Image8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;MyProject_driver.c,988 :: 		Image8.Order           = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,989 :: 		Image8.Left            = 551;
MOVW	R1, #551
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,990 :: 		Image8.Top             = 241;
MOVS	R1, #241
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,991 :: 		Image8.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,992 :: 		Image8.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,993 :: 		Image8.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,994 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,995 :: 		Image8.Picture_Name    = tomic_bmp;
MOVW	R1, #lo_addr(_tomic_bmp+0)
MOVT	R1, #hi_addr(_tomic_bmp+0)
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R1, [R0, #0]
;MyProject_driver.c,996 :: 		Image8.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,997 :: 		Image8.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,999 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1000 :: 		Label1.Order           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1001 :: 		Label1.Left            = 574;
MOVW	R1, #574
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1002 :: 		Label1.Top             = 58;
MOVS	R1, #58
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1003 :: 		Label1.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1004 :: 		Label1.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1005 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1006 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1007 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1008 :: 		Label1.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1009 :: 		Label1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1010 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1012 :: 		Label2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1013 :: 		Label2.Order           = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1014 :: 		Label2.Left            = 612;
MOVW	R1, #612
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1015 :: 		Label2.Top             = 58;
MOVS	R1, #58
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1016 :: 		Label2.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1017 :: 		Label2.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1018 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1019 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1020 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1021 :: 		Label2.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1022 :: 		Label2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1023 :: 		Label2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1025 :: 		Label3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1026 :: 		Label3.Order           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1027 :: 		Label3.Left            = 597;
MOVW	R1, #597
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1028 :: 		Label3.Top             = 56;
MOVS	R1, #56
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1029 :: 		Label3.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1030 :: 		Label3.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1031 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1032 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1033 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1034 :: 		Label3.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1035 :: 		Label3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1036 :: 		Label3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1038 :: 		Label4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1039 :: 		Label4.Order           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1040 :: 		Label4.Left            = 711;
MOVW	R1, #711
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1041 :: 		Label4.Top             = 126;
MOVS	R1, #126
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1042 :: 		Label4.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1043 :: 		Label4.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1044 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1045 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1046 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1047 :: 		Label4.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1048 :: 		Label4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1049 :: 		Label4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1051 :: 		Label5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1052 :: 		Label5.Order           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1053 :: 		Label5.Left            = 712;
MOVW	R1, #712
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1054 :: 		Label5.Top             = 166;
MOVS	R1, #166
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1055 :: 		Label5.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1056 :: 		Label5.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1057 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1058 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1059 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1060 :: 		Label5.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1061 :: 		Label5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1062 :: 		Label5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1064 :: 		Label6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1065 :: 		Label6.Order           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1066 :: 		Label6.Left            = 713;
MOVW	R1, #713
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1067 :: 		Label6.Top             = 206;
MOVS	R1, #206
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1068 :: 		Label6.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1069 :: 		Label6.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1070 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1071 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1072 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1073 :: 		Label6.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1074 :: 		Label6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1075 :: 		Label6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1077 :: 		Label7.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1078 :: 		Label7.Order           = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1079 :: 		Label7.Left            = 714;
MOVW	R1, #714
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1080 :: 		Label7.Top             = 247;
MOVS	R1, #247
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1081 :: 		Label7.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1082 :: 		Label7.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1083 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1084 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1085 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1086 :: 		Label7.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1087 :: 		Label7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1088 :: 		Label7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1090 :: 		Label8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1091 :: 		Label8.Order           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1092 :: 		Label8.Left            = 716;
MOVW	R1, #716
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1093 :: 		Label8.Top             = 287;
MOVW	R1, #287
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1094 :: 		Label8.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1095 :: 		Label8.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1096 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1097 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1098 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1099 :: 		Label8.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1100 :: 		Label8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1101 :: 		Label8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1103 :: 		Label9.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1104 :: 		Label9.Order           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1105 :: 		Label9.Left            = 666;
MOVW	R1, #666
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1106 :: 		Label9.Top             = 127;
MOVS	R1, #127
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1107 :: 		Label9.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1108 :: 		Label9.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1109 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1110 :: 		Label9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1111 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1112 :: 		Label9.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1113 :: 		Label9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1114 :: 		Label9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1116 :: 		Label10.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1117 :: 		Label10.Order           = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1118 :: 		Label10.Left            = 665;
MOVW	R1, #665
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1119 :: 		Label10.Top             = 170;
MOVS	R1, #170
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1120 :: 		Label10.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1121 :: 		Label10.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1122 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1123 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1124 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1125 :: 		Label10.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1126 :: 		Label10.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1127 :: 		Label10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1129 :: 		Label11.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1130 :: 		Label11.Order           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1131 :: 		Label11.Left            = 666;
MOVW	R1, #666
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1132 :: 		Label11.Top             = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1133 :: 		Label11.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1134 :: 		Label11.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1135 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1136 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1137 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1138 :: 		Label11.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1139 :: 		Label11.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1140 :: 		Label11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1142 :: 		Label12.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1143 :: 		Label12.Order           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1144 :: 		Label12.Left            = 667;
MOVW	R1, #667
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1145 :: 		Label12.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1146 :: 		Label12.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1147 :: 		Label12.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1148 :: 		Label12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1149 :: 		Label12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1150 :: 		Label12.Caption         = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1151 :: 		Label12.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1152 :: 		Label12.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1153 :: 		Label12.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1155 :: 		Label13.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;MyProject_driver.c,1156 :: 		Label13.Order           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,1157 :: 		Label13.Left            = 666;
MOVW	R1, #666
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,1158 :: 		Label13.Top             = 290;
MOVW	R1, #290
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,1159 :: 		Label13.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,1160 :: 		Label13.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,1161 :: 		Label13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,1162 :: 		Label13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,1163 :: 		Label13.Caption         = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;MyProject_driver.c,1164 :: 		Label13.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R3, [R0, #0]
;MyProject_driver.c,1165 :: 		Label13.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,1166 :: 		Label13.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,1167 :: 		}
L_end_InitializeObjects:
BX	LR
; end of MyProject_driver_InitializeObjects
MyProject_driver_IsInsideObject:
;MyProject_driver.c,1169 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;MyProject_driver.c,1170 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_MyProject_driver_IsInsideObject185
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_MyProject_driver_IsInsideObject184
; X end address is: 0 (R0)
;MyProject_driver.c,1171 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_MyProject_driver_IsInsideObject183
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_MyProject_driver_IsInsideObject182
; Y end address is: 4 (R1)
L_MyProject_driver_IsInsideObject181:
;MyProject_driver.c,1172 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;MyProject_driver.c,1170 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_MyProject_driver_IsInsideObject185:
L_MyProject_driver_IsInsideObject184:
;MyProject_driver.c,1171 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_MyProject_driver_IsInsideObject183:
L_MyProject_driver_IsInsideObject182:
;MyProject_driver.c,1174 :: 		return 0;
MOVS	R0, #0
;MyProject_driver.c,1175 :: 		}
L_end_IsInsideObject:
BX	LR
; end of MyProject_driver_IsInsideObject
_DrawButton:
;MyProject_driver.c,1184 :: 		void DrawButton(TButton *Abutton) {
; Abutton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Abutton end address is: 0 (R0)
; Abutton start address is: 0 (R0)
;MyProject_driver.c,1186 :: 		if (Abutton->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton4
;MyProject_driver.c,1187 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton5
;MyProject_driver.c,1188 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,1189 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,1190 :: 		}
IT	AL
BAL	L_DrawButton6
L_DrawButton5:
;MyProject_driver.c,1192 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,1193 :: 		}
L_DrawButton6:
;MyProject_driver.c,1194 :: 		TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,1195 :: 		TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;MyProject_driver.c,1196 :: 		if (Abutton->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton7
;MyProject_driver.c,1197 :: 		TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawButton8
L_DrawButton7:
;MyProject_driver.c,1199 :: 		TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawButton8:
;MyProject_driver.c,1200 :: 		TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MyProject_driver.c,1201 :: 		if (Abutton->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton9
;MyProject_driver.c,1202 :: 		ALeft = Abutton->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton10
L_DrawButton9:
;MyProject_driver.c,1203 :: 		else if (Abutton->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton11
;MyProject_driver.c,1204 :: 		ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton12
L_DrawButton11:
;MyProject_driver.c,1205 :: 		else if (Abutton->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton13
;MyProject_driver.c,1206 :: 		ALeft = Abutton->Left + Abutton->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawButton13:
L_DrawButton12:
L_DrawButton10:
;MyProject_driver.c,1208 :: 		if (Abutton->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton14
;MyProject_driver.c,1209 :: 		ATop = Abutton->Top + 4;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton15
L_DrawButton14:
;MyProject_driver.c,1210 :: 		else if (Abutton->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton16
;MyProject_driver.c,1211 :: 		ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton17
L_DrawButton16:
;MyProject_driver.c,1212 :: 		else if (Abutton->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton18
;MyProject_driver.c,1213 :: 		ATop = Abutton->Top + (Abutton->Height - caption_height - 4);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
L_DrawButton18:
L_DrawButton17:
L_DrawButton15:
;MyProject_driver.c,1215 :: 		TFT_Write_Text(Abutton->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;MyProject_driver.c,1216 :: 		}
L_DrawButton4:
;MyProject_driver.c,1217 :: 		}
L_end_DrawButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawButton
_DrawRoundButton:
;MyProject_driver.c,1219 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;MyProject_driver.c,1221 :: 		if (Around_button->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton19
;MyProject_driver.c,1222 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton20
;MyProject_driver.c,1223 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,1225 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MyProject_driver.c,1224 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MyProject_driver.c,1225 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_driver.c,1224 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;MyProject_driver.c,1226 :: 		}
IT	AL
BAL	L_DrawRoundButton21
L_DrawRoundButton20:
;MyProject_driver.c,1229 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MyProject_driver.c,1228 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MyProject_driver.c,1229 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_driver.c,1228 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;MyProject_driver.c,1230 :: 		}
L_DrawRoundButton21:
;MyProject_driver.c,1231 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,1234 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;MyProject_driver.c,1233 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;MyProject_driver.c,1232 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;MyProject_driver.c,1234 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;MyProject_driver.c,1232 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;MyProject_driver.c,1233 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;MyProject_driver.c,1234 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;MyProject_driver.c,1235 :: 		if (Around_button->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton22
;MyProject_driver.c,1236 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawRoundButton23
L_DrawRoundButton22:
;MyProject_driver.c,1238 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawRoundButton23:
;MyProject_driver.c,1239 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MyProject_driver.c,1240 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton24
;MyProject_driver.c,1241 :: 		ALeft = Around_button->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton25
L_DrawRoundButton24:
;MyProject_driver.c,1242 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton26
;MyProject_driver.c,1243 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;MyProject_driver.c,1244 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton28
;MyProject_driver.c,1245 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawRoundButton28:
L_DrawRoundButton27:
L_DrawRoundButton25:
;MyProject_driver.c,1247 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton29
;MyProject_driver.c,1248 :: 		ATop = Around_button->Top + 3;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #3
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton30
L_DrawRoundButton29:
;MyProject_driver.c,1249 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton31
;MyProject_driver.c,1250 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton32
L_DrawRoundButton31:
;MyProject_driver.c,1251 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton33
;MyProject_driver.c,1252 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #10]
L_DrawRoundButton33:
L_DrawRoundButton32:
L_DrawRoundButton30:
;MyProject_driver.c,1254 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;MyProject_driver.c,1255 :: 		}
L_DrawRoundButton19:
;MyProject_driver.c,1256 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;MyProject_driver.c,1258 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;MyProject_driver.c,1259 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel34
;MyProject_driver.c,1260 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel35
;MyProject_driver.c,1261 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel36
L_DrawLabel35:
;MyProject_driver.c,1263 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawLabel36:
;MyProject_driver.c,1264 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;MyProject_driver.c,1265 :: 		}
L_DrawLabel34:
;MyProject_driver.c,1266 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;MyProject_driver.c,1268 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;MyProject_driver.c,1269 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage37
;MyProject_driver.c,1270 :: 		TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Image+0
;MyProject_driver.c,1271 :: 		}
L_DrawImage37:
;MyProject_driver.c,1272 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawBox:
;MyProject_driver.c,1274 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;MyProject_driver.c,1275 :: 		if (ABox->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawBox38
;MyProject_driver.c,1276 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox39
;MyProject_driver.c,1277 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,1278 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,1279 :: 		}
IT	AL
BAL	L_DrawBox40
L_DrawBox39:
;MyProject_driver.c,1281 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,1282 :: 		}
L_DrawBox40:
;MyProject_driver.c,1283 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,1284 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;MyProject_driver.c,1285 :: 		}
L_DrawBox38:
;MyProject_driver.c,1286 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawScreen:
;MyProject_driver.c,1288 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #48
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;MyProject_driver.c,1302 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,1303 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;MyProject_driver.c,1304 :: 		button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;MyProject_driver.c,1305 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;MyProject_driver.c,1306 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;MyProject_driver.c,1307 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;MyProject_driver.c,1308 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;MyProject_driver.c,1309 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;MyProject_driver.c,1311 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen188
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen187
IT	AL
BAL	L_DrawScreen43
L__DrawScreen188:
L__DrawScreen187:
;MyProject_driver.c,1312 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOC_PDOR+0)
MOVT	R2, #hi_addr(GPIOC_PDOR+0)
_LX	[R2, ByteOffset(GPIOC_PDOR+0)]
STRB	R1, [SP, #44]
;MyProject_driver.c,1313 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,1314 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;MyProject_driver.c,1315 :: 		TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963_Board_50+0
;MyProject_driver.c,1316 :: 		FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_FT5XX6_SetSize+0
;MyProject_driver.c,1317 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;MyProject_driver.c,1318 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;MyProject_driver.c,1319 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;MyProject_driver.c,1320 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;MyProject_driver.c,1321 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #44]
MOVW	R1, #lo_addr(GPIOC_PDOR+0)
MOVT	R1, #hi_addr(GPIOC_PDOR+0)
_SX	[R1, ByteOffset(GPIOC_PDOR+0)]
;MyProject_driver.c,1322 :: 		}
IT	AL
BAL	L_DrawScreen44
L_DrawScreen43:
;MyProject_driver.c,1324 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen44:
;MyProject_driver.c,1327 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen45:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen46
;MyProject_driver.c,1328 :: 		if (button_idx < CurrentScreen->ButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen47
;MyProject_driver.c,1329 :: 		local_button = GetButton(button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;MyProject_driver.c,1330 :: 		if (order == local_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen48
;MyProject_driver.c,1331 :: 		button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;MyProject_driver.c,1332 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1333 :: 		DrawButton(local_button);
LDR	R0, [SP, #8]
BL	_DrawButton+0
;MyProject_driver.c,1334 :: 		}
L_DrawScreen48:
;MyProject_driver.c,1335 :: 		}
L_DrawScreen47:
;MyProject_driver.c,1337 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen49
;MyProject_driver.c,1338 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;MyProject_driver.c,1339 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen50
;MyProject_driver.c,1340 :: 		round_button_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;MyProject_driver.c,1341 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1342 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #16]
BL	_DrawRoundButton+0
;MyProject_driver.c,1343 :: 		}
L_DrawScreen50:
;MyProject_driver.c,1344 :: 		}
L_DrawScreen49:
;MyProject_driver.c,1346 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen51
;MyProject_driver.c,1347 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;MyProject_driver.c,1348 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen52
;MyProject_driver.c,1349 :: 		label_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;MyProject_driver.c,1350 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1351 :: 		DrawLabel(local_label);
LDR	R0, [SP, #24]
BL	_DrawLabel+0
;MyProject_driver.c,1352 :: 		}
L_DrawScreen52:
;MyProject_driver.c,1353 :: 		}
L_DrawScreen51:
;MyProject_driver.c,1355 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen53
;MyProject_driver.c,1356 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;MyProject_driver.c,1357 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen54
;MyProject_driver.c,1358 :: 		box_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;MyProject_driver.c,1359 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1360 :: 		DrawBox(local_box);
LDR	R0, [SP, #40]
BL	_DrawBox+0
;MyProject_driver.c,1361 :: 		}
L_DrawScreen54:
;MyProject_driver.c,1362 :: 		}
L_DrawScreen53:
;MyProject_driver.c,1364 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen55
;MyProject_driver.c,1365 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;MyProject_driver.c,1366 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen56
;MyProject_driver.c,1367 :: 		image_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;MyProject_driver.c,1368 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1369 :: 		DrawImage(local_image);
LDR	R0, [SP, #32]
BL	_DrawImage+0
;MyProject_driver.c,1370 :: 		}
L_DrawScreen56:
;MyProject_driver.c,1371 :: 		}
L_DrawScreen55:
;MyProject_driver.c,1373 :: 		}
IT	AL
BAL	L_DrawScreen45
L_DrawScreen46:
;MyProject_driver.c,1374 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #48
BX	LR
; end of _DrawScreen
_Get_Object:
;MyProject_driver.c,1376 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1377 :: 		button_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1378 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1379 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1380 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1381 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1383 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object57:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object58
;MyProject_driver.c,1384 :: 		local_button = GetButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_button+0)
MOVT	R2, #hi_addr(_local_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1385 :: 		if (local_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object60
;MyProject_driver.c,1387 :: 		local_button->Width, local_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_button+0)
MOVT	R6, #hi_addr(_local_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1386 :: 		if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,1387 :: 		local_button->Width, local_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object61
;MyProject_driver.c,1388 :: 		button_order = local_button->Order;
MOVW	R4, #lo_addr(_local_button+0)
MOVT	R4, #hi_addr(_local_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1389 :: 		exec_button = local_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1390 :: 		}
L_Get_Object61:
;MyProject_driver.c,1391 :: 		}
L_Get_Object60:
;MyProject_driver.c,1383 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1392 :: 		}
IT	AL
BAL	L_Get_Object57
L_Get_Object58:
;MyProject_driver.c,1395 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object62:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object63
;MyProject_driver.c,1396 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1397 :: 		if (local_round_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object65
;MyProject_driver.c,1399 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1398 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MyProject_driver.c,1399 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object66
;MyProject_driver.c,1400 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1401 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1402 :: 		}
L_Get_Object66:
;MyProject_driver.c,1403 :: 		}
L_Get_Object65:
;MyProject_driver.c,1395 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1404 :: 		}
IT	AL
BAL	L_Get_Object62
L_Get_Object63:
;MyProject_driver.c,1407 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object67:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object68
;MyProject_driver.c,1408 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1409 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object70
;MyProject_driver.c,1411 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1410 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,1411 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object71
;MyProject_driver.c,1412 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1413 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1414 :: 		}
L_Get_Object71:
;MyProject_driver.c,1415 :: 		}
L_Get_Object70:
;MyProject_driver.c,1407 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1416 :: 		}
IT	AL
BAL	L_Get_Object67
L_Get_Object68:
;MyProject_driver.c,1419 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object72:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object73
;MyProject_driver.c,1420 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1421 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object75
;MyProject_driver.c,1423 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1422 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MyProject_driver.c,1423 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object76
;MyProject_driver.c,1424 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1425 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1426 :: 		}
L_Get_Object76:
;MyProject_driver.c,1427 :: 		}
L_Get_Object75:
;MyProject_driver.c,1419 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1428 :: 		}
IT	AL
BAL	L_Get_Object72
L_Get_Object73:
;MyProject_driver.c,1431 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object77:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
; Y start address is: 28 (R7)
; Y end address is: 28 (R7)
; X start address is: 32 (R8)
; X end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object78
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
;MyProject_driver.c,1432 :: 		local_box = GetBox(_object_count);
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1433 :: 		if (local_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object80
;MyProject_driver.c,1435 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1434 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,1435 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object81
;MyProject_driver.c,1436 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1437 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1438 :: 		}
L_Get_Object81:
;MyProject_driver.c,1439 :: 		}
L_Get_Object80:
;MyProject_driver.c,1431 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1440 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object77
L_Get_Object78:
;MyProject_driver.c,1442 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1443 :: 		if (button_order >  _object_count )
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object82
;MyProject_driver.c,1444 :: 		_object_count = button_order;
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object82:
;MyProject_driver.c,1445 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object83
;MyProject_driver.c,1446 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object83:
;MyProject_driver.c,1447 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object84
;MyProject_driver.c,1448 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object84:
;MyProject_driver.c,1449 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object85
;MyProject_driver.c,1450 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object85:
;MyProject_driver.c,1451 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object86
;MyProject_driver.c,1452 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object86:
;MyProject_driver.c,1453 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;MyProject_driver.c,1456 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1457 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1458 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1459 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1460 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1461 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1463 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,1465 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press87
;MyProject_driver.c,1466 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press88
;MyProject_driver.c,1467 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press89
;MyProject_driver.c,1468 :: 		if (exec_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press90
;MyProject_driver.c,1469 :: 		exec_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1470 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1471 :: 		}
L_Process_TP_Press90:
;MyProject_driver.c,1472 :: 		}
L_Process_TP_Press89:
;MyProject_driver.c,1473 :: 		}
L_Process_TP_Press88:
;MyProject_driver.c,1475 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press91
;MyProject_driver.c,1476 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press92
;MyProject_driver.c,1477 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press93
;MyProject_driver.c,1478 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1479 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1480 :: 		}
L_Process_TP_Press93:
;MyProject_driver.c,1481 :: 		}
L_Process_TP_Press92:
;MyProject_driver.c,1482 :: 		}
L_Process_TP_Press91:
;MyProject_driver.c,1484 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press94
;MyProject_driver.c,1485 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press95
;MyProject_driver.c,1486 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press96
;MyProject_driver.c,1487 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1488 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1489 :: 		}
L_Process_TP_Press96:
;MyProject_driver.c,1490 :: 		}
L_Process_TP_Press95:
;MyProject_driver.c,1491 :: 		}
L_Process_TP_Press94:
;MyProject_driver.c,1493 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press97
;MyProject_driver.c,1494 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press98
;MyProject_driver.c,1495 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press99
;MyProject_driver.c,1496 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1497 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1498 :: 		}
L_Process_TP_Press99:
;MyProject_driver.c,1499 :: 		}
L_Process_TP_Press98:
;MyProject_driver.c,1500 :: 		}
L_Process_TP_Press97:
;MyProject_driver.c,1502 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press100
;MyProject_driver.c,1503 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press101
;MyProject_driver.c,1504 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press102
;MyProject_driver.c,1505 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1506 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1507 :: 		}
L_Process_TP_Press102:
;MyProject_driver.c,1508 :: 		}
L_Process_TP_Press101:
;MyProject_driver.c,1509 :: 		}
L_Process_TP_Press100:
;MyProject_driver.c,1511 :: 		}
L_Process_TP_Press87:
;MyProject_driver.c,1512 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;MyProject_driver.c,1514 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1516 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up103
;MyProject_driver.c,1518 :: 		case 0: {
L_Process_TP_Up105:
;MyProject_driver.c,1519 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up106
;MyProject_driver.c,1520 :: 		exec_button = (TButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1521 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up193
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up192
L__Process_TP_Up191:
;MyProject_driver.c,1522 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,1521 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up193:
L__Process_TP_Up192:
;MyProject_driver.c,1524 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1525 :: 		}
L_Process_TP_Up106:
;MyProject_driver.c,1526 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1529 :: 		case 1: {
L_Process_TP_Up110:
;MyProject_driver.c,1530 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up111
;MyProject_driver.c,1531 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1532 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up195
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up194
L__Process_TP_Up190:
;MyProject_driver.c,1533 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,1532 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up195:
L__Process_TP_Up194:
;MyProject_driver.c,1535 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1536 :: 		}
L_Process_TP_Up111:
;MyProject_driver.c,1537 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1540 :: 		case 6: {
L_Process_TP_Up115:
;MyProject_driver.c,1541 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up116
;MyProject_driver.c,1542 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1543 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up197
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up196
L__Process_TP_Up189:
;MyProject_driver.c,1544 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,1543 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up197:
L__Process_TP_Up196:
;MyProject_driver.c,1546 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1547 :: 		}
L_Process_TP_Up116:
;MyProject_driver.c,1548 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1550 :: 		}
L_Process_TP_Up103:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up105
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_Process_TP_Up110
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up115
L_Process_TP_Up104:
;MyProject_driver.c,1552 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1553 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1555 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,1558 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up120
;MyProject_driver.c,1560 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up121
;MyProject_driver.c,1561 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up122
;MyProject_driver.c,1562 :: 		if (exec_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up123
;MyProject_driver.c,1563 :: 		exec_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up123:
;MyProject_driver.c,1564 :: 		if (PressedObject == (void *)exec_button)
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up124
;MyProject_driver.c,1565 :: 		if (exec_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up125
;MyProject_driver.c,1566 :: 		exec_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up125:
L_Process_TP_Up124:
;MyProject_driver.c,1567 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1568 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1569 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1570 :: 		}
L_Process_TP_Up122:
;MyProject_driver.c,1571 :: 		}
L_Process_TP_Up121:
;MyProject_driver.c,1574 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up126
;MyProject_driver.c,1575 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up127
;MyProject_driver.c,1576 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up128
;MyProject_driver.c,1577 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up128:
;MyProject_driver.c,1578 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up129
;MyProject_driver.c,1579 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up130
;MyProject_driver.c,1580 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up130:
L_Process_TP_Up129:
;MyProject_driver.c,1581 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1582 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1583 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1584 :: 		}
L_Process_TP_Up127:
;MyProject_driver.c,1585 :: 		}
L_Process_TP_Up126:
;MyProject_driver.c,1588 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up131
;MyProject_driver.c,1589 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up132
;MyProject_driver.c,1590 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up133
;MyProject_driver.c,1591 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up133:
;MyProject_driver.c,1592 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up134
;MyProject_driver.c,1593 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up135
;MyProject_driver.c,1594 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up135:
L_Process_TP_Up134:
;MyProject_driver.c,1595 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1596 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1597 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1598 :: 		}
L_Process_TP_Up132:
;MyProject_driver.c,1599 :: 		}
L_Process_TP_Up131:
;MyProject_driver.c,1602 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up136
;MyProject_driver.c,1603 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up137
;MyProject_driver.c,1604 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up138
;MyProject_driver.c,1605 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up138:
;MyProject_driver.c,1606 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up139
;MyProject_driver.c,1607 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up140
;MyProject_driver.c,1608 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up140:
L_Process_TP_Up139:
;MyProject_driver.c,1609 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1610 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1611 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1612 :: 		}
L_Process_TP_Up137:
;MyProject_driver.c,1613 :: 		}
L_Process_TP_Up136:
;MyProject_driver.c,1616 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up141
;MyProject_driver.c,1617 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up142
;MyProject_driver.c,1618 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up143
;MyProject_driver.c,1619 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up143:
;MyProject_driver.c,1620 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up144
;MyProject_driver.c,1621 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up145
;MyProject_driver.c,1622 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up145:
L_Process_TP_Up144:
;MyProject_driver.c,1623 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1624 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1625 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1626 :: 		}
L_Process_TP_Up142:
;MyProject_driver.c,1627 :: 		}
L_Process_TP_Up141:
;MyProject_driver.c,1629 :: 		}
L_Process_TP_Up120:
;MyProject_driver.c,1630 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1631 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1632 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;MyProject_driver.c,1634 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1636 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1637 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1638 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1639 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1640 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1641 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1643 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,1645 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down146
;MyProject_driver.c,1646 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down147
;MyProject_driver.c,1647 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down148
;MyProject_driver.c,1648 :: 		if (exec_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down149
;MyProject_driver.c,1649 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1650 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawButton+0
;MyProject_driver.c,1651 :: 		}
L_Process_TP_Down149:
;MyProject_driver.c,1652 :: 		PressedObject = (void *)exec_button;
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1653 :: 		PressedObjectType = 0;
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1654 :: 		if (exec_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down150
;MyProject_driver.c,1655 :: 		exec_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1656 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1657 :: 		}
L_Process_TP_Down150:
;MyProject_driver.c,1658 :: 		}
L_Process_TP_Down148:
;MyProject_driver.c,1659 :: 		}
L_Process_TP_Down147:
;MyProject_driver.c,1661 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down151
;MyProject_driver.c,1662 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down152
;MyProject_driver.c,1663 :: 		if (exec_round_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down153
;MyProject_driver.c,1664 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1665 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;MyProject_driver.c,1666 :: 		}
L_Process_TP_Down153:
;MyProject_driver.c,1667 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1668 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1669 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down154
;MyProject_driver.c,1670 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1671 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1672 :: 		}
L_Process_TP_Down154:
;MyProject_driver.c,1673 :: 		}
L_Process_TP_Down152:
;MyProject_driver.c,1674 :: 		}
L_Process_TP_Down151:
;MyProject_driver.c,1676 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down155
;MyProject_driver.c,1677 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down156
;MyProject_driver.c,1678 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1679 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1680 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down157
;MyProject_driver.c,1681 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1682 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1683 :: 		}
L_Process_TP_Down157:
;MyProject_driver.c,1684 :: 		}
L_Process_TP_Down156:
;MyProject_driver.c,1685 :: 		}
L_Process_TP_Down155:
;MyProject_driver.c,1687 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down158
;MyProject_driver.c,1688 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down159
;MyProject_driver.c,1689 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1690 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1691 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down160
;MyProject_driver.c,1692 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1693 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1694 :: 		}
L_Process_TP_Down160:
;MyProject_driver.c,1695 :: 		}
L_Process_TP_Down159:
;MyProject_driver.c,1696 :: 		}
L_Process_TP_Down158:
;MyProject_driver.c,1698 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down161
;MyProject_driver.c,1699 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down162
;MyProject_driver.c,1700 :: 		if (exec_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down163
;MyProject_driver.c,1701 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1702 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;MyProject_driver.c,1703 :: 		}
L_Process_TP_Down163:
;MyProject_driver.c,1704 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1705 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1706 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down164
;MyProject_driver.c,1707 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1708 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1709 :: 		}
L_Process_TP_Down164:
;MyProject_driver.c,1710 :: 		}
L_Process_TP_Down162:
;MyProject_driver.c,1711 :: 		}
L_Process_TP_Down161:
;MyProject_driver.c,1713 :: 		}
L_Process_TP_Down146:
;MyProject_driver.c,1714 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;MyProject_driver.c,1716 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1717 :: 		if (FT5XX6_PressDetect()) {
BL	_FT5XX6_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP165
;MyProject_driver.c,1718 :: 		if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_FT5XX6_GetCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP166
;MyProject_driver.c,1720 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;MyProject_driver.c,1721 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP167
;MyProject_driver.c,1722 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,1723 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;MyProject_driver.c,1724 :: 		}
L_Check_TP167:
;MyProject_driver.c,1725 :: 		}
L_Check_TP166:
;MyProject_driver.c,1726 :: 		}
IT	AL
BAL	L_Check_TP168
L_Check_TP165:
;MyProject_driver.c,1727 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP169
;MyProject_driver.c,1728 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,1729 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;MyProject_driver.c,1730 :: 		}
L_Check_TP169:
L_Check_TP168:
;MyProject_driver.c,1731 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;MyProject_driver.c,1733 :: 		void Init_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1735 :: 		GPIO_Digital_Output(&GPIOE_PDOR, _GPIO_PINMASK_24);
MOV	R1, #16777216
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
BL	_GPIO_Digital_Output+0
;MyProject_driver.c,1736 :: 		GPIO_Digital_Input (&GPIOE_PDIR, _GPIO_PINMASK_25);
MOV	R1, #33554432
MOVW	R0, #lo_addr(GPIOE_PDIR+0)
MOVT	R0, #hi_addr(GPIOE_PDIR+0)
BL	_GPIO_Digital_Input+0
;MyProject_driver.c,1737 :: 		GPIOE_PDOR.B24 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
_SX	[R0, ByteOffset(GPIOE_PDOR+0)]
;MyProject_driver.c,1738 :: 		while (GPIOE_PDIR.B25 == 0)
L_Init_MCU170:
MOVW	R0, #lo_addr(GPIOE_PDIR+0)
MOVT	R0, #hi_addr(GPIOE_PDIR+0)
_LX	[R0, ByteOffset(GPIOE_PDIR+0)]
CMP	R0, #0
IT	NE
BNE	L_Init_MCU171
;MyProject_driver.c,1740 :: 		GPIOE_PDOR.B24 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
_SX	[R0, ByteOffset(GPIOE_PDOR+0)]
;MyProject_driver.c,1741 :: 		Delay_us(10);
MOVW	R7, #398
MOVT	R7, #0
NOP
NOP
L_Init_MCU172:
SUBS	R7, R7, #1
BNE	L_Init_MCU172
NOP
NOP
NOP
;MyProject_driver.c,1742 :: 		GPIOE_PDOR.B24 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_PDOR+0)
MOVT	R0, #hi_addr(GPIOE_PDOR+0)
_SX	[R0, ByteOffset(GPIOE_PDOR+0)]
;MyProject_driver.c,1743 :: 		Delay_us(10);
MOVW	R7, #398
MOVT	R7, #0
NOP
NOP
L_Init_MCU174:
SUBS	R7, R7, #1
BNE	L_Init_MCU174
NOP
NOP
NOP
;MyProject_driver.c,1744 :: 		}
IT	AL
BAL	L_Init_MCU170
L_Init_MCU171:
;MyProject_driver.c,1745 :: 		I2C0_Init_Advanced(400000, &_GPIO_Module_I2C0_PE24_25);
MOVW	R1, #lo_addr(__GPIO_Module_I2C0_PE24_25+0)
MOVT	R1, #hi_addr(__GPIO_Module_I2C0_PE24_25+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C0_Init_Advanced+0
;MyProject_driver.c,1747 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;MyProject_driver.c,1748 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_FT5XX6_Config:
;MyProject_driver.c,1750 :: 		char FT5XX6_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1751 :: 		FT5XX6_SetI2CAddress(0x38);
MOVS	R0, #56
BL	_FT5XX6_SetI2CAddress+0
;MyProject_driver.c,1752 :: 		if (FT5XX6_IsOperational() != FT5XX6_OK)
BL	_FT5XX6_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_FT5XX6_Config176
;MyProject_driver.c,1753 :: 		return  FT5XX6_FAILURE;
MOVS	R0, #1
IT	AL
BAL	L_end_FT5XX6_Config
L_FT5XX6_Config176:
;MyProject_driver.c,1754 :: 		FT5XX6_SetDefaultMode();
BL	_FT5XX6_SetDefaultMode+0
;MyProject_driver.c,1755 :: 		FT5XX6_SetController(_TC_FT5X06);
MOVS	R0, #1
BL	_FT5XX6_SetController+0
;MyProject_driver.c,1756 :: 		FT5XX6_SetSizeAndRotation(800,480,0);
MOVS	R2, #0
MOVW	R1, #480
MOVW	R0, #800
BL	_FT5XX6_SetSizeAndRotation+0
;MyProject_driver.c,1757 :: 		return FT5XX6_OK;
MOVS	R0, #0
;MyProject_driver.c,1758 :: 		}
L_end_FT5XX6_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FT5XX6_Config
_Start_TP:
;MyProject_driver.c,1760 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1761 :: 		Init_MCU();
BL	_Init_MCU+0
;MyProject_driver.c,1763 :: 		InitializeTouchPanel();
BL	MyProject_driver_InitializeTouchPanel+0
;MyProject_driver.c,1764 :: 		if (FT5XX6_Config() == FT5XX6_OK) {
BL	_FT5XX6_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP177
;MyProject_driver.c,1765 :: 		} else {
IT	AL
BAL	L_Start_TP178
L_Start_TP177:
;MyProject_driver.c,1766 :: 		while(1);
L_Start_TP179:
IT	AL
BAL	L_Start_TP179
;MyProject_driver.c,1767 :: 		}
L_Start_TP178:
;MyProject_driver.c,1770 :: 		InitializeObjects();
BL	MyProject_driver_InitializeObjects+0
;MyProject_driver.c,1771 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,1772 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,1773 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_driver.c,1774 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
MyProject_driver____?ag:
L_end_MyProject_driver___?ag:
BX	LR
; end of MyProject_driver____?ag
