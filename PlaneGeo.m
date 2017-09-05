% Make a triangle
close all
clear all
V1 = [0 0]
V2 = [1 0]
V3 = [0 2]

plot([V1(1) V2(1) V3(1) V1(1)], [V1(2) V2(2) V3(2) V1(2)],'r-o')
hold on
% basis function associated with node 1

Plane_Mat = [V1(1) V1(2) 1; V2(1) V2(2) 1; V3(1) V3(2) 1];
RHS = [0 1 0]';

abc = Plane_Mat\RHS;

a = abc(1);
b = abc(2);
c = abc(3);

for(x=0:0.1:1)
    for(y=0:0.1:(2-2*x))
        z = a*x + b*y + c;
        plot3(x, y, z,'x')
        
    end
end

% slope of basis function
Centroid = (V1+V2+V3)/3;

quiver(Centroid(1), Centroid(2), a, b)