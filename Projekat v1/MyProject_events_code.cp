#line 1 "C:/Users/Marko/Desktop/M2M/Projekat v1/MyProject_events_code.c"
#line 1 "c:/users/marko/desktop/m2m/projekat v1/myproject_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct Button {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ButtonsCount;
 TButton * const code *Buttons;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 void (*OnSwipeLeftPtr)();
 void (*OnSwipeRightPtr)();
 void (*OnSwipeUpPtr)();
 void (*OnSwipeDownPtr)();
 void (*OnZoomInPtr)();
 void (*OnZoomOutPtr)();
};

extern TScreen Screen1;
extern TButton Button1;
extern TButton Button2;
extern TButton Button3;
extern TButton Button4;
extern TButton Button5;
extern TButton Button6;
extern TButton Button7;
extern TButton Button8;
extern TButton Button9;
extern TButton Button10;
extern TButton Button11;
extern TButton Button12;
extern TButton Button13;
extern TButton Button14;
extern TButton Button15;
extern TButton Button16;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TLabel Vreme;
extern TLabel Rang_lista;
extern TBox Box1;
extern TBox Box2;
extern TBox Box3;
extern TBox Box4;
extern TBox Box5;
extern TBox Box6;
extern TImage Image5;
extern TImage Image1;
extern TImage Image2;
extern TImage Image3;
extern TImage Image4;
extern TImage Image6;
extern TImage Image7;
extern TImage Image8;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel Label5;
extern TLabel Label6;
extern TLabel Label7;
extern TLabel Label8;
extern TLabel Label9;
extern TLabel Label10;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel Label13;
extern TButton * const code Screen1_Buttons[16];
extern TButton_Round * const code Screen1_Buttons_Round[2];
extern TLabel * const code Screen1_Labels[15];
extern TImage * const code Screen1_Images[8];
extern TBox * const code Screen1_Boxes[6];








extern char Button1_Caption[];
extern char Button2_Caption[];
extern char Button3_Caption[];
extern char Button4_Caption[];
extern char Button5_Caption[];
extern char Button6_Caption[];
extern char Button7_Caption[];
extern char Button8_Caption[];
extern char Button9_Caption[];
extern char Button10_Caption[];
extern char Button11_Caption[];
extern char Button12_Caption[];
extern char Button13_Caption[];
extern char Button14_Caption[];
extern char Button15_Caption[];
extern char Button16_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char Vreme_Caption[];
extern char Rang_lista_Caption[];
extern char Box1_Caption[];
extern char Box2_Caption[];
extern char Box3_Caption[];
extern char Box4_Caption[];
extern char Box5_Caption[];
extern char Box6_Caption[];
extern char Image5_Caption[];
extern char Image1_Caption[];
extern char Image2_Caption[];
extern char Image3_Caption[];
extern char Image4_Caption[];
extern char Image6_Caption[];
extern char Image7_Caption[];
extern char Image8_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/marko/desktop/m2m/projekat v1/myproject_resources.h"
const code char Tahoma12x16_Regular[];
const code char Tahoma20x24_Regular[];
const code char Tahoma11x13_Regular[];
const code char bajic_bmp[16806];
const code char rajss_bmp[16806];
const code char bodic_bmp[16806];
const code char kalman_bmp[16806];
const code char brkicc_bmp[16806];
const code char miraa_bmp[16806];
const code char kisic_bmp[16806];
const code char tomic_bmp[16806];
#line 1 "c:/users/marko/desktop/m2m/projekat v1/myproject_events_code.h"


void startGame();
void showImage1();
void showImage2();
void showImage3();
void showImage4();
void showImage5();
void showImage6();
void showImage7();
void showImage8();
void showImage9();
void showImage10();
void showImage11();
void showImage12();
void showImage13();
void showImage14();
void showImage15();
void showImage16();
void showResults();
void printResults();
void flip();
void imageFound();
void endGame();
void sortResults();
void timeCounting();
void printTime();
void replace(int *xp, int *yp);
void bubbleSort(int niz[], int n);
#line 1 "c:/users/marko/desktop/m2m/projekat v1/timer2.h"
void Timer2_Init(double period);
#line 6 "C:/Users/Marko/Desktop/M2M/Projekat v1/MyProject_events_code.c"
int pictureNum;
int oldButtonNum;
int guessedCounter;
int buttonNum;
int oldCard;
int newGame;
int counter = 0;

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








int index;
int guessed[16] = {0};




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




void Timer2_interrupt() iv IVT_INT_PIT2 {

 seconds ++;
#line 64 "C:/Users/Marko/Desktop/M2M/Projekat v1/MyProject_events_code.c"
 PIT_TFLG2.TIF = 1;

}

void startGame(){

 DrawScreen(&Screen1);
 newGame = 1;
 seconds = 0;
 minutes = 0;
 Timer2_Init(1);
}


void showImage1(){

 if (newGame ==1){
 buttonNum =1;
 pictureNum =1;
 counter ++;
 TFT_image(60,45,bajic_bmp,1);
 imageFound();
 }

}

void showImage2(){

 if (newGame ==1){
 buttonNum =2;
 pictureNum =4;
 counter ++;
 TFT_image(180,45,miraa_bmp,1);
 imageFound();
 }

}

void showImage3(){

 if (newGame ==1){
 buttonNum =3;
 pictureNum =2;
 counter ++;
 TFT_image(300,45,bodic_bmp,1);
 imageFound();
 }

}

void showImage4(){

 if (newGame ==1){
 buttonNum =4;
 pictureNum =3;
 counter ++;
 TFT_image(420,45,kalman_bmp,1);
 imageFound();
 }

}

void showImage5(){

 if (newGame ==1){
 buttonNum =5;
 pictureNum =5;
 counter ++;
 TFT_image(60,145,rajss_bmp,1);
 imageFound();
 }

}

void showImage6(){

 if (newGame ==1){
 buttonNum =6;
 pictureNum =6;
 counter ++;
 TFT_image(180,145,brkicc_bmp,1);
 imageFound();
 }

}

void showImage7(){

 if (newGame ==1){
 buttonNum =7;
 pictureNum =4;
 counter ++;
 TFT_image(300,145,miraa_bmp,1);
 imageFound();
 }

}

void showImage8(){

 if (newGame ==1){
 buttonNum =8;
 pictureNum =7;
 counter ++;
 TFT_image(420,145,kisic_bmp,1);
 imageFound();

 }

}

void showImage9(){

 if (newGame ==1){
 buttonNum =9;
 pictureNum =8;
 counter ++;
 TFT_image(60,245,tomic_bmp,1);
 imageFound();
 }

}

void showImage10(){

 if (newGame ==1){
 buttonNum =10;
 pictureNum =6;
 counter ++;
 TFT_image(180,245,brkicc_bmp,1);
 imageFound();
 }

}

void showImage11(){

 if (newGame ==1){
 buttonNum =11;
 pictureNum =7;
 counter ++;
 TFT_image(300,245,kisic_bmp,1);
 imageFound();
 }

}

void showImage12(){

 if (newGame ==1){
 buttonNum =12;
 pictureNum =8;
 counter ++;
 TFT_image(420,245,tomic_bmp,1);
 imageFound();
 }

}

void showImage13(){

 if (newGame ==1){
 buttonNum =13;
 pictureNum =3;
 counter ++;
 TFT_image(60,345,kalman_bmp,1);
 imageFound();
 }

}

void showImage14(){

 if (newGame ==1){
 buttonNum =14;
 pictureNum =2;
 counter ++;
 TFT_image(180,345,bodic_bmp,1);
 imageFound();
 }

}

void showImage15(){

 if (newGame ==1){
 buttonNum =15;
 pictureNum =5;
 counter ++;
 TFT_image(300,345,rajss_bmp,1);
 imageFound();
 }

}

void showImage16(){

 if (newGame ==1){
 buttonNum =16;
 pictureNum =1;
 counter ++;
 TFT_image(420,345,bajic_bmp,1);
 imageFound();
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
 Label4.Caption = first;
 }
 if (results[1] != 0){
 IntToStr(results[1], second);
 Label5.Caption = second;
 }

 if (results[2] != 0) {
 IntToStr(results[2], third);
 Label6.Caption = third;
 }

 if (results[3] != 0){
 IntToStr(results[3], fourth);
 Label7.Caption = fourth;
 }

 if (results[4] != 0) {
 IntToStr(results[4], fifth);
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
