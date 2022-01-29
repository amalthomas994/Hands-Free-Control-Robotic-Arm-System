function [e,Transform] = Forward_kinematics(parameters)


joints = length(parameters(:,1));
dimension = 3;
Transform = eye(dimension + 1,dimension + 1);
    for i = 1:joints
        Transform = Transform * transformCalculate(parameters(i,:));
    end
e_homogenous = Transform*[0;0;0;1];
e = e_homogenous(1:3,1);
end