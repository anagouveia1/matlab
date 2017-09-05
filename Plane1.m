% Make a triangle
close all
clear all

%coordinates (add unit)
x = 1
y = 2

%setting up outter boundary vertices vectors
V1 = [0 0]
V2 = [x 0]
V3 = [0 y]


plot([V1(1) V2(1) V3(1)], [V1(2) V2(2) V3(2)],'g-o')
hold on