#include "Timer2.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

 void Timer2_Init ( double period ) {

      uint32_t Y = 0;
      double X = 0.0;
      X = 60000000.0 * period;
      Y = ( uint32_t) X;
      
      SIM_SCGC6 |= (1ul << PIT);
      PIT_MCR = 0x00;
      
      PIT_LDVAL2 = Y ;
      
      NVIC_IntEnable(IVT_INT_PIT2);
      PIT_TCTRL2 = ( 1 << TIE );
      PIT_TCTRL2 = ( 1 << TEN );

 }

