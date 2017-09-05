%RectangularDiscretization:

clear all
counter = 1;

for(X = 0.05:0.05:1)
    for(Y = 0.05:0.05:1)
        for(Z = 0.05:0.05:1)
        x(counter) = X;
        y(counter) = Y;
        z(counter) = Z;
        counter = counter + 1;
    end
end

Connectivity = delaunay(x,y);
Connectivity2 = delaunay(x,y,z);

Vertices = [x',y']
Vertice2 = [x',z']
Vertices3 = [y',z']

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

figure
trisurf(Connectivity, x,y,x*0)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

figure
trisurf(Connectivity, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

figure
trisurf(Connectivity2, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label