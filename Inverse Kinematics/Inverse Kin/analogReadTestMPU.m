a = arduino('COM6', 'Uno', 'Libraries', 'I2C', 'Libraries','Servo');
while(1)
   x = readVoltage(a, 'A0')
   pause(0.1)
%    y = readVoltage(a, 'A1');
%    
%    z = readVoltage(a, 'A2');
%    
%    value = [x y z]
end