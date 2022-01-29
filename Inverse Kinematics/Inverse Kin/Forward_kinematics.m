function [e,Transform] = Forward_kinematics(parameters)

%         This code finds a transform matrix from the given prameters     %
%                    in the notation of DH matrix                         %
% input vector                                                            %
%       theta = transpose[theta1, theta2,...., thetaM];                   %
%       M = number of motors used = no.of joints                          %
% output vector                                                           %
%       e = transpose[ex,ey,ez];  ex,ey,ez = dimesnion of the end effector
%-------------------------------------------------------------------------%
%--------------------Copyright (c) 2015, sai kumar---Rank: 7028-----------%
%--------------------------All rights reserved.---------------------------%

joints = length(parameters(:,1));
dimension = 3;
Transform = eye(dimension + 1,dimension + 1);
    for i = 1:joints
        Transform = Transform * transformCalculate(parameters(i,:));
    end
e_homogenous = Transform*[0;0;0;1];
e = e_homogenous(1:3,1);
end