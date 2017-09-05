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
end

Connectivity0 = delaunay(x,y,z);
Connectivity = delaunay(x,y);
Connectivity1 = delaunay(x,z);
Connectivity2 = delaunay(y,z);

Vertices0 = [x',y',z']
Vertices = [x',y']
Vertice1 = [x',z']
Vertices2 = [y',z']

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%3D STRUCTURE MADE UP OF PLANES
figure
trisurf(Connectivity0, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

figure
trisurf(Connectivity, x,y,x*0)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%PLANE XY
figure
trisurf(Connectivity, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%PLANE XZ
figure
trisurf(Connectivity1, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%PLANE YZ
figure
trisurf(Connectivity2, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label