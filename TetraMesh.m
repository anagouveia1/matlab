%CylindricalDiscretization:

clear all
counter = 1;

for(Z = 0.025:0.5:1)
    for(r = 0.025:0.5:1)
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

%3D STRUCTURE MADE UP OF PLANES SO CRAPY COMPARED TO THE OTHER
%figure
%trisurf(Connectivity, x,y,z)

xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%Something Else
figure
tetramesh(Connectivity,Vertices)
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label