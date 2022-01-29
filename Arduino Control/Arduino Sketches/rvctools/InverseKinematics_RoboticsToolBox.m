startup_rvc
L(1) = Link([0 0.150 0.075 0.00]);
L(2) = Link([0 0.000 0.095 pi/2]);
L(3) = Link([0 0.000 0.058 0.00]);
L(4) = Link([0 -0.01 0.000 pi/2]);
L(5) = Link([0 0.040 0.000 0.00]);
L(6) = Link([0 0.000 0.000 0.00]);
L(1).qlim = [-45 45]*pi/180;
L(2).qlim = [-90 90]*pi/180;
L(3).qlim = [-90 90]*pi/180;
L(4).qlim = [-90 90]*pi/180;
L(5).qlim = [-90 90]*pi/180;
L(6).qlim = [-90 90]*pi/180;
robot = SerialLink(L);
robot.plot([pi/2,pi/4,pi/3,-pi/2,pi/2,0])
% a = arduino('COM4', 'Uno', 'Libraries', 'I2C', 'Libraries','Servo');
% configurePin(a,'D6','pullup');
% s6 = servo(a, 'D7', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
% s5 = servo(a, 'D8', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
% s4 = servo(a, 'D9', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
% s3 = servo(a, 'D10', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
% s2 = servo(a, 'D11', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
% s1 = servo(a, 'D12', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
% q = [0 pi/4 pi/8 pi/3 pi/2 0]
% T = robot.fkine(q)
%while(1)
%     x = a.readVoltage(0);
%     y = a.readVoltage(1);  
%     z = a.readDigitalPin(6);
x = 0.33;
y = 0.1;
z = 0.15;
T =[1    0    0    x;
    0    1    0   y;
    0    0    1   z;
    0    0    0    1.0000];
qi = robot.ikine(T, 'pinv');

x1 = qi(1)*(180/pi);
x2 = qi(2)*(180/pi);
x3 = qi(3)*(180/pi);
x4 = qi(4)*(180/pi)+90;
x5 = qi(5)*(180/pi);
x6 = qi(6)*(180/pi);
angles = [x1 x2 x3 x4 x5 x6]
% 
% writePosition(s1, x1);
% writePosition(s2, x2);
% writePosition(s3, x3);
% writePosition(s4, x4);
% writePosition(s5, x5);
% writePosition(s6, x6);
%end
% T2 = robot.fkine(qi)