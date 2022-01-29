
parameters = [13.80  0  11.20  0.00;
              000.0  0  9.000  pi/2;
              000.0  0  5.900  0.00;
              -5.00  0  0.000  pi/2];
          
ex=input('ex = ');
ey=input('ey = ');
ez=input('ez = ');

e = [ex;ey;ez];
parameters_inv = inverseKinematics(e,parameters)
x1 = parameters_inv(1,2);
x2 = parameters_inv(2,2);
x3 = parameters_inv(3,2);
x4 = parameters_inv(4,2);
x5 = 0.5;
x6 = 0.5;

b = arduino();
clear a
clear s1 s2 s3 s4 s5 s6

% x1 = -1.6479;
% x2 = -1.3857;
% x3 = -1.5658;
% x4 = 0;

angle1 = ((1/(2*pi))*x1)+(1/2);
angle2 = ((1/(2*pi))*x2)+(1/2);
angle3 = ((1/(2*pi))*x3)+(1/2);
angle4 = ((1/(2*pi))*x4)+(1/2);
angle5 = x5;
angle6 = x6;

angle = [angle1 angle2 angle3 angle4 angle5 angle6];
disp(angle);


s1 = servo(b, 'D12', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s2 = servo(b, 'D11', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s3 = servo(b, 'D10', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s4 = servo(b, 'D9', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s5 = servo(b, 'D8', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s6 = servo(b, 'D7', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);


writePosition(s1, angle1);
writePosition(s2, angle2);
writePosition(s3, angle3);
writePosition(s4, angle4);
writePosition(s5, angle5);
writePosition(s6, angle6);


