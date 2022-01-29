arduino = serial('COM4', 'BaudRate', 9600);
fopen(arduino);
while(1)
    data = fscanf(arduino);
    String = char(data);
    newString = regexp(String, '\s', 'split');
    x = str2double(newString(1,1));
    y = str2double(newString(1,2));
    z = str2double(newString(1,3));
    mat = [x y z]
%     for i=1:3
        fprintf(arduino, '%d',x);
        disp(['Sent ',x]);
        pause(0.5)
        fprintf(arduino, '%d',y);
        disp(['Sent ',y]);
        pause(0.5)
        fprintf(arduino, '%d',z);
        disp(['Sent ',z]);
        pause(0.5)
%     end
end
fclose(arduino); 
fclose(instrfindall);
delete(instrfindall);