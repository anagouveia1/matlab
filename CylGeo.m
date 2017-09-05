%CylindricalDiscretization:

clear all
counter = 1;

for(Z = 0.05:0.05:1)
    for(r = 0.05:0.05:1)
        for(theta = 0:5:355)
            x(counter) = r*cosd(theta);
            y(counter) = r*sind(theta);
            z(counter) = Z
            counter = counter + 1;
        end
    end
end

%Set up connectivity=viewglobalorlocal

%New 3D:
Connectivity = delaunay(x,y,z);
Vertices =  [x',y',z']

%3D STRUCTURE MADE UP OF PLANES
figure
trisurf(Connectivity, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%Previous 2D:

%PLANE XY
Connectivity1 = delaunay(x,y);
Vertices1 = [x',y']

figure
trisurf(Connectivity1, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label


%PLANE XZ
Connectivity2 = delaunay(x,z);
Vertice2 = [x',z']

figure
trisurf(Connectivity2, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%PLANE YZ
Connectivity3 = delaunay(y,z);
Vertices3 = [y',z']

figure
trisurf(Connectivity2, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label
