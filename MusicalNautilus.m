clear all
close all
 
F0 = [16.352;30.868;29.135;27.5;25.957;24.5;23.125;21.827;20.602;19.445;18.354;17.324]; %Fundamental frequencies in Hz.
%Let's create an angle vector ;)
theta=[0;30;60;90;120;150;180;210;240;270;300;330] %; adding this would only remove it from the view.

counter = 1;

A = zeros(12,9) %Sticking to more rows of information than columns. Could this be extended to material properties? :D

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

%When you are playing with the regular orthogonal world, the views we obtain of certain relationships are rather... rectangular.

%plotting the first column vector:
plot(A(1:12,1)')
xlabel('First Octave') % x-axis label
ylabel('Frequency Values for All Pitches') % y-axis label

%plotting the first row vector:
plot(A(1,1:9)')
xlabel('C scale') % x-axis label
ylabel('Frequency Values for All Octaves') % y-axis label

%This part was from the original Circular Discretization file:
%By acknowledging Pythagoras, and having an amazing professor in Numerical Methods that gets whatever you've been thinking...
%You convert into a more... polar coordinate system.

%for(r = 0:1:8)
    %for(angle = 0:30:360)
        %x(counter) = r*cosd(angle);
        %y(counter) = r*sind(angle);
        %counter = counter + 1;
    %end
%end

%These seem fancy... (They belong to delaunay though. Right?)
Connectivity = delaunay(x,y);
Vertices = [x',y']

%The interesting part of applying that idea to the concepts of scalars, vectors and matrices, a little bit of calculus III 
%and I guess some ingenuity and passion for somethings...
%voi-la.. a Musical Nautilus comes to life.

figure
trisurf(Connectivity, x,y,x*0)
title('Graph of Frequency for All Octaves')
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label

%Up next I'm thinking, what if the Z axis could represent the frequencies played through a guitar riff?
