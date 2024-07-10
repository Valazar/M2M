#line 1 "C:/Users/Marko/Desktop/M2M/Projekat v1/Timer2.c"
#line 1 "c:/users/marko/desktop/m2m/projekat v1/timer2.h"
void Timer2_Init(double period);
#line 1 "d:/program files (x86)/mikroc pro for arm/include/stdio.h"
#line 1 "d:/program files (x86)/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/program files (x86)/mikroc pro for arm/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 6 "C:/Users/Marko/Desktop/M2M/Projekat v1/Timer2.c"
 void Timer2_Init(double period) {


 uint32_t Y=0;
 double X=0.0;
 X = 60000000.0 * period;
 Y =(uint32_t) X;

 SIM_SCGC6 |= (1ul << PIT);
 PIT_MCR = 0x00;

 PIT_LDVAL2 = Y;

 NVIC_IntEnable(IVT_INT_PIT2);
 PIT_TCTRL2 = (1 << TIE);
 PIT_TCTRL2 |= (1 << TEN);

 }
