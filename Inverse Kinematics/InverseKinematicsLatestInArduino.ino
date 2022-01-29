#include <Servo.h>


//DH Parameters
//L
float l1 = 8; float l2 = 9.5; float l3 = 9.5; float l4 = 0; float l5 = 0;
//D
float d1 = 15; float d2 = 0; float d3 = 0; float d4 = -1; float d5 = 4.5;

float pi = 3.14159265359;
float q11 = 1;
float q12 = 0.1;
float q13=0.1;
float q14;
float q21=0.1;
float q22=0.1;
float q23=0.1;
float q24;
float q31=0.1;
float q32=0;
float q33=0.1;
float q34;
float thetaB;
float thetaA;
float theta5;
float theta4;
float theta3;
float theta2;
float theta1;

Servo s1; Servo s2; Servo s3; Servo s4; Servo s5;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
s1.attach(12); s2.attach(11); s3.attach(10); s4.attach(9); s5.attach(8);
q14 = 0;
q24 = 0;
q34 = 0;
}

void loop() {
  // put your main code here, to run repeatedly:

thetaB = asin(q33); //q33 needs to be in radians

//THETA 5
if (-q32>0)
{
  theta5 = acos(q31/cos(thetaB));
}else
{
  theta5 = asin(q32/cos(thetaB));
}

//THETA3
theta3 = asin(((-d5*sin(thetaB))-d1+q34)/l3);

//THETA4
if (theta3>0)
{
  theta4 = acos(q31/cos(theta5))-theta3;
}else
{
  theta4 = thetaB - theta3;
}

//THETA1
 theta1 = asin((q24-d5*sin(asin((q23)/cos(thetaB)))*cos(thetaB)-l3*sin(asin((q23)/cos(thetaB)))*cos(theta3)+d4*cos((acos((q13)/(cos(thetaB)))))-l2*sin(asin((q23)/cos(thetaB))))/l1);

//THETA2
if (q32>0)
{
  thetaA = acos(q13/cos(thetaB));
  theta2 = thetaA - theta1;
}else
{
  thetaA = asin(q23/cos(thetaB));
  theta2 = thetaA - theta1;
}


 theta4 = theta4+(pi/2);
 Serial.print(theta1);Serial.print('\t');
 Serial.print(theta2);Serial.print('\t');
 Serial.print(theta3);Serial.print('\t');
 Serial.print(theta4);Serial.print('\t');
 Serial.print(theta5);Serial.print('\t');
 
 s1.write(map(theta1,-pi/2,pi/2,0,180));
 s2.write(map(theta2,-pi/2,pi/2,0,180));
 s3.write(map(theta3,-pi/2,pi/2,0,180));
 s4.write(map(theta4,-pi/2,pi/2,0,180));
 s5.write(map(theta5,-pi/2,pi/2,0,180));
 q33 = q33+0.01;
 if (q33>1)
 {
  q33 = 1;
 }
 q32 = q32+0.01;
 if (q32>1)
 {
  q32 = 1;
 }
  q31 = q31+0.01;
   if (q31>1)
 {
  q31 = 1;
 }
  q23 = q23 +0.01;
  if (q23>1)
 {
  q23 = 1;
 }
 q14 = q14+1;
 q24 = q24+1;
 q34 = q34+1;
 delay(100);
}
