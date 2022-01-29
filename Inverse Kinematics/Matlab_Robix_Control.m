%%Create Arduino Object
a = arduino('COM6', 'Uno', 'Libraries','Servo'); %Arduino Object

%% Servo Definitions
%s6 = servo(a, 'D7', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
%s5 = servo(a, 'D8', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s4 = servo(a, 'D9', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s3 = servo(a, 'D10', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s2 = servo(a, 'D11', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
s1 = servo(a, 'D12', 'MinPulseDuration', 900*10^-6, 'MaxPulseDuration', 2100*10^-6);
configurePin(a, 'D5', 'pullup'); %To read switch

%% DH Parameters
parameters = [15.0  00  7.5  0.00;
              0.00  00  9.5  pi/2;
              0.00  00  5.8  0.00;
             -1.00  00  0.0  pi/2;
              4.00  00  0.0  0.00];

%% Inverse Kinematics Calculations
while(1)
% Analog Inputs A0, A1, A2 = Accelerometer Values X, Y, Z
    aax = a.readVoltage(0); %X-Axis
    aay = a.readVoltage(1); %Y-Axis
    aaz = a.readVoltage(2); %Z-Axis
% %Gripper Open/Close
%     grip = readDigitalPin(a, 'D5'); %Read Diigital Pin D5 (Press = Close, Release = Open)
%     
    coordinatesVoltage = [aax aay aaz]; %Display Voltage Values Read From Analog Pins
%     
% %% Linear Mapping of Voltage Values to Coordinate Values
% 
%     %Slopes
    mx = (35-5)/(4.2-0.8); %X Slope
    my = (40+40)/(4.5-0.5); %Y Slope
    mz = (45)/(4.2-0.8); %Z Slope
%     %B Values
    bx = (35-(mx*4.5)); %X, b Value
    by = (40-(my*4.5)); %Y, b Value
    bz = (45-(mz*4.5)); %Z, b Value
    %Linear Equations
    ax = (mx*aax)+ bx; %X Voltage Gets Mapped from 0-5 V to +10 to +35 cm
    ay = (my*aay)+ by; %Y Voltage Gets Mapped from 0-5 V to -40 to +40 cm
    az = (mz*aaz)+ bz; %Z Voltage Gets Mapped from 0-5 V to   0 to +45 cm

%% Limiting Coordinate Values
%     if (ax> 31)
%     az = 20;
%     end
    
%% Joint Parameters Calculation

    e = [ax;ay;az]; %Desired Spatial Coordinates of End Effector
    coordinates = e' %Display Desired Coordinates
   tooLong = 0; 
   tic,
    parameters_inv = inverseKinematics(e,parameters); %Inverse Kinematics Calculation Function
   
   if (toc>3.5)
   tooLong = 1;
   end
    while (tooLong == 1)
    disp('Coordinates Not Reachable');
    tooLong = 0;
    end
    x1 = parameters_inv(1,2);        %Joint 1 Angle
    x2 = parameters_inv(2,2);        %Joint 2 Angle
    x3 = parameters_inv(3,2);        %Joint 3 Angle
    x4 = parameters_inv(4,2)+(pi/2); %Joint 4 Angle
    %x5 = parameters_inv(5,2);        %Joint 5 Angle
    
%% Linear Mapping of Joint Angles to Servo Parameters from (-pi/2 to pi/2) to (0 to 1)
    
    m = 1/pi; %Slope
    b = 1-(1/pi)*(pi/2); %B Value
    
    %Linear Equations
    y1 = m*x1 + b;
    y2 = m*x2 + b;
    y3 = m*x3 + b;
    y4 = m*x4 + b;
    %y5 = m*x5 + b;
    
    
    %Choose Above for (-pi/2 to pi/2)
    %Choose Below for (-pi to pi)
    
%% Linear Mapping of Joint Angles to Servo Parameters from (-pi to pi) to (0 to 1)
    
    %{

    m = 1/(2*pi);   %Slope
    b = 1-(m*(pi)); %B Value
    
    %Linear Equations
    y1 = m*x1 + b;
    y2 = m*x2 + b;
    y3 = m*x3 + b;
    y4 = m*x4 + b;
    y5 = m*x5 + b;

    %}

%% Max/Min Conditions
    
    %Joint 1
    if(y1>1)
        y1 = 1;
    end
    
    if(y1<0)
        y1 = 0;
    end
    
    %Joint 2
    if(y2>1)
        y2 = 1;
    end
    
    if(y2<0)
        y2 = 0;
    end
    
    %Joint 3
    if(y3>1)
        y3 = 1;
    end
    
    if(y3<0)
        y3 = 0;
    end
    
    %Joint 4
    if(y4>1)
        y4 = 1;
    end
    
    if(y4<0)
        y4 = 0;
    end
    
%     %Joint 5
%     if(y5>1)
%         y5 = 1;
%     end
%     
%     if(y5<0)
%         y5 = 0;
%     end
    
    %Joint 6
%     y6 = grip;
%     if (y6 >= 1)
%         y6=0;
%     else
%         y6 = 1;
%     end
    
%% Write Joint Parameters to Servo Objects
    Servo_Parameters = [y1 y2 y3 y4]; %Display Final Servo Parameters
    writePosition(s1, y1); %Servo 1
    writePosition(s2, y2); %Servo 2
    writePosition(s3, y3); %Servo 3
    writePosition(s4, y4); %Servo 4
    %writePosition(s5, y5); %Servo 5
    %writePosition(s6, y6); %Servo 6
    
end
%% Close Arduino Object
fclose(arduino);
fclose(instrfindall);
delete(instrfindall);
