clear all
close all
 
F0 = [16.352;30.868;29.135;27.5;25.957;24.5;23.125;21.827;20.602;19.445;18.354;17.324];
%Let's create an angle vector ;)
theta=[0;30;60;90;120;150;180;210;240;270;300;330]

counter = 1;

A = zeros(12,9)

%for pitch = 1 : size(Fundamentals) ?What's wrong with this syntax?
for octave = 0 : 8
    for pitch = 1 : 12
        F(pitch) = 2^(octave)*F0(pitch)
        A(pitch,octave+1) = F(pitch)
        x(counter) = F(pitch)*cosd(theta(pitch));
        y(counter) = F(pitch)*sind(theta(pitch));
        counter = counter + 1;
    end
end

%plotting the first column vector:
plot(A(1:12,1)')
xlabel('First Octave') % x-axis label
ylabel('Frequency Values for All Pitches') % y-axis label

%plotting the first row vector:
plot(A(1,1:9)')
xlabel('C scale') % x-axis label
ylabel('Frequency Values for All Octaves') % y-axis label

%for(r = 0:1:8)
    %for(angle = 0:30:360)
        %x(counter) = r*cosd(angle);
        %y(counter) = r*sind(angle);
        %counter = counter + 1;
    %end
%end

Connectivity = delaunay(x,y);
Vertices = [x',y']

figure
trisurf(Connectivity, x,y,x*0)
title('Graph of Frequency for All Octaves')
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label