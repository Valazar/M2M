#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "uart2.h"
#include "OLED_096.h"

#define STIGAO 1
#define PONISTI 0
#define BUFFER_SIZE 200
#define PHONE_NUMBER_SIZE 15

uint8_t stringUART=0, i=0,a=0;
uint8_t rx_buffer[BUFFER_SIZE];  //velicina rx buffera
uint8_t receive;  //promenjiva za smestanje karaktera UART5
uint8_t state=0;    //promenjiva za stanja modema
int p;
char phoneNumber[PHONE_NUMBER_SIZE];          //promenjiva za broj koji iscitavamo iz poruke
char *br;
char callPhoneNumber[19] = "ATD+";           //broj koji pozivamo
void GSM_PowerON();
void clear_rx_buffer();


void GSM_PowerON();
void clear_rx_buffer();
void init_system();
void init_uart2();
void process_state();
//prekidna rutina za UART5******************************************************
void INT_UART2_RX() iv IVT_INT_UART2_RX_TX ics ICS_AUTO{

 while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );    /* Wait for received buffer to be full*/
    (void) UART2_S1;           /* Read UART2_S1 register*/  //and clear receprion flag mechanism
    receive = UART2_D;           /* Read received data*/
    if(receive!=0x0D){
        rx_buffer[i]=receive;
        i++;
    }
    else{
        receive=0;
        i=0;
        stringUART=STIGAO;

    }
}

  void clear_rx_buffer()
{
     for(a = 0; a < 200; a++)
       rx_buffer[a] = '\0';
     i=0;
}

void GSM_PowerON()
{
       GPIOD_PSOR |= (1 << 5);
       Delay_ms(200);
       GPIOD_PCOR |= (1 << 5);
       Delay_ms(800);
       GPIOD_PSOR |= (1 << 5);
       Delay_ms(200);
}


 void init_system() {

    UART2_Inicijalizacija();
    delay_ms(100);
    NVIC_IntEnable(IVT_INT_UART2_RX_TX);
    GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_0); // i2c1 SDA
    GPIO_Digital_Output(&PTE_PDOR, _GPIO_PINMASK_1); // i2c1 SCK
    I2C1_Init_Advanced(4000000, &_GPIO_Module_I2C1_PE1_0);
    Init_OLED();
    delay_ms(100);
    oledClear();
    GPIO_Digital_Output(&PTD_PDOR, _GPIO_PINMASK_5); // reset pin modema
    GSM_PowerON();
}


void main() {
    init_system();

    while (1) {
        process_state();
        Delay_ms(100); // Sacekaj za sledeci start
    }
}

void process_state() {
         switch (state){
           case 0:      //state 0:Proziva modem
                oledClear();
                oledGotoYX(0,0);
                oledPrint("Proziva modem");
                Delay_ms(500);
                Uart2_WriteString("AT\r");
                Delay_ms(500);
                if(stringUART==STIGAO){
                   if(strstr(rx_buffer, "OK")){
                    oledClear();
                    oledGotoYX(0,0);
                    oledPrint("Stanje modema:");
                    oledGotoYX(1,0);
                    oledPrint("aktivan");
                    Delay_ms(500);
                    clear_rx_buffer();
                    state=1;
                     stringUART=PONISTI;
                   }
                   clear_rx_buffer();
                }
                break;

           case 1:      //state 1: Registruje se na mrezu
                 oledClear();
                 oledGotoYX(0,0);
                 oledPrint("Registruje se");
                 oledGotoYX(1,0);
                 oledPrint("na mrezu");
                 Uart2_WriteString("AT+CREG=1\r");
                 Delay_ms(500);
                 if(strstr(rx_buffer, "OK")){
                     oledClear();
                     oledGotoYX(0,0);
                     oledPrint("Registrovan");
                     Delay_ms(500);
                     state=2;
                     }
                 clear_rx_buffer();
                 break;

           case 2: //state2: Brise poruke i ulazi u text mod
               oledClear();
               oledGotoYX(0,0);
               oledPrint("Ulazi u text");
               oledGotoYX(1,0);
               oledPrint("mod i brisanje");
               oledGotoYX(2,0);
               oledPrint("starih poruka");
               Uart2_WriteString("AT+CMGF=1\r");  //Text mod
               Delay_ms(300);

               Uart2_WriteString("AT+CMGD=0\r");  //Brisanje poruka
               Delay_ms(300);
               Uart2_WriteString("AT+CMGD=1\r");
               Delay_ms(300);
               Uart2_WriteString("AT+CMGD=2\r");
               Delay_ms(300);
               Uart2_WriteString("AT+CMGD=3\r");
               Delay_ms(300);
               Uart2_WriteString("AT+CMGD=4\r");
               Delay_ms(300);

               if (strstr(rx_buffer, "OK")){
                  oledClear();
                  oledGotoYX(0,0);
                  oledPrint("Poruke obrisane");
                  clear_rx_buffer();
                  state=3;
               }
               break;

           case 3:     //state3: provera pristigle poruke
              Uart2_WriteString("ATE0\r");   //iskljucivanje eha
              Delay_ms(500);
              clear_rx_buffer();
              Delay_ms(500);
              oledClear();
              oledGotoYX(0,0);
              oledPrint("Cekam poruku");
              Delay_ms(200);
              while(!(strstr(rx_buffer,"Pozovi me!"))) {
                 clear_rx_buffer();
                 Uart2_WriteString("AT+CNMI=1,2,0,0,0\r");
                 Delay_ms(500);
                 oledClear();
                 oledGotoYX(0,0);
                 oledPrint("Cekam poruku");
                 oledGotoYX(1,0);
                 oledPrint(rx_buffer);
                 Delay_ms(500);
                 }
              oledClear();
              oledGotoYX(0,0);
              oledPrint("Stigla ispravna");
              oledGotoYX(1,0);
              oledPrint("poruka");
              Delay_ms(1000);
              br=strstr(rx_buffer, "381");  //Trazi broj telefona
              for(i=0; i<12; i++){
                  phoneNumber[i]=*br;
                  br++;
              }
              clear_rx_buffer();
              oledClear();
              oledGotoYX(1,0);
              oledPrint("Broj ");
              oledGotoYX(2,0);
              oledPrint(phoneNumber);
              Delay_ms(1000);
              state=4;
              oledClear();
              break;


           case 4:
            clear_rx_buffer();
            strcat(callPhoneNumber, phoneNumber);     //  na ATD+ dodaje broj telefona
            strcat(callPhoneNumber,";\r");      //  dodaje ; na kraju
            Delay_ms(500);
            //Uart2_WriteString(callPhoneNumber);
            Uart2_WriteString("ATD+381649027709;\r");
            Delay_ms(10000);                    //povecan Delay da bi modem stigao da izvrsi poziv!!!
            oledClear();
            oledGotoYX(0,0);
            oledPrint("Pozivam");
            for(i=0; i<15; i++){
                phoneNumber[i]='\0';
                br--;
            }
            for(i=4; i<17; i++){
                callPhoneNumber[i]='\0';
            }
            clear_rx_buffer();
            Delay_ms(5000);
            state=0;
            break;
           }


}