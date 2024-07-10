#line 1 "C:/Users/Marko/Desktop/M2M/Projekat v1/MyProject_driver.c"
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
#line 1 "d:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 8 "C:/Users/Marko/Desktop/M2M/Projekat v1/MyProject_driver.c"
sbit TFT_BLED at GPIOC_PDOR.B0;
sbit TFT_CS at GPIOC_PDOR.B11;
char TFT_DataPort at GPIOD_PDOR;
sbit TFT_RD at GPIOC_PDOR.B13;
sbit TFT_RS at GPIOC_PDOR.B12;
sbit TFT_RST at GPIOC_PDOR.B10;
sbit TFT_WR at GPIOC_PDOR.B14;






unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TBox *local_box;
TBox *exec_box;
int box_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
 GPIOD_PDOR = (unsigned int) (_lo | (_hi << 8));
}

void Set_Index(unsigned short index) {
 TFT_RS = 0;
 Write_to_Data_Lines(0, index);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
 TFT_RS = 1;
 Write_to_Data_Lines(0, cmd);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
 TFT_RS = 1;
 Write_to_Data_Lines( ((char *)&_data)[1] ,  ((char *)&_data)[0] );
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

static void InitializeTouchPanel() {
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963_Board_50(800, 480);

 TFT_Set_DBC_SSD1963(255);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}



 TScreen* CurrentScreen;

 TScreen Screen1;
 TButton Button1;
char Button1_Caption[1] = "";

 TButton Button2;
char Button2_Caption[1] = "";

 TButton Button3;
char Button3_Caption[1] = "";

 TButton Button4;
char Button4_Caption[1] = "";

 TButton Button5;
char Button5_Caption[1] = "";

 TButton Button6;
char Button6_Caption[1] = "";

 TButton Button7;
char Button7_Caption[1] = "";

 TButton Button8;
char Button8_Caption[1] = "";

 TButton Button9;
char Button9_Caption[1] = "";

 TButton Button10;
char Button10_Caption[1] = "";

 TButton Button11;
char Button11_Caption[1] = "";

 TButton Button12;
char Button12_Caption[1] = "";

 TButton Button13;
char Button13_Caption[1] = "";

 TButton Button14;
char Button14_Caption[1] = "";

 TButton Button15;
char Button15_Caption[1] = "";

 TButton Button16;
char Button16_Caption[1] = "";

 TButton_Round ButtonRound1;
char ButtonRound1_Caption[10] = "Nova igra";

 TButton_Round ButtonRound2;
char ButtonRound2_Caption[10] = "Rezultati";

 TLabel Vreme;
char Vreme_Caption[6] = "VREME";

 TLabel Rang_lista;
char Rang_lista_Caption[11] = "Rang lista";

 TBox Box1;
 TBox Box2;
 TBox Box3;
 TBox Box4;
 TBox Box5;
 TBox Box6;
 TImage Image5;
 TImage Image1;
 TImage Image2;
 TImage Image3;
 TImage Image4;
 TImage Image6;
 TImage Image7;
 TImage Image8;
 TLabel Label1;
char Label1_Caption[1] = "";

 TLabel Label2;
char Label2_Caption[1] = "";

 TLabel Label3;
char Label3_Caption[1] = "";

 TLabel Label4;
char Label4_Caption[1] = "";

 TLabel Label5;
char Label5_Caption[1] = "";

 TLabel Label6;
char Label6_Caption[1] = "";

 TLabel Label7;
char Label7_Caption[1] = "";

 TLabel Label8;
char Label8_Caption[1] = "";

 TLabel Label9;
char Label9_Caption[3] = "1.";

 TLabel Label10;
char Label10_Caption[3] = "2.";

 TLabel Label11;
char Label11_Caption[3] = "3.";

 TLabel Label12;
char Label12_Caption[3] = "4.";

 TLabel Label13;
char Label13_Caption[3] = "5.";

 TButton * const code Screen1_Buttons[16]=
 {
 &Button1,
 &Button2,
 &Button3,
 &Button4,
 &Button5,
 &Button6,
 &Button7,
 &Button8,
 &Button9,
 &Button10,
 &Button11,
 &Button12,
 &Button13,
 &Button14,
 &Button15,
 &Button16
 };
 TButton_Round * const code Screen1_Buttons_Round[2]=
 {
 &ButtonRound1,
 &ButtonRound2
 };
 TLabel * const code Screen1_Labels[15]=
 {
 &Vreme,
 &Rang_lista,
 &Label1,
 &Label2,
 &Label3,
 &Label4,
 &Label5,
 &Label6,
 &Label7,
 &Label8,
 &Label9,
 &Label10,
 &Label11,
 &Label12,
 &Label13
 };
 TImage * const code Screen1_Images[8]=
 {
 &Image5,
 &Image1,
 &Image2,
 &Image3,
 &Image4,
 &Image6,
 &Image7,
 &Image8
 };
 TBox * const code Screen1_Boxes[6]=
 {
 &Box1,
 &Box2,
 &Box3,
 &Box4,
 &Box5,
 &Box6
 };



static void InitializeObjects() {
 Screen1.Color = 0x5AEB;
 Screen1.Width = 800;
 Screen1.Height = 480;
 Screen1.ButtonsCount = 16;
 Screen1.Buttons = Screen1_Buttons;
 Screen1.Buttons_RoundCount = 2;
 Screen1.Buttons_Round = Screen1_Buttons_Round;
 Screen1.LabelsCount = 15;
 Screen1.Labels = Screen1_Labels;
 Screen1.ImagesCount = 8;
 Screen1.Images = Screen1_Images;
 Screen1.BoxesCount = 6;
 Screen1.Boxes = Screen1_Boxes;
 Screen1.ObjectsCount = 47;
 Screen1.OnSwipeUpPtr = 0;
 Screen1.OnSwipeDownPtr = 0;
 Screen1.OnSwipeLeftPtr = 0;
 Screen1.OnSwipeRightPtr = 0;
 Screen1.OnZoomInPtr = 0;
 Screen1.OnZoomOutPtr = 0;


 Button1.OwnerScreen = &Screen1;
 Button1.Order = 0;
 Button1.Left = 60;
 Button2.OnClickPtr = showImage2;
 Button1.Top = 45;
 Button1.Width = 106;
 Button1.Height = 80;
 Button1.Pen_Width = 1;
 Button1.Pen_Color = 0x0000;
 Button1.Visible = 1;
 Button1.Active = 1;
 Button1.Transparent = 1;
 Button1.Caption = Button1_Caption;
 Button1.TextAlign = _taCenter;
 Button1.TextAlignVertical= _tavMiddle;
 Button1.FontName = Tahoma11x13_Regular;
 Button1.PressColEnabled = 1;
 Button1.Font_Color = 0x0000;
 Button1.VerticalText = 0;
 Button1.Gradient = 1;
 Button1.Gradient_Orientation = 0;
 Button1.Gradient_Start_Color = 0xFFFF;
 Button1.Gradient_End_Color = 0xC618;
 Button1.Color = 0xC618;
 Button1.Press_Color = 0xE71C;
 Button1.OnClickPtr = showImage1;

 Button2.OwnerScreen = &Screen1;
 Button2.Order = 1;
 Button2.Left = 180;
 Button2.Top = 45;
 Button2.Width = 106;
 Button2.Height = 80;
 Button2.Pen_Width = 1;
 Button2.Pen_Color = 0x0000;
 Button2.Visible = 1;
 Button2.Active = 1;
 Button2.Transparent = 1;
 Button2.Caption = Button2_Caption;
 Button2.TextAlign = _taCenter;
 Button2.TextAlignVertical= _tavMiddle;
 Button2.FontName = Tahoma11x13_Regular;
 Button2.PressColEnabled = 1;
 Button2.Font_Color = 0x0000;
 Button2.VerticalText = 0;
 Button2.Gradient = 1;
 Button2.Gradient_Orientation = 0;
 Button2.Gradient_Start_Color = 0xFFFF;
 Button2.Gradient_End_Color = 0xC618;
 Button2.Color = 0xC618;
 Button2.Press_Color = 0xE71C;
 Button2.OnClickPtr = showImage2;

 Button3.OwnerScreen = &Screen1;
 Button3.Order = 2;
 Button3.Left = 300;
 Button3.Top = 45;
 Button3.Width = 106;
 Button3.Height = 80;
 Button3.Pen_Width = 1;
 Button3.Pen_Color = 0x0000;
 Button3.Visible = 1;
 Button3.Active = 1;
 Button3.Transparent = 1;
 Button3.Caption = Button3_Caption;
 Button3.TextAlign = _taCenter;
 Button3.TextAlignVertical= _tavMiddle;
 Button3.FontName = Tahoma11x13_Regular;
 Button3.PressColEnabled = 1;
 Button3.Font_Color = 0x0000;
 Button3.VerticalText = 0;
 Button3.Gradient = 1;
 Button3.Gradient_Orientation = 0;
 Button3.Gradient_Start_Color = 0xFFFF;
 Button3.Gradient_End_Color = 0xC618;
 Button3.Color = 0xC618;
 Button3.Press_Color = 0xE71C;
 Button3.OnClickPtr = showImage3;

 Button4.OwnerScreen = &Screen1;
 Button4.Order = 3;
 Button4.Left = 420;
 Button4.Top = 45;
 Button4.Width = 106;
 Button4.Height = 80;
 Button4.Pen_Width = 1;
 Button4.Pen_Color = 0x0000;
 Button4.Visible = 1;
 Button4.Active = 1;
 Button4.Transparent = 1;
 Button4.Caption = Button4_Caption;
 Button4.TextAlign = _taCenter;
 Button4.TextAlignVertical= _tavMiddle;
 Button4.FontName = Tahoma11x13_Regular;
 Button4.PressColEnabled = 1;
 Button4.Font_Color = 0x0000;
 Button4.VerticalText = 0;
 Button4.Gradient = 1;
 Button4.Gradient_Orientation = 0;
 Button4.Gradient_Start_Color = 0xFFFF;
 Button4.Gradient_End_Color = 0xC618;
 Button4.Color = 0xC618;
 Button4.Press_Color = 0xE71C;
 Button4.OnClickPtr = showImage4;

 Button5.OwnerScreen = &Screen1;
 Button5.Order = 4;
 Button5.Left = 59;
 Button5.Top = 146;
 Button5.Width = 106;
 Button5.Height = 80;
 Button5.Pen_Width = 1;
 Button5.Pen_Color = 0x0000;
 Button5.Visible = 1;
 Button5.Active = 1;
 Button5.Transparent = 1;
 Button5.Caption = Button5_Caption;
 Button5.TextAlign = _taCenter;
 Button5.TextAlignVertical= _tavMiddle;
 Button5.FontName = Tahoma11x13_Regular;
 Button5.PressColEnabled = 1;
 Button5.Font_Color = 0x0000;
 Button5.VerticalText = 0;
 Button5.Gradient = 1;
 Button5.Gradient_Orientation = 0;
 Button5.Gradient_Start_Color = 0xFFFF;
 Button5.Gradient_End_Color = 0xC618;
 Button5.Color = 0xC618;
 Button5.Press_Color = 0xE71C;
 Button5.OnClickPtr = showImage5;

 Button6.OwnerScreen = &Screen1;
 Button6.Order = 5;
 Button6.Left = 179;
 Button6.Top = 145;
 Button6.Width = 106;
 Button6.Height = 80;
 Button6.Pen_Width = 1;
 Button6.Pen_Color = 0x0000;
 Button6.Visible = 1;
 Button6.Active = 1;
 Button6.Transparent = 1;
 Button6.Caption = Button6_Caption;
 Button6.TextAlign = _taCenter;
 Button6.TextAlignVertical= _tavMiddle;
 Button6.FontName = Tahoma11x13_Regular;
 Button6.PressColEnabled = 1;
 Button6.Font_Color = 0x0000;
 Button6.VerticalText = 0;
 Button6.Gradient = 1;
 Button6.Gradient_Orientation = 0;
 Button6.Gradient_Start_Color = 0xFFFF;
 Button6.Gradient_End_Color = 0xC618;
 Button6.Color = 0xC618;
 Button6.Press_Color = 0xE71C;
 Button6.OnClickPtr = showImage6;

 Button7.OwnerScreen = &Screen1;
 Button7.Order = 6;
 Button7.Left = 299;
 Button7.Top = 145;
 Button7.Width = 106;
 Button7.Height = 80;
 Button7.Pen_Width = 1;
 Button7.Pen_Color = 0x0000;
 Button7.Visible = 1;
 Button7.Active = 1;
 Button7.Transparent = 1;
 Button7.Caption = Button7_Caption;
 Button7.TextAlign = _taCenter;
 Button7.TextAlignVertical= _tavMiddle;
 Button7.FontName = Tahoma11x13_Regular;
 Button7.PressColEnabled = 1;
 Button7.Font_Color = 0x0000;
 Button7.VerticalText = 0;
 Button7.Gradient = 1;
 Button7.Gradient_Orientation = 0;
 Button7.Gradient_Start_Color = 0xFFFF;
 Button7.Gradient_End_Color = 0xC618;
 Button7.Color = 0xC618;
 Button7.Press_Color = 0xE71C;
 Button7.OnClickPtr = showImage7;

 Button8.OwnerScreen = &Screen1;
 Button8.Order = 7;
 Button8.Left = 421;
 Button8.Top = 146;
 Button8.Width = 106;
 Button8.Height = 80;
 Button8.Pen_Width = 1;
 Button8.Pen_Color = 0x0000;
 Button8.Visible = 1;
 Button8.Active = 1;
 Button8.Transparent = 1;
 Button8.Caption = Button8_Caption;
 Button8.TextAlign = _taCenter;
 Button8.TextAlignVertical= _tavMiddle;
 Button8.FontName = Tahoma11x13_Regular;
 Button8.PressColEnabled = 1;
 Button8.Font_Color = 0x0000;
 Button8.VerticalText = 0;
 Button8.Gradient = 1;
 Button8.Gradient_Orientation = 0;
 Button8.Gradient_Start_Color = 0xFFFF;
 Button8.Gradient_End_Color = 0xC618;
 Button8.Color = 0xC618;
 Button8.Press_Color = 0xE71C;
 Button8.OnClickPtr = showImage8;

 Button9.OwnerScreen = &Screen1;
 Button9.Order = 8;
 Button9.Left = 59;
 Button9.Top = 244;
 Button9.Width = 106;
 Button9.Height = 80;
 Button9.Pen_Width = 1;
 Button9.Pen_Color = 0x0000;
 Button9.Visible = 1;
 Button9.Active = 1;
 Button9.Transparent = 1;
 Button9.Caption = Button9_Caption;
 Button9.TextAlign = _taCenter;
 Button9.TextAlignVertical= _tavMiddle;
 Button9.FontName = Tahoma11x13_Regular;
 Button9.PressColEnabled = 1;
 Button9.Font_Color = 0x0000;
 Button9.VerticalText = 0;
 Button9.Gradient = 1;
 Button9.Gradient_Orientation = 0;
 Button9.Gradient_Start_Color = 0xFFFF;
 Button9.Gradient_End_Color = 0xC618;
 Button9.Color = 0xC618;
 Button9.Press_Color = 0xE71C;
 Button9.OnClickPtr = showImage9;

 Button10.OwnerScreen = &Screen1;
 Button10.Order = 9;
 Button10.Left = 179;
 Button10.Top = 244;
 Button10.Width = 106;
 Button10.Height = 80;
 Button10.Pen_Width = 1;
 Button10.Pen_Color = 0x0000;
 Button10.Visible = 1;
 Button10.Active = 1;
 Button10.Transparent = 1;
 Button10.Caption = Button10_Caption;
 Button10.TextAlign = _taCenter;
 Button10.TextAlignVertical= _tavMiddle;
 Button10.FontName = Tahoma11x13_Regular;
 Button10.PressColEnabled = 1;
 Button10.Font_Color = 0x0000;
 Button10.VerticalText = 0;
 Button10.Gradient = 1;
 Button10.Gradient_Orientation = 0;
 Button10.Gradient_Start_Color = 0xFFFF;
 Button10.Gradient_End_Color = 0xC618;
 Button10.Color = 0xC618;
 Button10.Press_Color = 0xE71C;
 Button10.OnClickPtr = showImage10;

 Button11.OwnerScreen = &Screen1;
 Button11.Order = 10;
 Button11.Left = 299;
 Button11.Top = 245;
 Button11.Width = 106;
 Button11.Height = 80;
 Button11.Pen_Width = 1;
 Button11.Pen_Color = 0x0000;
 Button11.Visible = 1;
 Button11.Active = 1;
 Button11.Transparent = 1;
 Button11.Caption = Button11_Caption;
 Button11.TextAlign = _taCenter;
 Button11.TextAlignVertical= _tavMiddle;
 Button11.FontName = Tahoma11x13_Regular;
 Button11.PressColEnabled = 1;
 Button11.Font_Color = 0x0000;
 Button11.VerticalText = 0;
 Button11.Gradient = 1;
 Button11.Gradient_Orientation = 0;
 Button11.Gradient_Start_Color = 0xFFFF;
 Button11.Gradient_End_Color = 0xC618;
 Button11.Color = 0xC618;
 Button11.Press_Color = 0xE71C;
 Button11.OnClickPtr = showImage11;

 Button12.OwnerScreen = &Screen1;
 Button12.Order = 11;
 Button12.Left = 419;
 Button12.Top = 244;
 Button12.Width = 106;
 Button12.Height = 80;
 Button12.Pen_Width = 1;
 Button12.Pen_Color = 0x0000;
 Button12.Visible = 1;
 Button12.Active = 1;
 Button12.Transparent = 1;
 Button12.Caption = Button12_Caption;
 Button12.TextAlign = _taCenter;
 Button12.TextAlignVertical= _tavMiddle;
 Button12.FontName = Tahoma11x13_Regular;
 Button12.PressColEnabled = 1;
 Button12.Font_Color = 0x0000;
 Button12.VerticalText = 0;
 Button12.Gradient = 1;
 Button12.Gradient_Orientation = 0;
 Button12.Gradient_Start_Color = 0xFFFF;
 Button12.Gradient_End_Color = 0xC618;
 Button12.Color = 0xC618;
 Button12.Press_Color = 0xE71C;
 Button12.OnClickPtr = showImage12;

 Button13.OwnerScreen = &Screen1;
 Button13.Order = 12;
 Button13.Left = 61;
 Button13.Top = 345;
 Button13.Width = 106;
 Button13.Height = 80;
 Button13.Pen_Width = 1;
 Button13.Pen_Color = 0x0000;
 Button13.Visible = 1;
 Button13.Active = 1;
 Button13.Transparent = 1;
 Button13.Caption = Button13_Caption;
 Button13.TextAlign = _taCenter;
 Button13.TextAlignVertical= _tavMiddle;
 Button13.FontName = Tahoma11x13_Regular;
 Button13.PressColEnabled = 1;
 Button13.Font_Color = 0x0000;
 Button13.VerticalText = 0;
 Button13.Gradient = 1;
 Button13.Gradient_Orientation = 0;
 Button13.Gradient_Start_Color = 0xFFFF;
 Button13.Gradient_End_Color = 0xC618;
 Button13.Color = 0xC618;
 Button13.Press_Color = 0xE71C;
 Button13.OnClickPtr = showImage13;

 Button14.OwnerScreen = &Screen1;
 Button14.Order = 13;
 Button14.Left = 181;
 Button14.Top = 345;
 Button14.Width = 106;
 Button14.Height = 80;
 Button14.Pen_Width = 1;
 Button14.Pen_Color = 0x0000;
 Button14.Visible = 1;
 Button14.Active = 1;
 Button14.Transparent = 1;
 Button14.Caption = Button14_Caption;
 Button14.TextAlign = _taCenter;
 Button14.TextAlignVertical= _tavMiddle;
 Button14.FontName = Tahoma11x13_Regular;
 Button14.PressColEnabled = 1;
 Button14.Font_Color = 0x0000;
 Button14.VerticalText = 0;
 Button14.Gradient = 1;
 Button14.Gradient_Orientation = 0;
 Button14.Gradient_Start_Color = 0xFFFF;
 Button14.Gradient_End_Color = 0xC618;
 Button14.Color = 0xC618;
 Button14.Press_Color = 0xE71C;
 Button14.OnClickPtr = showImage14;

 Button15.OwnerScreen = &Screen1;
 Button15.Order = 14;
 Button15.Left = 301;
 Button15.Top = 345;
 Button15.Width = 106;
 Button15.Height = 80;
 Button15.Pen_Width = 1;
 Button15.Pen_Color = 0x0000;
 Button15.Visible = 1;
 Button15.Active = 1;
 Button15.Transparent = 1;
 Button15.Caption = Button15_Caption;
 Button15.TextAlign = _taCenter;
 Button15.TextAlignVertical= _tavMiddle;
 Button15.FontName = Tahoma11x13_Regular;
 Button15.PressColEnabled = 1;
 Button15.Font_Color = 0x0000;
 Button15.VerticalText = 0;
 Button15.Gradient = 1;
 Button15.Gradient_Orientation = 0;
 Button15.Gradient_Start_Color = 0xFFFF;
 Button15.Gradient_End_Color = 0xC618;
 Button15.Color = 0xC618;
 Button15.Press_Color = 0xE71C;
 Button15.OnClickPtr = showImage15;

 Button16.OwnerScreen = &Screen1;
 Button16.Order = 15;
 Button16.Left = 421;
 Button16.Top = 345;
 Button16.Width = 106;
 Button16.Height = 80;
 Button16.Pen_Width = 1;
 Button16.Pen_Color = 0x0000;
 Button16.Visible = 1;
 Button16.Active = 1;
 Button16.Transparent = 1;
 Button16.Caption = Button16_Caption;
 Button16.TextAlign = _taCenter;
 Button16.TextAlignVertical= _tavMiddle;
 Button16.FontName = Tahoma11x13_Regular;
 Button16.PressColEnabled = 1;
 Button16.Font_Color = 0x0000;
 Button16.VerticalText = 0;
 Button16.Gradient = 1;
 Button16.Gradient_Orientation = 0;
 Button16.Gradient_Start_Color = 0xFFFF;
 Button16.Gradient_End_Color = 0xC618;
 Button16.Color = 0xC618;
 Button16.Press_Color = 0xE71C;
 Button16.OnClickPtr = showImage16;

 ButtonRound1.OwnerScreen = &Screen1;
 ButtonRound1.Order = 16;
 ButtonRound1.Left = 676;
 ButtonRound1.Top = 15;
 ButtonRound1.Width = 99;
 ButtonRound1.Height = 59;
 ButtonRound1.Pen_Width = 1;
 ButtonRound1.Pen_Color = 0x0000;
 ButtonRound1.Visible = 1;
 ButtonRound1.Active = 1;
 ButtonRound1.Transparent = 1;
 ButtonRound1.Caption = ButtonRound1_Caption;
 ButtonRound1.TextAlign = _taCenter;
 ButtonRound1.TextAlignVertical= _tavMiddle;
 ButtonRound1.FontName = Tahoma12x16_Regular;
 ButtonRound1.PressColEnabled = 1;
 ButtonRound1.Font_Color = 0x0000;
 ButtonRound1.VerticalText = 0;
 ButtonRound1.Gradient = 1;
 ButtonRound1.Gradient_Orientation = 0;
 ButtonRound1.Gradient_Start_Color = 0xFFFF;
 ButtonRound1.Gradient_End_Color = 0xC618;
 ButtonRound1.Color = 0xC618;
 ButtonRound1.Press_Color = 0xE71C;
 ButtonRound1.Corner_Radius = 3;
 ButtonRound1.OnClickPtr = startGame;

 ButtonRound2.OwnerScreen = &Screen1;
 ButtonRound2.Order = 17;
 ButtonRound2.Left = 676;
 ButtonRound2.Top = 377;
 ButtonRound2.Width = 99;
 ButtonRound2.Height = 59;
 ButtonRound2.Pen_Width = 1;
 ButtonRound2.Pen_Color = 0x0000;
 ButtonRound2.Visible = 1;
 ButtonRound2.Active = 1;
 ButtonRound2.Transparent = 1;
 ButtonRound2.Caption = ButtonRound2_Caption;
 ButtonRound2.TextAlign = _taCenter;
 ButtonRound2.TextAlignVertical= _tavMiddle;
 ButtonRound2.FontName = Tahoma12x16_Regular;
 ButtonRound2.PressColEnabled = 1;
 ButtonRound2.Font_Color = 0x0000;
 ButtonRound2.VerticalText = 0;
 ButtonRound2.Gradient = 1;
 ButtonRound2.Gradient_Orientation = 0;
 ButtonRound2.Gradient_Start_Color = 0xFFFF;
 ButtonRound2.Gradient_End_Color = 0xC618;
 ButtonRound2.Color = 0xC618;
 ButtonRound2.Press_Color = 0xE71C;
 ButtonRound2.Corner_Radius = 3;
 ButtonRound2.OnClickPtr = showResults;

 Vreme.OwnerScreen = &Screen1;
 Vreme.Order = 18;
 Vreme.Left = 569;
 Vreme.Top = 16;
 Vreme.Width = 71;
 Vreme.Height = 27;
 Vreme.Visible = 0;
 Vreme.Active = 1;
 Vreme.Caption = Vreme_Caption;
 Vreme.FontName = Tahoma20x24_Regular;
 Vreme.Font_Color = 0xCFFF;
 Vreme.VerticalText = 0;

 Rang_lista.OwnerScreen = &Screen1;
 Rang_lista.Order = 19;
 Rang_lista.Left = 678;
 Rang_lista.Top = 84;
 Rang_lista.Width = 96;
 Rang_lista.Height = 27;
 Rang_lista.Visible = 1;
 Rang_lista.Active = 1;
 Rang_lista.Caption = Rang_lista_Caption;
 Rang_lista.FontName = Tahoma20x24_Regular;
 Rang_lista.Font_Color = 0xCFFF;
 Rang_lista.VerticalText = 0;

 Box1.OwnerScreen = &Screen1;
 Box1.Order = 20;
 Box1.Left = 564;
 Box1.Top = 51;
 Box1.Width = 81;
 Box1.Height = 27;
 Box1.Pen_Width = 1;
 Box1.Pen_Color = 0x0000;
 Box1.Visible = 1;
 Box1.Active = 1;
 Box1.Transparent = 1;
 Box1.Gradient = 1;
 Box1.Gradient_Orientation = 0;
 Box1.Gradient_Start_Color = 0xFFFF;
 Box1.Gradient_End_Color = 0xC618;
 Box1.Color = 0xC618;
 Box1.PressColEnabled = 1;
 Box1.Press_Color = 0xE71C;

 Box2.OwnerScreen = &Screen1;
 Box2.Order = 21;
 Box2.Left = 685;
 Box2.Top = 120;
 Box2.Width = 81;
 Box2.Height = 27;
 Box2.Pen_Width = 1;
 Box2.Pen_Color = 0x0000;
 Box2.Visible = 1;
 Box2.Active = 1;
 Box2.Transparent = 1;
 Box2.Gradient = 1;
 Box2.Gradient_Orientation = 0;
 Box2.Gradient_Start_Color = 0xFFFF;
 Box2.Gradient_End_Color = 0xC618;
 Box2.Color = 0xC618;
 Box2.PressColEnabled = 1;
 Box2.Press_Color = 0xE71C;

 Box3.OwnerScreen = &Screen1;
 Box3.Order = 22;
 Box3.Left = 685;
 Box3.Top = 160;
 Box3.Width = 81;
 Box3.Height = 27;
 Box3.Pen_Width = 1;
 Box3.Pen_Color = 0x0000;
 Box3.Visible = 1;
 Box3.Active = 1;
 Box3.Transparent = 1;
 Box3.Gradient = 1;
 Box3.Gradient_Orientation = 0;
 Box3.Gradient_Start_Color = 0xFFFF;
 Box3.Gradient_End_Color = 0xC618;
 Box3.Color = 0xC618;
 Box3.PressColEnabled = 1;
 Box3.Press_Color = 0xE71C;

 Box4.OwnerScreen = &Screen1;
 Box4.Order = 23;
 Box4.Left = 685;
 Box4.Top = 200;
 Box4.Width = 81;
 Box4.Height = 27;
 Box4.Pen_Width = 1;
 Box4.Pen_Color = 0x0000;
 Box4.Visible = 1;
 Box4.Active = 1;
 Box4.Transparent = 1;
 Box4.Gradient = 1;
 Box4.Gradient_Orientation = 0;
 Box4.Gradient_Start_Color = 0xFFFF;
 Box4.Gradient_End_Color = 0xC618;
 Box4.Color = 0xC618;
 Box4.PressColEnabled = 1;
 Box4.Press_Color = 0xE71C;

 Box5.OwnerScreen = &Screen1;
 Box5.Order = 24;
 Box5.Left = 685;
 Box5.Top = 241;
 Box5.Width = 81;
 Box5.Height = 27;
 Box5.Pen_Width = 1;
 Box5.Pen_Color = 0x0000;
 Box5.Visible = 1;
 Box5.Active = 1;
 Box5.Transparent = 1;
 Box5.Gradient = 1;
 Box5.Gradient_Orientation = 0;
 Box5.Gradient_Start_Color = 0xFFFF;
 Box5.Gradient_End_Color = 0xC618;
 Box5.Color = 0xC618;
 Box5.PressColEnabled = 1;
 Box5.Press_Color = 0xE71C;

 Box6.OwnerScreen = &Screen1;
 Box6.Order = 25;
 Box6.Left = 685;
 Box6.Top = 284;
 Box6.Width = 81;
 Box6.Height = 27;
 Box6.Pen_Width = 1;
 Box6.Pen_Color = 0x0000;
 Box6.Visible = 1;
 Box6.Active = 1;
 Box6.Transparent = 1;
 Box6.Gradient = 1;
 Box6.Gradient_Orientation = 0;
 Box6.Gradient_Start_Color = 0xFFFF;
 Box6.Gradient_End_Color = 0xC618;
 Box6.Color = 0xC618;
 Box6.PressColEnabled = 1;
 Box6.Press_Color = 0xE71C;

 Image5.OwnerScreen = &Screen1;
 Image5.Order = 26;
 Image5.Left = 551;
 Image5.Top = 242;
 Image5.Width = 105;
 Image5.Height = 80;
 Image5.Picture_Type = 0;
 Image5.Picture_Ratio = 1;
 Image5.Picture_Name = bajic_bmp;
 Image5.Visible = 0;
 Image5.Active = 0;

 Image1.OwnerScreen = &Screen1;
 Image1.Order = 27;
 Image1.Left = 556;
 Image1.Top = 246;
 Image1.Width = 105;
 Image1.Height = 80;
 Image1.Picture_Type = 0;
 Image1.Picture_Ratio = 1;
 Image1.Picture_Name = rajss_bmp;
 Image1.Visible = 0;
 Image1.Active = 0;

 Image2.OwnerScreen = &Screen1;
 Image2.Order = 28;
 Image2.Left = 554;
 Image2.Top = 246;
 Image2.Width = 105;
 Image2.Height = 80;
 Image2.Picture_Type = 0;
 Image2.Picture_Ratio = 1;
 Image2.Picture_Name = bodic_bmp;
 Image2.Visible = 0;
 Image2.Active = 0;

 Image3.OwnerScreen = &Screen1;
 Image3.Order = 29;
 Image3.Left = 551;
 Image3.Top = 252;
 Image3.Width = 105;
 Image3.Height = 80;
 Image3.Picture_Type = 0;
 Image3.Picture_Ratio = 1;
 Image3.Picture_Name = kalman_bmp;
 Image3.Visible = 0;
 Image3.Active = 0;

 Image4.OwnerScreen = &Screen1;
 Image4.Order = 30;
 Image4.Left = 552;
 Image4.Top = 247;
 Image4.Width = 105;
 Image4.Height = 80;
 Image4.Picture_Type = 0;
 Image4.Picture_Ratio = 1;
 Image4.Picture_Name = brkicc_bmp;
 Image4.Visible = 0;
 Image4.Active = 0;

 Image6.OwnerScreen = &Screen1;
 Image6.Order = 31;
 Image6.Left = 553;
 Image6.Top = 241;
 Image6.Width = 105;
 Image6.Height = 80;
 Image6.Picture_Type = 0;
 Image6.Picture_Ratio = 1;
 Image6.Picture_Name = miraa_bmp;
 Image6.Visible = 0;
 Image6.Active = 0;

 Image7.OwnerScreen = &Screen1;
 Image7.Order = 32;
 Image7.Left = 548;
 Image7.Top = 244;
 Image7.Width = 105;
 Image7.Height = 80;
 Image7.Picture_Type = 0;
 Image7.Picture_Ratio = 1;
 Image7.Picture_Name = kisic_bmp;
 Image7.Visible = 0;
 Image7.Active = 0;

 Image8.OwnerScreen = &Screen1;
 Image8.Order = 33;
 Image8.Left = 551;
 Image8.Top = 241;
 Image8.Width = 105;
 Image8.Height = 80;
 Image8.Picture_Type = 0;
 Image8.Picture_Ratio = 1;
 Image8.Picture_Name = tomic_bmp;
 Image8.Visible = 0;
 Image8.Active = 0;

 Label1.OwnerScreen = &Screen1;
 Label1.Order = 34;
 Label1.Left = 574;
 Label1.Top = 58;
 Label1.Width = 0;
 Label1.Height = 0;
 Label1.Visible = 1;
 Label1.Active = 1;
 Label1.Caption = Label1_Caption;
 Label1.FontName = Tahoma11x13_Regular;
 Label1.Font_Color = 0x0000;
 Label1.VerticalText = 0;

 Label2.OwnerScreen = &Screen1;
 Label2.Order = 35;
 Label2.Left = 612;
 Label2.Top = 58;
 Label2.Width = 0;
 Label2.Height = 0;
 Label2.Visible = 1;
 Label2.Active = 1;
 Label2.Caption = Label2_Caption;
 Label2.FontName = Tahoma11x13_Regular;
 Label2.Font_Color = 0x0000;
 Label2.VerticalText = 0;

 Label3.OwnerScreen = &Screen1;
 Label3.Order = 36;
 Label3.Left = 597;
 Label3.Top = 56;
 Label3.Width = 0;
 Label3.Height = 0;
 Label3.Visible = 1;
 Label3.Active = 1;
 Label3.Caption = Label3_Caption;
 Label3.FontName = Tahoma11x13_Regular;
 Label3.Font_Color = 0x0000;
 Label3.VerticalText = 0;

 Label4.OwnerScreen = &Screen1;
 Label4.Order = 37;
 Label4.Left = 711;
 Label4.Top = 126;
 Label4.Width = 0;
 Label4.Height = 0;
 Label4.Visible = 1;
 Label4.Active = 1;
 Label4.Caption = Label4_Caption;
 Label4.FontName = Tahoma11x13_Regular;
 Label4.Font_Color = 0x0000;
 Label4.VerticalText = 0;

 Label5.OwnerScreen = &Screen1;
 Label5.Order = 38;
 Label5.Left = 712;
 Label5.Top = 166;
 Label5.Width = 0;
 Label5.Height = 0;
 Label5.Visible = 1;
 Label5.Active = 1;
 Label5.Caption = Label5_Caption;
 Label5.FontName = Tahoma11x13_Regular;
 Label5.Font_Color = 0x0000;
 Label5.VerticalText = 0;

 Label6.OwnerScreen = &Screen1;
 Label6.Order = 39;
 Label6.Left = 713;
 Label6.Top = 206;
 Label6.Width = 0;
 Label6.Height = 0;
 Label6.Visible = 1;
 Label6.Active = 1;
 Label6.Caption = Label6_Caption;
 Label6.FontName = Tahoma11x13_Regular;
 Label6.Font_Color = 0x0000;
 Label6.VerticalText = 0;

 Label7.OwnerScreen = &Screen1;
 Label7.Order = 40;
 Label7.Left = 714;
 Label7.Top = 247;
 Label7.Width = 0;
 Label7.Height = 0;
 Label7.Visible = 1;
 Label7.Active = 1;
 Label7.Caption = Label7_Caption;
 Label7.FontName = Tahoma11x13_Regular;
 Label7.Font_Color = 0x0000;
 Label7.VerticalText = 0;

 Label8.OwnerScreen = &Screen1;
 Label8.Order = 41;
 Label8.Left = 716;
 Label8.Top = 287;
 Label8.Width = 0;
 Label8.Height = 0;
 Label8.Visible = 1;
 Label8.Active = 1;
 Label8.Caption = Label8_Caption;
 Label8.FontName = Tahoma11x13_Regular;
 Label8.Font_Color = 0x0000;
 Label8.VerticalText = 0;

 Label9.OwnerScreen = &Screen1;
 Label9.Order = 42;
 Label9.Left = 666;
 Label9.Top = 127;
 Label9.Width = 13;
 Label9.Height = 15;
 Label9.Visible = 1;
 Label9.Active = 1;
 Label9.Caption = Label9_Caption;
 Label9.FontName = Tahoma11x13_Regular;
 Label9.Font_Color = 0x0000;
 Label9.VerticalText = 0;

 Label10.OwnerScreen = &Screen1;
 Label10.Order = 43;
 Label10.Left = 665;
 Label10.Top = 170;
 Label10.Width = 13;
 Label10.Height = 15;
 Label10.Visible = 1;
 Label10.Active = 1;
 Label10.Caption = Label10_Caption;
 Label10.FontName = Tahoma11x13_Regular;
 Label10.Font_Color = 0x0000;
 Label10.VerticalText = 0;

 Label11.OwnerScreen = &Screen1;
 Label11.Order = 44;
 Label11.Left = 666;
 Label11.Top = 209;
 Label11.Width = 13;
 Label11.Height = 15;
 Label11.Visible = 1;
 Label11.Active = 1;
 Label11.Caption = Label11_Caption;
 Label11.FontName = Tahoma11x13_Regular;
 Label11.Font_Color = 0x0000;
 Label11.VerticalText = 0;

 Label12.OwnerScreen = &Screen1;
 Label12.Order = 45;
 Label12.Left = 667;
 Label12.Top = 249;
 Label12.Width = 13;
 Label12.Height = 15;
 Label12.Visible = 1;
 Label12.Active = 1;
 Label12.Caption = Label12_Caption;
 Label12.FontName = Tahoma11x13_Regular;
 Label12.Font_Color = 0x0000;
 Label12.VerticalText = 0;

 Label13.OwnerScreen = &Screen1;
 Label13.Order = 46;
 Label13.Left = 666;
 Label13.Top = 290;
 Label13.Width = 13;
 Label13.Height = 15;
 Label13.Visible = 1;
 Label13.Active = 1;
 Label13.Caption = Label13_Caption;
 Label13.FontName = Tahoma11x13_Regular;
 Label13.Font_Color = 0x0000;
 Label13.VerticalText = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}








void DrawButton(TButton *Abutton) {
unsigned int ALeft, ATop;
 if (Abutton->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
 }
 TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
 TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
 if (Abutton->VerticalText != 0)
 TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
 if (Abutton->TextAlign == _taLeft)
 ALeft = Abutton->Left + 4;
 else if (Abutton->TextAlign == _taCenter)
 ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
 else if (Abutton->TextAlign == _taRight)
 ALeft = Abutton->Left + Abutton->Width - caption_length - 4;

 if (Abutton->TextAlignVertical == _tavTop)
 ATop = Abutton->Top + 4;
 else if (Abutton->TextAlignVertical == _tavMiddle)
 ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
 else if (Abutton->TextAlignVertical == _tavBottom)
 ATop = Abutton->Top + (Abutton->Height - caption_height - 4);

 TFT_Write_Text(Abutton->Caption, ALeft, ATop);
 }
}

void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
 if (Around_button->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 if (Around_button->VerticalText != 0)
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 ALeft = Around_button->Left + 4;
 else if (Around_button->TextAlign == _taCenter)
 ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
 else if (Around_button->TextAlign == _taRight)
 ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

 if (Around_button->TextAlignVertical == _tavTop)
 ATop = Around_button->Top + 3;
 else if (Around_button->TextAlignVertical == _tavMiddle)
 ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
 else if (Around_button->TextAlignVertical == _tavBottom)
 ATop = Around_button->Top + Around_button->Height - caption_height - 4;

 TFT_Write_Text(Around_button->Caption, ALeft, ATop);
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible != 0) {
 if (ALabel->VerticalText != 0)
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawImage(TImage *AImage) {
 if (AImage->Visible != 0) {
 TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 }
}

void DrawBox(TBox *ABox) {
 if (ABox->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
 }
 TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
 TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
 }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short button_idx;
 TButton *local_button;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short image_idx;
 TImage *local_image;
 unsigned short box_idx;
 TBox *local_box;
 char save_bled;

 object_pressed = 0;
 order = 0;
 button_idx = 0;
 round_button_idx = 0;
 label_idx = 0;
 image_idx = 0;
 box_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
 FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Fill_Screen(CurrentScreen->Color);
 TFT_Set_DBC_SSD1963(255);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (button_idx < CurrentScreen->ButtonsCount) {
 local_button =  CurrentScreen->Buttons[button_idx] ;
 if (order == local_button->Order) {
 button_idx++;
 order++;
 DrawButton(local_button);
 }
 }

 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 round_button_idx++;
 order++;
 DrawRoundButton(local_round_button);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (box_idx < CurrentScreen->BoxesCount) {
 local_box =  CurrentScreen->Boxes[box_idx] ;
 if (order == local_box->Order) {
 box_idx++;
 order++;
 DrawBox(local_box);
 }
 }

 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 button_order = -1;
 round_button_order = -1;
 label_order = -1;
 image_order = -1;
 box_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
 local_button =  CurrentScreen->Buttons[_object_count] ;
 if (local_button->Active != 0) {
 if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
 local_button->Width, local_button->Height) == 1) {
 button_order = local_button->Order;
 exec_button = local_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active != 0) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active != 0) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
 local_image =  CurrentScreen->Images[_object_count] ;
 if (local_image->Active != 0) {
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 image_order = local_image->Order;
 exec_image = local_image;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
 local_box =  CurrentScreen->Boxes[_object_count] ;
 if (local_box->Active != 0) {
 if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
 local_box->Width, local_box->Height) == 1) {
 box_order = local_box->Order;
 exec_box = local_box;
 }
 }
 }

 _object_count = -1;
 if (button_order > _object_count )
 _object_count = button_order;
 if (round_button_order > _object_count )
 _object_count = round_button_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (image_order > _object_count )
 _object_count = image_order;
 if (box_order > _object_count )
 _object_count = box_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_button = 0;
 exec_round_button = 0;
 exec_label = 0;
 exec_image = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->OnPressPtr != 0) {
 exec_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 if (exec_image->OnPressPtr != 0) {
 exec_image->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->OnPressPtr != 0) {
 exec_box->OnPressPtr();
 return;
 }
 }
 }

 }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 0: {
 if (PressedObject != 0) {
 exec_button = (TButton*)PressedObject;
 if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
 DrawButton(exec_button);
 }
 break;
 }
 break;
 }

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }

 case 6: {
 if (PressedObject != 0) {
 exec_box = (TBox*)PressedObject;
 if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
 DrawBox(exec_box);
 }
 break;
 }
 break;
 }
 }

 exec_label = 0;
 exec_image = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->OnUpPtr != 0)
 exec_button->OnUpPtr();
 if (PressedObject == (void *)exec_button)
 if (exec_button->OnClickPtr != 0)
 exec_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (void *)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (void *)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 if (exec_image->OnUpPtr != 0)
 exec_image->OnUpPtr();
 if (PressedObject == (void *)exec_image)
 if (exec_image->OnClickPtr != 0)
 exec_image->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->OnUpPtr != 0)
 exec_box->OnUpPtr();
 if (PressedObject == (void *)exec_box)
 if (exec_box->OnClickPtr != 0)
 exec_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_button = 0;
 exec_round_button = 0;
 exec_label = 0;
 exec_image = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawButton(exec_button);
 }
 PressedObject = (void *)exec_button;
 PressedObjectType = 0;
 if (exec_button->OnDownPtr != 0) {
 exec_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == round_button_order) {
 if (exec_round_button->Active != 0) {
 if (exec_round_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (void *)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 PressedObject = (void *)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 PressedObject = (void *)exec_image;
 PressedObjectType = 3;
 if (exec_image->OnDownPtr != 0) {
 exec_image->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->PressColEnabled != 0) {
 object_pressed = 1;
 DrawBox(exec_box);
 }
 PressedObject = (void *)exec_box;
 PressedObjectType = 6;
 if (exec_box->OnDownPtr != 0) {
 exec_box->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (FT5XX6_PressDetect()) {
 if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {

 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU()
{
 GPIO_Digital_Output(&GPIOE_PDOR, _GPIO_PINMASK_24);
 GPIO_Digital_Input (&GPIOE_PDIR, _GPIO_PINMASK_25);
 GPIOE_PDOR.B24 = 1;
 while (GPIOE_PDIR.B25 == 0)
 {
 GPIOE_PDOR.B24 = 0;
 Delay_us(10);
 GPIOE_PDOR.B24 = 1;
 Delay_us(10);
 }
 I2C0_Init_Advanced(400000, &_GPIO_Module_I2C0_PE24_25);

 TFT_Set_Default_Mode();
}

char FT5XX6_Config() {
 FT5XX6_SetI2CAddress(0x38);
 if (FT5XX6_IsOperational() != FT5XX6_OK)
 return FT5XX6_FAILURE;
 FT5XX6_SetDefaultMode();
 FT5XX6_SetController(_TC_FT5X06);
 FT5XX6_SetSizeAndRotation(800,480,0);
return FT5XX6_OK;
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();
 if (FT5XX6_Config() == FT5XX6_OK) {
 } else {
 while(1);
 }


 InitializeObjects();
 display_width = Screen1.Width;
 display_height = Screen1.Height;
 DrawScreen(&Screen1);
}
