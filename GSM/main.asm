_INT_UART2_RX:
;main.c,31 :: 		void INT_UART2_RX() iv IVT_INT_UART2_RX_TX ics ICS_AUTO{
;main.c,33 :: 		while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );    /* Wait for received buffer to be full*/
L_INT_UART2_RX0:
MOVW	R0, #lo_addr(UART2_S1+0)
MOVT	R0, #hi_addr(UART2_S1+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #32
UXTB	R0, R0
CMP	R0, #0
IT	NE
BNE	L_INT_UART2_RX1
IT	AL
BAL	L_INT_UART2_RX0
L_INT_UART2_RX1:
;main.c,35 :: 		receive = UART2_D;           /* Read received data*/
MOVW	R0, #lo_addr(UART2_D+0)
MOVT	R0, #hi_addr(UART2_D+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_receive+0)
MOVT	R0, #hi_addr(_receive+0)
STRB	R1, [R0, #0]
;main.c,36 :: 		if(receive!=0x0D){
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_INT_UART2_RX2
;main.c,37 :: 		rx_buffer[i]=receive;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive+0)
MOVT	R0, #hi_addr(_receive+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;main.c,38 :: 		i++;
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;main.c,39 :: 		}
IT	AL
BAL	L_INT_UART2_RX3
L_INT_UART2_RX2:
;main.c,41 :: 		receive=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_receive+0)
MOVT	R0, #hi_addr(_receive+0)
STRB	R1, [R0, #0]
;main.c,42 :: 		i=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
;main.c,43 :: 		stringUART=STIGAO;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;main.c,45 :: 		}
L_INT_UART2_RX3:
;main.c,46 :: 		}
L_end_INT_UART2_RX:
BX	LR
; end of _INT_UART2_RX
_clear_rx_buffer:
;main.c,48 :: 		void clear_rx_buffer()
;main.c,50 :: 		for(a = 0; a < 200; a++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_a+0)
MOVT	R0, #hi_addr(_a+0)
STRB	R1, [R0, #0]
L_clear_rx_buffer4:
MOVW	R0, #lo_addr(_a+0)
MOVT	R0, #hi_addr(_a+0)
LDRB	R0, [R0, #0]
CMP	R0, #200
IT	CS
BCS	L_clear_rx_buffer5
;main.c,51 :: 		rx_buffer[a] = '\0';
MOVW	R2, #lo_addr(_a+0)
MOVT	R2, #hi_addr(_a+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;main.c,50 :: 		for(a = 0; a < 200; a++)
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;main.c,51 :: 		rx_buffer[a] = '\0';
IT	AL
BAL	L_clear_rx_buffer4
L_clear_rx_buffer5:
;main.c,52 :: 		i=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
;main.c,53 :: 		}
L_end_clear_rx_buffer:
BX	LR
; end of _clear_rx_buffer
_GSM_PowerON:
;main.c,55 :: 		void GSM_PowerON()
;main.c,57 :: 		GPIOD_PSOR |= (1 << 5);
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
STR	R1, [R0, #0]
;main.c,58 :: 		Delay_ms(200);
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_GSM_PowerON7:
SUBS	R7, R7, #1
BNE	L_GSM_PowerON7
NOP
NOP
NOP
;main.c,59 :: 		GPIOD_PCOR |= (1 << 5);
MOVW	R0, #lo_addr(GPIOD_PCOR+0)
MOVT	R0, #hi_addr(GPIOD_PCOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_PCOR+0)
MOVT	R0, #hi_addr(GPIOD_PCOR+0)
STR	R1, [R0, #0]
;main.c,60 :: 		Delay_ms(800);
MOVW	R7, #18430
MOVT	R7, #488
NOP
NOP
L_GSM_PowerON9:
SUBS	R7, R7, #1
BNE	L_GSM_PowerON9
NOP
NOP
NOP
;main.c,61 :: 		GPIOD_PSOR |= (1 << 5);
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_PSOR+0)
MOVT	R0, #hi_addr(GPIOD_PSOR+0)
STR	R1, [R0, #0]
;main.c,62 :: 		Delay_ms(200);
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_GSM_PowerON11:
SUBS	R7, R7, #1
BNE	L_GSM_PowerON11
NOP
NOP
NOP
;main.c,63 :: 		}
L_end_GSM_PowerON:
BX	LR
; end of _GSM_PowerON
_init_system:
;main.c,66 :: 		void init_system() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,68 :: 		UART2_Inicijalizacija();
BL	_UART2_Inicijalizacija+0
;main.c,69 :: 		delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_init_system13:
SUBS	R7, R7, #1
BNE	L_init_system13
NOP
NOP
NOP
;main.c,70 :: 		NVIC_IntEnable(IVT_INT_UART2_RX_TX);
MOVW	R0, #51
BL	_NVIC_IntEnable+0
;main.c,71 :: 		GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_0); // i2c1 SDA
MOV	R1, #1
MOVW	R0, #lo_addr(PTE_PDOR+0)
MOVT	R0, #hi_addr(PTE_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,72 :: 		GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_1); // i2c1 SCK
MOV	R1, #2
MOVW	R0, #lo_addr(PTE_PDOR+0)
MOVT	R0, #hi_addr(PTE_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,73 :: 		I2C1_Init_Advanced(4000000, &_GPIO_Module_I2C1_PE1_0);
MOVW	R1, #lo_addr(__GPIO_Module_I2C1_PE1_0+0)
MOVT	R1, #hi_addr(__GPIO_Module_I2C1_PE1_0+0)
MOVW	R0, #2304
MOVT	R0, #61
BL	_I2C1_Init_Advanced+0
;main.c,74 :: 		Init_OLED();
BL	_Init_OLED+0
;main.c,75 :: 		delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_init_system15:
SUBS	R7, R7, #1
BNE	L_init_system15
NOP
NOP
NOP
;main.c,76 :: 		oledClear();
BL	_oledClear+0
;main.c,77 :: 		GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_5); // reset pin modema
MOV	R1, #32
MOVW	R0, #lo_addr(PTD_PDOR+0)
MOVT	R0, #hi_addr(PTD_PDOR+0)
BL	_GPIO_Digital_Output+0
;main.c,78 :: 		GSM_PowerON();
BL	_GSM_PowerON+0
;main.c,79 :: 		}
L_end_init_system:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_system
_main:
;main.c,82 :: 		void main() {
;main.c,83 :: 		init_system();
BL	_init_system+0
;main.c,85 :: 		while (1) {
L_main17:
;main.c,86 :: 		process_state();
BL	_process_state+0
;main.c,87 :: 		Delay_ms(100); // Sacekaj za sledeci start
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main19:
SUBS	R7, R7, #1
BNE	L_main19
NOP
NOP
NOP
;main.c,88 :: 		}
IT	AL
BAL	L_main17
;main.c,89 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_process_state:
;main.c,91 :: 		void process_state() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,92 :: 		switch (state){
IT	AL
BAL	L_process_state21
;main.c,93 :: 		case 0:      //state 0:Proziva modem
L_process_state23:
;main.c,94 :: 		oledClear();
BL	_oledClear+0
;main.c,95 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,96 :: 		oledPrint("Proziva modem");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_oledPrint+0
;main.c,97 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state24:
SUBS	R7, R7, #1
BNE	L_process_state24
NOP
NOP
NOP
;main.c,98 :: 		Uart2_WriteString("AT\r");
MOVW	R0, #lo_addr(?lstr_2_main+0)
MOVT	R0, #hi_addr(?lstr_2_main+0)
BL	_Uart2_WriteString+0
;main.c,99 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state26:
SUBS	R7, R7, #1
BNE	L_process_state26
NOP
NOP
NOP
;main.c,100 :: 		if(stringUART==STIGAO){
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_process_state28
;main.c,101 :: 		if(strstr(rx_buffer, "OK")){
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_process_state29
;main.c,102 :: 		oledClear();
BL	_oledClear+0
;main.c,103 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,104 :: 		oledPrint("Stanje modema:");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_oledPrint+0
;main.c,105 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,106 :: 		oledPrint("aktivan");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_oledPrint+0
;main.c,107 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state30:
SUBS	R7, R7, #1
BNE	L_process_state30
NOP
NOP
NOP
;main.c,108 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,109 :: 		state=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRB	R1, [R0, #0]
;main.c,110 :: 		stringUART=PONISTI;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stringUART+0)
MOVT	R0, #hi_addr(_stringUART+0)
STRB	R1, [R0, #0]
;main.c,111 :: 		}
L_process_state29:
;main.c,112 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,113 :: 		}
L_process_state28:
;main.c,114 :: 		break;
IT	AL
BAL	L_process_state22
;main.c,116 :: 		case 1:      //state 1: Registruje se na mrezu
L_process_state32:
;main.c,117 :: 		oledClear();
BL	_oledClear+0
;main.c,118 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,119 :: 		oledPrint("Registruje se");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_oledPrint+0
;main.c,120 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,121 :: 		oledPrint("na mrezu");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_oledPrint+0
;main.c,122 :: 		Uart2_WriteString("AT+CREG=1\r");
MOVW	R0, #lo_addr(?lstr_8_main+0)
MOVT	R0, #hi_addr(?lstr_8_main+0)
BL	_Uart2_WriteString+0
;main.c,123 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state33:
SUBS	R7, R7, #1
BNE	L_process_state33
NOP
NOP
NOP
;main.c,124 :: 		if(strstr(rx_buffer, "OK")){
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_process_state35
;main.c,125 :: 		oledClear();
BL	_oledClear+0
;main.c,126 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,127 :: 		oledPrint("Registrovan");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_oledPrint+0
;main.c,128 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state36:
SUBS	R7, R7, #1
BNE	L_process_state36
NOP
NOP
NOP
;main.c,129 :: 		state=2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRB	R1, [R0, #0]
;main.c,130 :: 		}
L_process_state35:
;main.c,131 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,132 :: 		break;
IT	AL
BAL	L_process_state22
;main.c,134 :: 		case 2: //state2: Brise poruke i ulazi u text mod
L_process_state38:
;main.c,135 :: 		oledClear();
BL	_oledClear+0
;main.c,136 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,137 :: 		oledPrint("Ulazi u text");
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_oledPrint+0
;main.c,138 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,139 :: 		oledPrint("mod i brisanje");
MOVW	R0, #lo_addr(?lstr12_main+0)
MOVT	R0, #hi_addr(?lstr12_main+0)
BL	_oledPrint+0
;main.c,140 :: 		oledGotoYX(2,0);
MOVS	R1, #0
MOVS	R0, #2
BL	_oledGotoYX+0
;main.c,141 :: 		oledPrint("starih poruka");
MOVW	R0, #lo_addr(?lstr13_main+0)
MOVT	R0, #hi_addr(?lstr13_main+0)
BL	_oledPrint+0
;main.c,142 :: 		Uart2_WriteString("AT+CMGF=1\r");  //Text mod
MOVW	R0, #lo_addr(?lstr_14_main+0)
MOVT	R0, #hi_addr(?lstr_14_main+0)
BL	_Uart2_WriteString+0
;main.c,143 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_process_state39:
SUBS	R7, R7, #1
BNE	L_process_state39
NOP
NOP
NOP
;main.c,145 :: 		Uart2_WriteString("AT+CMGD=0\r");  //Brisanje poruka
MOVW	R0, #lo_addr(?lstr_15_main+0)
MOVT	R0, #hi_addr(?lstr_15_main+0)
BL	_Uart2_WriteString+0
;main.c,146 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_process_state41:
SUBS	R7, R7, #1
BNE	L_process_state41
NOP
NOP
NOP
;main.c,147 :: 		Uart2_WriteString("AT+CMGD=1\r");
MOVW	R0, #lo_addr(?lstr_16_main+0)
MOVT	R0, #hi_addr(?lstr_16_main+0)
BL	_Uart2_WriteString+0
;main.c,148 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_process_state43:
SUBS	R7, R7, #1
BNE	L_process_state43
NOP
NOP
NOP
;main.c,149 :: 		Uart2_WriteString("AT+CMGD=2\r");
MOVW	R0, #lo_addr(?lstr_17_main+0)
MOVT	R0, #hi_addr(?lstr_17_main+0)
BL	_Uart2_WriteString+0
;main.c,150 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_process_state45:
SUBS	R7, R7, #1
BNE	L_process_state45
NOP
NOP
NOP
;main.c,151 :: 		Uart2_WriteString("AT+CMGD=3\r");
MOVW	R0, #lo_addr(?lstr_18_main+0)
MOVT	R0, #hi_addr(?lstr_18_main+0)
BL	_Uart2_WriteString+0
;main.c,152 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_process_state47:
SUBS	R7, R7, #1
BNE	L_process_state47
NOP
NOP
NOP
;main.c,153 :: 		Uart2_WriteString("AT+CMGD=4\r");
MOVW	R0, #lo_addr(?lstr_19_main+0)
MOVT	R0, #hi_addr(?lstr_19_main+0)
BL	_Uart2_WriteString+0
;main.c,154 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_process_state49:
SUBS	R7, R7, #1
BNE	L_process_state49
NOP
NOP
NOP
;main.c,156 :: 		if (strstr(rx_buffer, "OK")){
MOVW	R0, #lo_addr(?lstr20_main+0)
MOVT	R0, #hi_addr(?lstr20_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_process_state51
;main.c,157 :: 		oledClear();
BL	_oledClear+0
;main.c,158 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,159 :: 		oledPrint("Poruke obrisane");
MOVW	R0, #lo_addr(?lstr21_main+0)
MOVT	R0, #hi_addr(?lstr21_main+0)
BL	_oledPrint+0
;main.c,160 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,161 :: 		state=3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRB	R1, [R0, #0]
;main.c,162 :: 		}
L_process_state51:
;main.c,163 :: 		break;
IT	AL
BAL	L_process_state22
;main.c,165 :: 		case 3:     //state3: provera pristigle poruke
L_process_state52:
;main.c,166 :: 		Uart2_WriteString("ATE0\r");   //iskljucivanje eha
MOVW	R0, #lo_addr(?lstr_22_main+0)
MOVT	R0, #hi_addr(?lstr_22_main+0)
BL	_Uart2_WriteString+0
;main.c,167 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state53:
SUBS	R7, R7, #1
BNE	L_process_state53
NOP
NOP
NOP
;main.c,168 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,169 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state55:
SUBS	R7, R7, #1
BNE	L_process_state55
NOP
NOP
NOP
;main.c,170 :: 		oledClear();
BL	_oledClear+0
;main.c,171 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,172 :: 		oledPrint("Cekam poruku");
MOVW	R0, #lo_addr(?lstr23_main+0)
MOVT	R0, #hi_addr(?lstr23_main+0)
BL	_oledPrint+0
;main.c,173 :: 		Delay_ms(200);
MOVW	R7, #4606
MOVT	R7, #122
NOP
NOP
L_process_state57:
SUBS	R7, R7, #1
BNE	L_process_state57
NOP
NOP
NOP
;main.c,174 :: 		while(!(strstr(rx_buffer,"Pozovi me!"))) {
L_process_state59:
MOVW	R0, #lo_addr(?lstr24_main+0)
MOVT	R0, #hi_addr(?lstr24_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
CMP	R0, #0
IT	NE
BNE	L_process_state60
;main.c,175 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,176 :: 		Uart2_WriteString("AT+CNMI=1,2,0,0,0\r");
MOVW	R0, #lo_addr(?lstr_25_main+0)
MOVT	R0, #hi_addr(?lstr_25_main+0)
BL	_Uart2_WriteString+0
;main.c,177 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state61:
SUBS	R7, R7, #1
BNE	L_process_state61
NOP
NOP
NOP
;main.c,178 :: 		oledClear();
BL	_oledClear+0
;main.c,179 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,180 :: 		oledPrint("Cekam poruku");
MOVW	R0, #lo_addr(?lstr26_main+0)
MOVT	R0, #hi_addr(?lstr26_main+0)
BL	_oledPrint+0
;main.c,181 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,182 :: 		oledPrint(rx_buffer);
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_oledPrint+0
;main.c,183 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state63:
SUBS	R7, R7, #1
BNE	L_process_state63
NOP
NOP
NOP
;main.c,184 :: 		}
IT	AL
BAL	L_process_state59
L_process_state60:
;main.c,185 :: 		oledClear();
BL	_oledClear+0
;main.c,186 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,187 :: 		oledPrint("Stigla ispravna");
MOVW	R0, #lo_addr(?lstr27_main+0)
MOVT	R0, #hi_addr(?lstr27_main+0)
BL	_oledPrint+0
;main.c,188 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,189 :: 		oledPrint("poruka");
MOVW	R0, #lo_addr(?lstr28_main+0)
MOVT	R0, #hi_addr(?lstr28_main+0)
BL	_oledPrint+0
;main.c,190 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_process_state65:
SUBS	R7, R7, #1
BNE	L_process_state65
NOP
NOP
NOP
;main.c,191 :: 		br=strstr(rx_buffer, "381");  //Trazi broj telefona
MOVW	R0, #lo_addr(?lstr29_main+0)
MOVT	R0, #hi_addr(?lstr29_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_rx_buffer+0)
MOVT	R0, #hi_addr(_rx_buffer+0)
BL	_strstr+0
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
STR	R0, [R1, #0]
;main.c,192 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_process_state67:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	CS
BCS	L_process_state68
;main.c,193 :: 		phoneNumber[i]=*br;
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
ADDS	R2, R0, R1
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
LDR	R0, [R1, #0]
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;main.c,194 :: 		br++;
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;main.c,192 :: 		for(i=0; i<12; i++){
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;main.c,195 :: 		}
IT	AL
BAL	L_process_state67
L_process_state68:
;main.c,196 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,197 :: 		oledClear();
BL	_oledClear+0
;main.c,198 :: 		oledGotoYX(1,0);
MOVS	R1, #0
MOVS	R0, #1
BL	_oledGotoYX+0
;main.c,199 :: 		oledPrint("Broj ");
MOVW	R0, #lo_addr(?lstr30_main+0)
MOVT	R0, #hi_addr(?lstr30_main+0)
BL	_oledPrint+0
;main.c,200 :: 		oledGotoYX(2,0);
MOVS	R1, #0
MOVS	R0, #2
BL	_oledGotoYX+0
;main.c,201 :: 		oledPrint(phoneNumber);
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
BL	_oledPrint+0
;main.c,202 :: 		Delay_ms(1000);
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_process_state70:
SUBS	R7, R7, #1
BNE	L_process_state70
NOP
NOP
NOP
;main.c,203 :: 		state=4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRB	R1, [R0, #0]
;main.c,204 :: 		oledClear();
BL	_oledClear+0
;main.c,205 :: 		break;
IT	AL
BAL	L_process_state22
;main.c,208 :: 		case 4:
L_process_state72:
;main.c,209 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,210 :: 		strcat(callPhoneNumber, phoneNumber);     //  na ATD+ dodaje broj telefona
MOVW	R1, #lo_addr(_phoneNumber+0)
MOVT	R1, #hi_addr(_phoneNumber+0)
MOVW	R0, #lo_addr(_callPhoneNumber+0)
MOVT	R0, #hi_addr(_callPhoneNumber+0)
BL	_strcat+0
;main.c,211 :: 		strcat(callPhoneNumber,";\r");      //  dodaje ; na kraju
MOVW	R0, #lo_addr(?lstr31_main+0)
MOVT	R0, #hi_addr(?lstr31_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_callPhoneNumber+0)
MOVT	R0, #hi_addr(_callPhoneNumber+0)
BL	_strcat+0
;main.c,212 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_process_state73:
SUBS	R7, R7, #1
BNE	L_process_state73
NOP
NOP
NOP
;main.c,213 :: 		Uart2_WriteString(callPhoneNumber);
MOVW	R0, #lo_addr(_callPhoneNumber+0)
MOVT	R0, #hi_addr(_callPhoneNumber+0)
BL	_Uart2_WriteString+0
;main.c,215 :: 		Delay_ms(10000);                    //povecan Delay da bi modem stigao da izvrsi poziv!!!
MOVW	R7, #33790
MOVT	R7, #6103
NOP
NOP
L_process_state75:
SUBS	R7, R7, #1
BNE	L_process_state75
NOP
NOP
NOP
;main.c,216 :: 		oledClear();
BL	_oledClear+0
;main.c,217 :: 		oledGotoYX(0,0);
MOVS	R1, #0
MOVS	R0, #0
BL	_oledGotoYX+0
;main.c,218 :: 		oledPrint("Pozivam");
MOVW	R0, #lo_addr(?lstr32_main+0)
MOVT	R0, #hi_addr(?lstr32_main+0)
BL	_oledPrint+0
;main.c,219 :: 		for(i=0; i<15; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_process_state77:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #15
IT	CS
BCS	L_process_state78
;main.c,220 :: 		phoneNumber[i]='\0';
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_phoneNumber+0)
MOVT	R0, #hi_addr(_phoneNumber+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;main.c,221 :: 		br--;
MOVW	R1, #lo_addr(_br+0)
MOVT	R1, #hi_addr(_br+0)
LDR	R0, [R1, #0]
SUBS	R0, R0, #1
STR	R0, [R1, #0]
;main.c,219 :: 		for(i=0; i<15; i++){
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;main.c,222 :: 		}
IT	AL
BAL	L_process_state77
L_process_state78:
;main.c,223 :: 		for(i=4; i<17; i++){
MOVS	R1, #4
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_process_state80:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #17
IT	CS
BCS	L_process_state81
;main.c,224 :: 		callPhoneNumber[i]='\0';
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_callPhoneNumber+0)
MOVT	R0, #hi_addr(_callPhoneNumber+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;main.c,223 :: 		for(i=4; i<17; i++){
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;main.c,225 :: 		}
IT	AL
BAL	L_process_state80
L_process_state81:
;main.c,226 :: 		clear_rx_buffer();
BL	_clear_rx_buffer+0
;main.c,227 :: 		Delay_ms(5000);
MOVW	R7, #49662
MOVT	R7, #3051
NOP
NOP
L_process_state83:
SUBS	R7, R7, #1
BNE	L_process_state83
NOP
NOP
NOP
;main.c,228 :: 		state=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRB	R1, [R0, #0]
;main.c,229 :: 		break;
IT	AL
BAL	L_process_state22
;main.c,230 :: 		}
L_process_state21:
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_process_state23
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_process_state32
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_process_state38
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_process_state52
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_process_state72
L_process_state22:
;main.c,233 :: 		}
L_end_process_state:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _process_state
