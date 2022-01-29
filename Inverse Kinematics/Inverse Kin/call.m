clear b s1 s2 s3 s4 s5 s6
parameters = [15.0  0  8.0  0.00;
              0.00  0  9.5  pi/2;
              0.00  0  9.5  0.00;
             -1.00  0  0.0  pi/2;
              4.5   0  0.0  0.00];
arduino=serial('COM4','BaudRate',9600); % create serial communication object on port COM4
fopen(arduino); % initiate arduino communication

while (1)
% ex=input('ex = ');
% ey=input('ey = ');
% ez=input('ez = ');
%     data = fscanf(arduino);
%     String = char(data);
%     newString = regexp(String, '\s', 'split');
%     ex = str2double(newString(1,1));
%     ey = str2double(newString(1,2));
%     ez = str2double(newString(1,3));
    %e = [ex;ey;ez];
    e = [10;10;10];
    disp(e')

parameters_inv = inverseKinematics(e,parameters);
x1 = parameters_inv(1,2)*(180/pi); %from -pi to pi - map to 0 to 180
x2 = parameters_inv(2,2)*(180/pi);
x3 = parameters_inv(3,2)*(180/pi);
x4 = parameters_inv(4,2)*(180/pi);
x5 = 0.5*(180/pi);
x6 = 0.1*(180/pi);

x1 = round(x1,1);
x2 = round(x2,1);
x3 = round(x3,1);
x4 = round(x4,1);
x5 = round(x5,1);
x6 = round(x6,1);
final_rotation = [x1 x2 x3 x4 x5 x6]
    pause(0.1)
    fprintf(arduino,'%d',x1);
    disp('Sent x1');
    pause(0.1);
    fprintf(arduino,'%d',x2);
    disp('Sent x2');
    pause(0.1);
    fprintf(arduino,'%d',x3);disp('Sent x3');
    pause(0.1);
    fprintf(arduino,'%d',x4);disp('Sent x4');
    pause(0.1);
    fprintf(arduino,'%d',x5);disp('Sent x5');
    pause(0.1);
    fprintf(arduino,'%d',x6);disp('Sent x6');% send answer variable content to arduino
    pause(0.1);
    disp('End');
    
end
    
 
fclose(arduino); % end communication with arduino
fclose(instrfindall);
delete(instrfindall);
% 
% % matlabarduino1(x1, x2, x3, x4, x5, x6);