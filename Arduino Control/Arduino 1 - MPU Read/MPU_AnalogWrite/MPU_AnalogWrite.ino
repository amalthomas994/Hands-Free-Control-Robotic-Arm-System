

#include "Wire.h"
#include "I2Cdev.h"
#include "MPU6050.h"
#include "Servo.h"
MPU6050 mpu;
int16_t a, b, c;
int16_t d, e, f;
long res, val2;
long prevVal;
int x;
int y;
int z;

void setup() 
{
    Wire.begin();
    Serial.begin(9600);
    mpu.initialize();
    pinMode(11, OUTPUT);
    pinMode(10, OUTPUT);
    pinMode(9, OUTPUT);
    
}
void loop() 
{
    mpu.getMotion6(&a, &b, &c, &d, &e, &f);
    y = map(a, -15000, 15000, 0, 255);
    x = map(b, -15000, 15000, 0, 255);
    z = map(c, -15000, 15000, 0, 255);
    Serial.print(a);Serial.print('\t');
    Serial.print(b);Serial.print('\t');
    Serial.print(c);Serial.print('\t');
    Serial.print('\n');
    analogWrite(11, x);
    delay(100);
    analogWrite(10, y);
    delay(100);
    analogWrite(9, z);
    delay(100);
}
