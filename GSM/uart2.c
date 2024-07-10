




#include "uart2.h"




void UART2_Inicijalizacija(){


        UART2_Init(9600);

        UART2_C2 |= UART_C2_TE_MASK;           /* ukljuci Transmitter*/
        UART2_C2 |= UART_C2_RE_MASK;           /* ukljuci Receiver*/
        UART2_C2 |= UART_C2_RIE_MASK;           /* ukljuci Receiver interrupts*/


  }
  


   void Uart2_SendChar(uint8_t send)
{
     while ( (UART2_S1 & UART_S1_TDRE_MASK) == 0 );   /* Wait for transmit buffer to be empty*/
     (void)UART2_S1;      /* Read UART2_S1 register*/
     UART2_D = send;      /* Send data*/
}



 uint8_t Uart2_GetChar()
{
     uint8_t recieve;
     while ( ( UART2_S1 & UART_S1_RDRF_MASK) == 0 );     /* Wait for received buffer to be full*/
     (void) UART2_S1;           /* Read UART2_S1 register*/
     recieve = UART2_D;           /* Read received data*/
     return recieve;
}



void Uart2_WriteString(const char * s)

{
    while(*s)
    Uart2_SendChar(*s++);
}


void WriteUART2_dec2string(uint16_t dec)
{

        unsigned char temp;
        temp=dec/10000;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*10000;
        temp=dec/1000;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*1000;
        temp=dec/100;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*100;
        temp=dec/10;
        if(temp>0)
        Uart2_SendChar(temp+'0');
        dec=dec-temp*10;
        Uart2_SendChar(dec+'0');
        Uart2_SendChar('\r');
}