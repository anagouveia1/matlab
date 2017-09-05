%SquareDiscretization:

clear all
counter = 1;

for(x = 0.05:0.05:1)
    for(y = 0.05:0.05:1)
        x(counter) = x;
        y(counter) = y;
        counter = counter + 1;
    end
end

Connectivity = delaunay(x,y);
Vertices = [x',y']

figure
trisurf(Connectivity, x,y,x*0)
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label