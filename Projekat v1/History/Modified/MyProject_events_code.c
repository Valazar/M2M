#include "MyProject_objects.h"
#include "MyProject_resources.h"
#include "MyProject_events_code.h"
#include "Timer2.h"

//--------------------- User code ---------------------//
int pictureNum;
int oldButtonNum;
int guessedCounter;
int buttonNum;
int oldCard;
int newGame;
int counter = 0;
//int timeArrayMinutes[5];
char timeArraySeconds[3];
int gameCounter = 0;
int minutes = 0;
int seconds = 0;
int win;
int results[9];
char first[10]="";
char second[10]="";
char third[10]="";
char fourth[10]="";
char fifth[10]="";

//int minutes[5];
//int seconds[5];
//#include "MyProject_events_code.h"              pojebe gui
//#include "Timer2.h"


int index;
int guessed[16] = {0};

//int min = 0;
//int sec = 0;

int brSlike;
int brPogodjenih;
int brDugmeta;
int stariBrDugmeta;
int brojac;
int staraKartica;
int i;
int pogodjene[16] ={0};
int nizMinuta[5];
int nizSekundi[5];
int j = -1;

//----------------- End of User code ------------------//

// Event Handlers
void Timer2_interrupt() iv IVT_INT_PIT2 {

     seconds ++;
      /*
     if(seconds == 60){
                minutes ++;
                seconds = 0;

     }    */

     PIT_TFLG2.TIF = 1;

}

void startGame(){

     DrawScreen(&Screen1);
     newGame = 1;
     seconds = 0;
     minutes = 0;
     //Timer2_Init(0.2);
}


void showImage1(){

    if (newGame ==1){
       buttonNum =1;
       pictureNum =1;
       counter ++;
       TFT_image(60,45,bajic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage2(){

    if (newGame ==1){
       buttonNum =2;
       pictureNum =4;
       counter ++;
       TFT_image(180,45,miraa_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage3(){

    if (newGame ==1){
       buttonNum =3;
       pictureNum =2;
       counter ++;
       TFT_image(300,45,bodic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage4(){

    if (newGame ==1){
       buttonNum =4;
       pictureNum =3;
       counter ++;
       TFT_image(420,45,kalman_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage5(){

    if (newGame ==1){
       buttonNum =5;
       pictureNum =5;
       counter ++;
       TFT_image(60,145,rajss_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage6(){

    if (newGame ==1){
       buttonNum =6;
       pictureNum =6;
       counter ++;
       TFT_image(180,145,brkicc_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage7(){

    if (newGame ==1){
       buttonNum =7;
       pictureNum =4;
       counter ++;
       TFT_image(300,145,miraa_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage8(){

    if (newGame ==1){
       buttonNum =8;
       pictureNum =7;
       counter ++;
       TFT_image(420,145,kisic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage9(){

    if (newGame ==1){
       buttonNum =9;
       pictureNum =8;
       counter ++;
       TFT_image(60,245,tomic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage10(){

    if (newGame ==1){
       buttonNum =10;
       pictureNum =6;
       counter ++;
       TFT_image(180,245,brkicc_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage11(){

    if (newGame ==1){
       buttonNum =11;
       pictureNum =7;
       counter ++;
       TFT_image(300,245,kisic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage12(){

    if (newGame ==1){
       buttonNum =12;
       pictureNum =8;
       counter ++;
       TFT_image(420,245,tomic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage13(){

    if (newGame ==1){
       buttonNum =13;
       pictureNum =3;
       counter ++;
       TFT_image(60,345,kalman_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage14(){

    if (newGame ==1){
       buttonNum =14;
       pictureNum =2;
       counter ++;
       TFT_image(180,345,bodic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage15(){

    if (newGame ==1){
       buttonNum =15;
       pictureNum =5;
       counter ++;
       TFT_image(300,345,rajss_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void showImage16(){

    if (newGame ==1){
       buttonNum =16;
       pictureNum =1;
       counter ++;
       TFT_image(420,345,bajic_bmp,1);
       imageFound();
       Timer2_Init(0.2);
    }

}

void imageFound() {
    switch(counter) {
        case 1:
            oldCard = pictureNum;
            oldButtonNum = buttonNum;
            break;
        case 2:
            if(oldCard == pictureNum) {
                    counter = 0;
                    guessedCounter++;
                    Delay_ms(50);

                if(guessedCounter == 8) {
                    win++;
                    Delay_ms(50);
                    endGame();
                    guessedCounter = 0;
                }
                
            } else {
                counter = 0;
                Delay_ms(300);
                flip();
            }
            break;
        default:
            break;
    }
}

 
void flip() {

    buttonNum--;
    oldButtonNum--;
    DrawButton(&Button1 + buttonNum);
    DrawButton(&Button1 + oldButtonNum);
    
}

void endGame(){

      //DrawBox(&Box3);
      //Label2.Caption = "POBEDA! NOVA IGRA?";
      //DrawLabel(&Label2);

      switch (win){
      case 1:
      results[0] = seconds;
      IntToStr(results[0],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);


      break;
      case 2:
      results[1] = seconds;
      IntToStr(results[1],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);


      break;
      case 3:
      results[2] = seconds;
      IntToStr(results[2],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);


      break;
      case 4:
      results[3] = seconds;
      IntToStr(results[3],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);

      break;
      case 5:
      results[4] = seconds;
      IntToStr(results[4],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);
      break;

      case 6:
      results[5] = seconds;
      IntToStr(results[5],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);
      break;

      case 7:
      results[6] = seconds;
      IntToStr(results[6],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);
      break;

      case 8:
      results[7] = seconds;
      IntToStr(results[7],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);
      break;

      case 9:
      results[8] = seconds;
      IntToStr(results[8],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);
      break;

      case 10:
      results[9] = seconds;
      IntToStr(results[9],timeArraySeconds);
      Label3.Caption = timeArraySeconds;
      DrawBox(&Box1);
      DrawLabel(&Label3);
      break;

      default:
      Label3.Caption ="Pokrenite igricu ponovo";
      DrawBox(&Box1);
      DrawLabel(&Label2);
      break;
      }


  }
  
void showResults(){

   bubbleSort(results, win);
   
   if (results[0] != 0){
     IntToStr(results[0], first);
     //DrawBox(&Box1);
     Label4.Caption = first;
     //DrawLabel(&Label5);
   }
   if (results[1] != 0){
      //DrawBox(&Box1);
      IntToStr(results[1], second);
      Label5.Caption = second;
      //DrawLabel(&Label6);
    }

   if (results[2] != 0) {
    //DrawBox(&Box1);
     IntToStr(results[2], third);
     Label6.Caption = third;
    //DrawLabel(&Label7);
   }

   if (results[3] != 0){
      IntToStr(results[3], fourth);
      //DrawBox(&Box1);
      Label7.Caption = fourth;
      //DrawLabel(&Label8);
   }

   if (results[4] != 0) {
      IntToStr(results[4], fifth);
      //DrawBox(&Box1);
      Label8.Caption = fifth;
   }
 
 }

void bubbleSort(int array[], int n)
{
     int i, j;
     for (i = 0; i < n-1; i++)
     for (j = 0; j < n-i-1; j++)
     if (array[j] > array[j+1])
     replace(&array[j], &array[j+1]);
     
}

void replace(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
    
}




    /*
void endGame() {

    DisableInterrupts();
    newGame = 0;
    //TFT_Set_Font(TFT_defaultFont, CL_BLUE, FO_HORIZONTAL);
      //TFT_Write_Text("GAME OVER", 480, 170);

    gameCounter++;

    if(gameCounter == 5){
        //if((minutes + seconds * 60) < (timeArrayMinutes[0] + timeArraySeconds[0] * 60)) {
            timeArrayMinutes[gameCounter] = minutes;
            timeArraySeconds[gameCounter] = seconds;
            gameCounter = 0;
            //sortResults();
        //}
    } else {
        timeArrayMinutes[gameCounter] = minutes;
        timeArraySeconds[gameCounter] = seconds;
        //sortResults();
    }
}

void timeCounting(){

     EnableInterrupts();
     Timer2_Init(0.2);
     for(i = 0 ; i <16; i++){
           DrawButton(&Button1 + i) ;
     }

}  */

 /*
void sortResults() {
    int i, j;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4 - i; j++) {
            int time1 = timeArraySeconds[j] + 60 * timeArrayMinutes[j];
            int time2 = timeArraySeconds[j + 1] + 60 * timeArrayMinutes[j + 1];
            if (time1 > time2) {
                int tempMinutes = timeArrayMinutes[j];
                int tempSeconds = timeArraySeconds[j];
                timeArrayMinutes[j] = timeArrayMinutes[j + 1];
                timeArraySeconds[j] = timeArraySeconds[j + 1];
                timeArrayMinutes[j + 1] = tempMinutes;
                timeArraySeconds[j + 1] = tempSeconds;
            }
        }
    }
}


void showResults() {
        printResults();
}

void printResults() {

        //TFT_Set_Pen(0x5AEB, 10);
        //TFT_Set_Brush(1, 0x5AEB, 0, 0, 0, 0);
        //TFT_Rectangle(630, 272, 700, 430);

        IntToStr(minutes[0], Label1_Caption);
        DrawLabel(&Label1);
        IntToStr(seconds[0], Label3_Caption);
        DrawLabel(&Label3);

        IntToStr(minutes[1], Label4_Caption);
        DrawLabel(&Label4);
        IntToStr(seconds[1], Label6_Caption);
        DrawLabel(&Label6);
}


void odbrojavanje(){

     EnableInterrupts();
     Timer2_Init(0.2);
     for(i = 0 ; i <16; i++){
           DrawButton(&Button1 + i) ;
     }
     
}


void Timer2_interrupt() iv IVT_INT_PIT2 {
     sekunde ++;
     if(sekunde == 60){
                minuti = minuti + 1;
                sekunde = 0;

     }
     TFT_Set_Pen(0x5AEB , 12);
     TFT_Set_Brush(1 , 0x5AEB, 0,0, 0, 0);
     TFT_Rectangle(525, 95, 555,125);


     IntToStr(sekunde , Label19_Caption);
     DrawLabel(&Label19);

     TFT_Set_Pen(0x5AEb ,12);
     TFT_Set_Brush(1, 0x5AEB, 0 , 0 , 0 , 0);
     TFT_Rectangle(495,95, 515, 125);

     IntToStr(minuti, Label17_Caption);
     DrawLabel(&Label17);

     TFT_Write_Text(":" , 525, 97);

     PIT_TFLG2.TIF = 1;

}



void krajIgre() {

     DisableInterrupts();
     startujIgru = 0;
     TFT_Set_Font(TFT_defaultFont, CL_BLUE, FO_HORIZONTAL);
     TFT_Write_Text("KRAJ IGRE", 480, 140);

     j++;

     if(j == 5){
          if((sekunde + minuti * 60) < (nizSekundi[0] + nizMinuta[0] * 60)) {
                      nizMinuta[0] = minuti;
                      nizSekundi[0] = sekunde;
                      j--;
                      sortiranjeRezultata();
          }
    }
    else{
         nizMinuta[j] = minuti;
         nizSekundi[j] = sekunde;
         sortiranjeRezultata();
    }

}

void sortiranjeRezultata() {

     int k;
     int m;
     for(k = 0; k <= 3; k++){
           for(k = 0; k <= 4; k++){
                 int vreme1 = nizSekundi[k] + 60 * nizMinuta[0];
                 int vreme2 = nizSekundi[m] + 60 * nizMinuta[0];

                 if(vreme1 < vreme2){
                           int min = nizMinuta[k];
                           int sek = nizSekundi[k];
                           nizMinuta[k] = nizMinuta[m];
                           nizSekundi[k] = nizMinuta[m];
                           nizMinuta[m] = min;
                           nizSekundi[m] = sek;
                 }
           }
    }

}


*/