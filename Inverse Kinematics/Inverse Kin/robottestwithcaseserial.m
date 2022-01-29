arduino = serial('COM4', 'BaudRate', 9600);
fopen(arduino);
x=0;
while(1)
    x=10;
    xstr = ['3/2/11/' num2str(x) '/']
    fprintf(arduino,'%s' ,xstr);
    pause(0.001)
    x=50;
    ystr = ['3/2/10/' num2str(x) '/']
    fprintf(arduino,'%s' ,ystr);
    pause(0.5)
    x=90;
    xstr = ['3/2/11/' num2str(x) '/']
    fprintf(arduino,'%s' ,xstr);
    pause(0.001)
    x=12;
    ystr = ['3/2/10/' num2str(x) '/']
    fprintf(arduino,'%s' ,ystr);
    pause(0.5)
    
end
% while(x>0)
%   
%    xzstr = ['3/2/7/' num2str(x) '/'];
%     fprintf(arduino,xzstr);
%     pause(0.001)
%     yzstr = ['3/2/6/' num2str(x) '/'];
%     fprintf(arduino,yzstr);
%     x = x-1;
%     pause(0.001)
% end
pause(0.5)