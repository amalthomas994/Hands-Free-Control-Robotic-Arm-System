#include <Servo.h> 

Servo servo1;   
Servo servo2;
Servo servo3;   
Servo servo4;
Servo servo5;   
Servo servo6;

int i = 0;
                
  void setup() 
  { 

    servo1.attach(13);
    servo2.attach(12);
    servo3.attach(11);
    servo4.attach(10);
    servo5.attach(9);
    servo6.attach(8);// attaches the servo on pin 9 to the servo object
//    servoLowerarm.attach(13);
//    servoUp.attach(11);
  } 


void loop() 
{
  for (i=0; i<180; i+=1)
     {
      servo1.write(i);
      delay(50);
     }
//   servoBase.write(170);   //0 left
////   servoUp.write(180); //180 all up lowest servo
////   servoLowerarm.write(180);  //180 all up higherservo
//   delay(1000);
//   servoBase.write(0);
//   delay(1000);
//   servoUp.write(125);
//   delay(900);
//   servoBase.write(180);
//   servoUp.write(120);
//   servoLowerarm.write(180);
//   delay(3000);
//   servoUp.write(180);
//   delay(1000);
//   servoLowerarm.write(90);
//   delay(2000);
}
