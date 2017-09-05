% Making a prism:
close all
clear all
 
%coordinates (add unit)
x = 1
y = 1
z = 1
 
%setting up outer boundary vertices vectors
V1 = [0 0 0]
V2 = [x 0 0]
V3 = [0 y 0]
V4 = [0 0 z]
 
plot3([V1(1) V2(1) V3(1) V1(1)], [V1(2) V2(2) V3(2) V4(2) V1(2)], [V1(3) V2(3) V3(3) V4(3) V1(3)],'g-o')
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

hold on

%plot3(x, y, z,'x')