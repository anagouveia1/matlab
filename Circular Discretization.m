%CircularDiscretization:

clear all
counter = 1;

for(r = 0.05:0.05:1)
    for(theta = 0:5:355)
        x(counter) = r*cosd(theta);
        y(counter) = r*sind(theta);
        counter = counter + 1;
    end
end

Connectivity = delaunay(x,y);
Vertices = [x',y']

figure
trisurf(Connectivity, x,y,x*0)