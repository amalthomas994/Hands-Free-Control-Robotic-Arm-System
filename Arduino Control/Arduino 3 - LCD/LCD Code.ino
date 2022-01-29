#include <Adafruit_TFTLCD.h>
#include <Adafruit_GFX.h>
#include <TouchScreen.h>
#include <Adafruit_MLX90614.h>
#include <Wire.h>
Adafruit_MLX90614 mlx = Adafruit_MLX90614();

#define LCD_CS A3
#define LCD_CD A2
#define LCD_WR A1
#define LCD_RD A0
#define LCD_RESET A4

#define TS_MINX 204
#define TS_MINY 195
#define TS_MAXX 948
#define TS_MAXY 910

#define YP A2
#define XM A3
#define YM 8
#define XP 9

#define BLACK   0x0000
#define BLUE    0x001F
#define RED     0xF800
#define GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#define beta 4090 //the beta of the thermistor

Adafruit_TFTLCD tft(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RESET);
TouchScreen ts = TouchScreen(XP, YP, XM, YM, 300);
int screen = '0';
int type = '0';
int x;
int b = 0;
const int Back = 22;
const int Control = 23;
//int up=0;


void setup() {
  tft.reset();
  tft.begin(0x9325);
  tft.setRotation(1);
  tft.fillScreen(BLACK);
  tft.drawRect(0, 0, 319, 240, RED);
  tft.drawRect(20, 10, 290, 40, WHITE);

  tft.setCursor(30, 20);
  tft.setTextColor(RED);
  tft.setTextSize(2);
  tft.print("Hands Free Robotic Arm");
  tft.setCursor(120, 120);
  tft.setTextColor(WHITE);
  tft.setTextSize(1);
  tft.print("Created by:\n\n                  Shavin Ratnayake \n\n                  Amal Thomas\n\n                  Aiden\n\n                  Wole\n\n                  Yousif\n\n");
//  delay(1000);

  tft.fillScreen(BLACK);
  para();
//  pinMode(A5, INPUT);
  Serial.begin(9600);
  mlx.begin();
}
void loop()
{
  tft.setTextColor(WHITE);  
  tft.setCursor(190,100);
  tft.setTextSize(2);
  tft.print(mlx.readObjectTempC());
  tft.setCursor(260,100);
  tft.print("*C");
 delay(400);
  tft.fillRect(190, 100, 100, 20, BLACK);  
   if(screen=='0'){
   if(digitalRead(Control)==HIGH){
     pinMode(XM, OUTPUT);
        pinMode(YP, OUTPUT);
        menuControl();
        
        
   }
   }
   if(screen=='1'){
   if(digitalRead(Back)==HIGH){
      pinMode(XM, OUTPUT);
        pinMode(YP, OUTPUT);
        tft.fillScreen(BLACK);
        para();
        screen = '0';
   }
   }
  }
//Menu

void menuControl() {
  tft.fillScreen(BLACK);
  
//  tft.fillRect(10, 10, 40, 40, RED);
//  tft.drawRect(10, 10, 40, 40, WHITE);
//  tft.setCursor(20, 20);
//  tft.setTextColor(WHITE);
//  tft.setTextSize(1.5);
//  tft.print("Back");
  screen = '1';
  type = '1';
  tft.fillRect(75,101,90,34,RED);
  tft.drawRect(75,101,90,34,WHITE);
  tft.drawLine(51,120,74,120,WHITE);
  tft.drawLine(166,120,188,120,WHITE);
  tft.drawLine(115,51,115,100,WHITE);
  tft.drawLine(115,134,115,184,WHITE);
  
  tft.setCursor(95, 110);
  tft.setTextColor(WHITE);
  tft.setTextSize(2);
  tft.print("REST");
  tft.fillRect(95, 10, 40, 40, RED);
  tft.drawRect(95, 10, 40, 40, WHITE);
  tft.setCursor(100, 25);
  tft.setTextColor(WHITE);
  tft.setTextSize(1.5);
  tft.print("X-Out");
  tft.fillRect(95, 185, 40, 40, RED);
  tft.drawRect(95, 185, 40, 40, WHITE);
  tft.setCursor(100, 203);
  tft.setTextColor(WHITE);
  tft.setTextSize(1.5);
  tft.print("X-In");
  tft.fillRect(10, 100, 40, 40, RED);
  tft.drawRect(10, 100, 40, 40, WHITE);
  tft.setCursor(15, 110);
  tft.setTextColor(WHITE);
  tft.setTextSize(1);
  tft.print("Y-");
  tft.setCursor(15, 120);
  tft.print("Left");
  tft.fillRect(190, 100, 40, 40, RED);
  tft.drawRect(190, 100, 40, 40, WHITE);
  tft.setCursor(200, 110);
  tft.setTextColor(WHITE);
  tft.setTextSize(1);
  tft.print("Y-");
  tft.setCursor(200, 120);
  tft.print("Left");
  tft.drawRect(0,0,240,240, WHITE);
  tft.fillRect(240,0,77,119, BLUE);
  tft.drawRect(240,0, 77, 119, BLUE);
  tft.fillRect(240,120, 77, 119, GREEN);
  tft.drawRect(240,120, 77, 119, GREEN);
  tft.setCursor(250, 50);
  tft.setTextColor(WHITE);
  tft.setTextSize(2);
  tft.print("Z-Up");
  tft.setCursor(244, 180);
  tft.setTextColor(WHITE);
  tft.setTextSize(2);
  tft.print("Z-Down");
controlArm();
}


void para() {
yo:
  tft.fillScreen(BLACK);
  tft.drawRect(25,20,270,40, WHITE);
  tft.setTextSize(3);
  tft.setCursor(35,28);
  tft.setTextColor(WHITE);
  tft.print("Arm Parameters");
//  tft.fillRect(10, 10, 40, 40, RED);
//  tft.drawRect(10, 10, 40, 40, WHITE);
//  tft.setCursor(20, 20);
//  tft.setTextColor(WHITE);
//  tft.setTextSize(1.5);
//  tft.print("Back");
  screen = '0';
  type = '2';
  tft.drawRect(0,0,319,240,WHITE);
  tft.fillRect(35,95,150,25,RED);
  tft.drawRect(35,95,150,25,WHITE);
  tft.setCursor(40, 100);
  tft.setTextColor(WHITE);
  tft.setTextSize(2);
  tft.print("Temperature:");
//  tft.setCursor(200,100);
//  tft.print(mlx.readObjectTempC());
//  tft.fillRect(270, 10, 20, 10, BLACK);
  tft.fillRect(35,135,80,25,RED);
  tft.drawRect(35,135,80,25,WHITE);
  tft.setCursor(40, 140);
  tft.setTextColor(WHITE);
  tft.setTextSize(2);
  tft.print("Force:");
  tft.setCursor(40, 183);
  tft.setTextSize(1);
  tft.drawRect(35,175,225,25,WHITE);
  tft.print("Press first button for Arm Controls");
  
}

void homeScreen() {

  tft.drawRect(0, 0, 319, 240, RED);
  tft.setCursor(100, 10);
  //tft.setTextColor(WHITE);
  //tft.setTextSize(2);
  //tft.print("Main Menu");
  //tft.drawRect(80,10,150,40,WHITE);
  //tft.drawLine(30,30,280,30,WHITE);
  tft.setCursor(240, 10);
  tft.setTextSize(1);
  tft.print("Temp:      ");
  tft.setCursor(240, 20);
  tft.setTextSize(1);
  tft.print("Force:     ");

  tft.fillRect(80, 60, 150, 40, RED);
  tft.drawRect(80, 60, 150, 40, WHITE);
  tft.setCursor(90, 70);
  tft.setTextColor(WHITE);
  tft.setTextSize(1.5);
  tft.print("Speech Syn Word:");

  tft.fillRect(80, 120, 150, 40, RED);
  tft.drawRect(80, 120, 150, 40, WHITE);
  tft.setCursor(90, 130);
  tft.setTextColor(WHITE);
  tft.setTextSize(1.5);
  tft.print("Control");

  tft.fillRect(80, 180, 150, 40, RED);
  tft.drawRect(80, 180, 150, 40, WHITE);
  tft.setCursor(90, 190);
  tft.setTextColor(WHITE);
  tft.setTextSize(1.5);
  tft.print("Arm Parameters");
}

void sensor() {

  tft.setCursor(240, 10);
  tft.setTextSize(1);
  tft.print("Temp:      ");
  tft.setCursor(240, 20);
  tft.setTextSize(1);
  tft.print("Force:     ");

}

void controlArm(){
  #define TS_MINX 204
#define TS_MINY 195
#define TS_MAXX 948
#define TS_MAXY 910
int up=1;
 
  while(screen == '1')
  {   
    int z;
    TSPoint cor =ts.getPoint();
    if (cor.z > ts.pressureThreshhold) {
    int x = map(cor.x, TS_MAXX, TS_MINX, 320, 0);
    int y = map(cor.y, TS_MAXY, TS_MINY, 240, 0);
    int ayLeft = map(x, 320, 200, -40, 0 );
    int axUp = map(y, 240, 120, 31, 24);
   if(ayLeft>40){
    int z= map(cor.y, 240, 0, 40, 0);
       Serial.print(z);
       Serial.print('\t');
   }
    Serial.print(ayLeft);Serial.print('\t');
//    Serial.print(ayRight);Serial.print('\t');
    Serial.print(axUp);Serial.print('\n');
//    analogWrite(ax, D13);
//    analogWrite(ay, D12);
//    analogWrite(az, D11);
    }
if(digitalRead(Back)==HIGH){
  break;
}
  }
}


