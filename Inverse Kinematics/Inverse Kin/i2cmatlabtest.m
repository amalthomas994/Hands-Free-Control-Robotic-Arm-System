a = arduino();
tmp102 = i2cdev(a, '0x69')
 write(tmp102, 0, 'uint16');
   data = read(tmp102, 3, 'uint16');
   temperature = (double(bitshift(int16(data(1)), 4)) + double(bitshift(int16(data(2)), -4))) * 0.0625
   clear all