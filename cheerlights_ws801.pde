#include "WS2801.h"
#include "string.h"

int dataPin = 12;       
int clockPin = 13;
int wait_time = 1000;
// Set the first variable to the NUMBER of pixels. 25 = 25 pixels in a row
WS2801 strip = WS2801(50, dataPin, clockPin);


#define CHANNEL_MAX 255

uint32_t COLOR_WHITE = Color(CHANNEL_MAX,CHANNEL_MAX,CHANNEL_MAX);
uint32_t COLOR_BLACK = Color(0,0,0);
uint32_t COLOR_RED = Color(CHANNEL_MAX,0,0);
uint32_t COLOR_GREEN = Color(0,CHANNEL_MAX,0);
uint32_t COLOR_BLUE = Color(0,0,CHANNEL_MAX);
uint32_t COLOR_CYAN = Color(0,CHANNEL_MAX,CHANNEL_MAX) ;
uint32_t COLOR_MAGENTA = Color(CHANNEL_MAX,0,CHANNEL_MAX);
uint32_t COLOR_YELLOW = Color(CHANNEL_MAX,CHANNEL_MAX,0);
uint32_t COLOR_PURPLE = Color(0xa,0x3,0xd);
uint32_t COLOR_ORANGE = Color(0xf,0x1,0x0);
uint32_t COLOR_WARMWHITE = Color(0xf,0x7,0x2);

void uniColor(uint32_t c){
  int i;
  for (i=0; i < strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
  }
  strip.show();
}

uint32_t Color(byte r, byte g, byte b)
{
  uint32_t c;
  c = r;
  c <<= 8;
  c |= g;
  c <<= 8;
  c |= b;
  return c;
}


void setup(){
  strip.begin();
  strip.show();
  uniColor(COLOR_BLACK);
  Serial.begin(9600);
}

void loop(){
if(Serial.available() > 0)
  {  
    delay(100); 

    char charIn = 0; 
    byte i = 0; 
    char stringIn[32] = "";
   
    while(Serial.available())
    {
      charIn = Serial.read();
      Serial.println(charIn, DEC);
      if(charIn != '\n' && charIn != '\r'){
        stringIn[i] = charIn; 
        i += 1;
      }
    }
    
    // Echo Received Commands on the Serial Monitor
    Serial.print("CheerLight Command Received: ");
    Serial.println(stringIn);
    delay(200); 
    
    // Send matching commands to the GE-35 Color Effect Lights
    if (strcmp(stringIn,"white") == 0)
    {  
        uniColor(COLOR_WHITE);
    }
    else if (strcmp(stringIn,"black") == 0)
    {  
        uniColor(COLOR_BLACK);
    }
    else if (strcmp(stringIn,"red") == 0)
    {  
        uniColor(COLOR_RED);
    }
    else if (strcmp(stringIn,"green") == 0)
    {  
        uniColor(COLOR_GREEN);
    }
    else if (strcmp(stringIn,"blue") == 0)
    {  
        uniColor(COLOR_BLUE);
    }
    else if (strcmp(stringIn,"cyan") == 0)
    {  
        uniColor(COLOR_CYAN);
    }
    else if (strcmp(stringIn,"magenta") == 0)
    {  
        uniColor(COLOR_MAGENTA);
    }
    else if (strcmp(stringIn,"yellow") == 0)
    {  
        uniColor(COLOR_YELLOW);
    }
    else if (strcmp(stringIn,"purple") == 0)
    {  
        uniColor(COLOR_PURPLE);
    }
    else if (strcmp(stringIn,"orange") == 0)
    {  
        uniColor(COLOR_ORANGE);
    }
    else if (strcmp(stringIn,"warmwhite") == 0)
    {  
        uniColor(COLOR_WARMWHITE);
    }
    else if (strcmp(stringIn,"off") == 0)
    {  
        uniColor(COLOR_BLACK);
    }
  }

}


