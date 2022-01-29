function trans_ind = transformCalculate(parameter)


 d     = parameter(1); %coloum 1
 theta = parameter(2); %coloum 2
 r     = parameter(3); %coloum 3
 alpha = parameter(4); %coloum 4
 
 
trans_ind = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), r*cos(theta);
             sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), r*sin(theta);
                 0     ,         sin(alpha)    ,       cos(alpha)      ,     d       ;
                 0     ,            0          ,           0           ,     1       ];
end

