#include "Timer2.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

 void Timer2_Init(double period) {

    //proracun za podesavanje perioda: 120MHz /2 * period[s]
    uint32_t Y=0;
    double X=0.0;
    X = 60000000.0 * period;
    Y =(uint32_t) X;

    SIM_SCGC6 |= (1ul << PIT);     // Enable clock gating for Periodic interrupt timers
    PIT_MCR = 0x00;

    PIT_LDVAL2 = Y;       // Set timer prescaler. (120MHz, 500ms),  PIT_LDVAL2 = 120 [MHz] / 2 * interval [sec] , pri cemu je ovde interval 0.5 sekundi

    NVIC_IntEnable(IVT_INT_PIT2);  // Enable timer interrupts
    PIT_TCTRL2 = (1 << TIE);              // enable Timer 2 interrupts
    PIT_TCTRL2 |= (1 << TEN);             // start Timer 2

  }
