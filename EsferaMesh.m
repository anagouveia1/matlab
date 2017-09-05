%CylindricalDiscretization:

clear all
counter = 1;

for(ro = 0.5:0.5:1)
    for(theta = 0:5:355)
        for(omega = 0:5:355)
            
            %General Mathematics:
            %r = (x^2+y^2)^(0.5);
            %ro = (z^2+r^2)^(0.5);
            %theta = 
            %omega =
           
            x(counter) = ro*sind(omega)*cosd(theta);
            y(counter) = ro*sind(omega)*sind(theta);
            z(counter) = ro*cosd(theta);
            
            counter = counter + 1;
        end
    end
end

%Set up connectivity=viewglobalorlocal

%New 3D:
Connectivity = delaunay(x,y,z);
Vertices =  [x',y',z']

%Something Else
figure
tetramesh(Connectivity,Vertices)
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label