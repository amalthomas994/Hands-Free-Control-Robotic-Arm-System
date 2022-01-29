arduino = serial('COM4', 'BaudRate', 9600);
fopen(arduino);
while(1)
x = 1;
y = 2;
fprintf(arduino, '%c', num2str(x));
pause(1)
fprintf(arduino, '%c',num2str(y));
pause(1)
end