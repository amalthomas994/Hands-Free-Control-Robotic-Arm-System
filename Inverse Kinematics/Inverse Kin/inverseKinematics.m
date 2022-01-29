function [parameters] = inverseKinematics(e,parameters)

%This code caliculates a inverse transform matrix from the given prameters%
% input vector                                                            %
%       e = transpose[ex,ey,ez];  ex,ey,ez = dimesnion of the end effector%
%-------------------------------------------------------------------------%
%--------------------Copyright (c) 2015, sai kumar---Rank: 7028-----------%
%--------------------------All rights reserved.---------------------------%

%---------------------------INVERSE KINEMATICS----------------------------% 

%% give the initial teeta values
parameters(:,2) = [0;0;0;0;0];

%% few more initial values
lambda = 100; 
dimension = length(e);

% run the loop till the end effector is very close to the final position...
% provided
initial_position = e;
intended_position = e;
final_position = Forward_kinematics(parameters);
iter = 0;
while(sqrt((initial_position-final_position)'*(initial_position-final_position)) >1e-6)

%% finding the initial jacobian matrix
Jacobian = zeros(3,length(parameters(:,1)));
joints = length(parameters(:,1));
parameters_new = parameters;

for i = 1:joints
    parameters_new(i,2) = parameters(i,2) - 0.01;
    Jacobian(:,i) =  (Forward_kinematics(parameters) - Forward_kinematics(parameters_new))/0.01;
    parameters_new = parameters;
end

%% updating theta

J = Jacobian;
parameters(:,2) = parameters(:,2) + J' * ((J*J' + lambda*eye(dimension))\(intended_position -Forward_kinematics(parameters)));

%% calculating the final position

initial_position = final_position;
final_position = Forward_kinematics(parameters);

%% iteration count

iter = iter +1;
sqrt((intended_position-final_position)'*(intended_position-final_position));
%sqrt((initial_position-final_position)'*(initial_position-final_position))
end
end
