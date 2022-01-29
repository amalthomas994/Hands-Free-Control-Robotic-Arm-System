a = arduino('COM6', 'Uno', 'Libraries', 'I2C', 'Libraries','Servo');
s6 = servo(a, 'D7', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s5 = servo(a, 'D8', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s4 = servo(a, 'D9', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s3 = servo(a, 'D10', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);

s2 = servo(a, 'D11', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s1 = servo(a, 'D12', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
parameters = [15.0  00  7.5  0.00;
              0.00  00  9.5  pi/2;
              0.00  00  5.8  0.00;
             -1.00  00  0.0  pi/2;
              4.00  00  0.0  0.00];
          configurePin(a, 'D5', 'pullup');
while(1)

aax = a.readVoltage(0);
aay = a.readVoltage(1);
aaz = a.readVoltage(2);
grip = readDigitalPin(a, 'D5');
% aax = input('x:');
% aay = input('y:');
% aaz = input('z:');
% accelerometerValues = [aax aay aaz]
% %Slopes
 mx = (31-10)/(5-0); my = (40+40)/(5-0); mz = (0-45)/(5-0);
 ax = (mx*aax)+(31-(mx*5));
 ay = (my*aay)+(40-(my*5));
 az = (mz*aaz)+(00-(mz*5));

e = [ax;ay;az];
ee = e'

parameters_inv = inverseKinematics(e,parameters);
m = 1/pi;
b = 1-(1/pi)*(pi/2);
x1 = parameters_inv(1,2);
x2 = parameters_inv(2,2);
x3 = parameters_inv(3,2);
x4 = parameters_inv(4,2)+(pi/2);
x5 = parameters_inv(5,2);
y1 = m*x1 + b;
y2 = m*x2 + b;
y3 = m*x3 + b;
y4 = m*x4 + b;
y5 = m*x5 + b;

y6 = grip;
if (y6 >= 1)
y6=0;
else 
y6 = 1;
end
if(y1>1)
    y1 = 1;
end
if(y1<0)
    y1 = 0;
end
if(y2>1)
    y2 = 1;
end
if(y2<0)
    y2 = 0;
end
if(y3>1)
    y3 = 1;
end
if(y3<0)
    y3 = 0;
end
if(y4>1)
    y4 = 1;
end
if(y4<0)
    y4 = 0;
end
if(y5>1)
    y5 = 1;
end
if(y5<0)
    y5 = 0;
end

yyy = [y1 y2 y3 y4 y5 y6]
writePosition(s1, y1);
writePosition(s2, y2);
writePosition(s3, y3);
writePosition(s4, y4);
writePosition(s5, y5);
writePosition(s6, y6);

end


%      
%      while(1)     
%     x = a.readVoltage(0);
%     y = a.readVoltage(1);  
%     z = a.readDigitalPin(6);
%     ex = (11.6*x)-29;
%     ey = (11.6*y)-29;
%     ez = (1*z)-15;
%     e = [ex;ey;ez];
%     disp(e');
% 
% parameters_inv = inverseKinematics(e,parameters);
% x1 = (((1-0)/(pi+pi))*parameters_inv(1,2))+(((pi*0)-(-pi*1))/(pi+pi)); %from -pi to pi - map to 0 to 180
% x2 = (((1-0)/(pi+pi))*parameters_inv(2,2))+(((pi*0)-(-pi*1))/(pi+pi));
% x3 = (((1-0)/(pi+pi))*parameters_inv(3,2))+(((pi*0)-(-pi*1))/(pi+pi));
% x4 = (((1-0)/(pi+pi))*parameters_inv(4,2))+(((pi*0)-(-pi*1))/(pi+pi));
% x5 = ((((1-0)/(pi+pi))*parameters_inv(5,2))+(((pi*0)-(-pi*1))/(pi+pi)));
% x6 = ((((1-0)/(pi+pi))*0.5)+(((pi*0)-(-pi*1))/(pi+pi)));
% final_rotation = [x1 x2 x3 x4 x5 x6]
% 
% if (x1 > 1)
%    x1 = 1; 
% end
% 
% if (x2 > 1)
%    x2 = 1; 
% end
% 
% if (x3 > 1)
%    x3 = 1; 
% end
% 
% if (x4 > 1)
%    x4 = 1; 
% end
% 
% if (x5 > 1)
%    x5 = 1; 
% end
% 
% if (x1 < 0)
%    x1 = 0; 
% end
% if (x2 < 0)
%    x2 = 0; 
% end
% 
% if (x3 < 0)
%    x3 = 0; 
% end
% 
% if (x4 < 0)
%    x4 = 0; 
% end
% 
% if (x5 < 0)
%    x5 = 0; 
% end
% 
% 
% 
% 
% writePosition(s1, x1);
% writePosition(s2, x2);
% writePosition(s3, x3);
% writePosition(s4, x4);
% writePosition(s5, x5);
% writePosition(s6, x6);
%      end
% clear a
% s6 = servo(a, 'D7');
% s5 = servo(a, 'D8');
% s4 = servo(a, 'D9');
% s3 = servo(a, 'D10');
% s2 = servo(a, 'D11');
% s1 = servo(a, 'D12');