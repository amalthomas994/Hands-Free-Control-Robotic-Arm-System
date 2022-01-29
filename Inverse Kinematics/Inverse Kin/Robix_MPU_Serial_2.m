arduino = serial('COM4', 'BaudRate', 9600);
fopen(arduino);
parameters = [15.0  00  7.5  0.00;
              0.00  00  9.5  pi/2;
              0.00  00  5.8  0.00;
             -1.00  00  0.0  pi/2;
              4.00  00  0.0  0.00];
          continue12 = 1; 
while(continue12)

%     data = fscanf(arduino);
%     String = char(data);
%     newString = regexp(String, '\s', 'split');
%     x = str2double(newString(1,1));
%     y = str2double(newString(1,2));
%     z = str2double(newString(1,3));
%     mat = [x y z]

x = input('x:')
y = input('y:')
z = input('z:')
e = [x;y;z];
ee = e'

parameters_inv = inverseKinematics(e,parameters);
x1 = parameters_inv(1,2);
x2 = parameters_inv(2,2);
x3 = parameters_inv(3,2);
x4 = parameters_inv(4,2)+(pi/2);
x5 = parameters_inv(5,2);

m = 180/(2*pi);
b = 180 - (180*pi)/(2*pi);
x1 = (m*x1)+(b);
x2 = (m*x2)+(b);
x3 = (m*x3)+(b);
x4 = (m*x4)+(b);
x5 = (m*x5)+(b);

x1 = uint8(x1);
x2 = uint8(x2);
x3 = uint8(x3);
x4 = uint8(x4);
x5 = uint8(x5);

%servo = [x1 x2 x3 x4 x5]
    
    x1str = ['3/2/12/' num2str(x1) '/']
    fprintf(arduino,'%s' ,x1str);
    pause(0.001)
    
    x2str = ['3/2/11/' num2str(x2) '/']
    fprintf(arduino,'%s' ,x2str);
    pause(0.001)
    
    x3str = ['3/2/10/' num2str(x3) '/']
    fprintf(arduino,'%s' ,x3str);
    pause(0.001)
    
    x4str = ['3/2/9/' num2str(x4) '/']
    fprintf(arduino,'%s' ,x4str);
    pause(0.001)
    
    x5str = ['3/2/8/' num2str(x5) '/']
    fprintf(arduino,'%s' ,x5str);
    pause(0.001)
    x6 = 0;
    x6str = ['3/2/7/' num2str(x6) '/']
    fprintf(arduino,'%s' ,x6str);
    pause(0.5)
    


end

fclose(arduino); 
fclose(instrfindall);
delete(instrfindall);
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