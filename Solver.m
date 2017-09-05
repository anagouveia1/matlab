% Finmite elements on our circle


% discretizing the domain
Vertices 
Connectivity


NNodes = length(Vertices);
NElem = length(Connectivity);

% Initialize A and f
A = zeros(NNodes, NNodes);%spalloc(NNodes, NNodes,6*NNodes);
F = zeros(1, NNodes)

% Setup the A-matrix & RHS
for(i=1:NElem)
        % Figure out what the triangle is!!!!!
        ConnectedNodes = Connectivity(i,:);
        
        V1 = Vertices(ConnectedNodes(1),:);
        V2 = Vertices(ConnectedNodes(2),:);
        V3 = Vertices(ConnectedNodes(3),:);
        
        plot([V1(1) V2(1) V3(1) V1(1)], [V1(2) V2(2) V3(2) V1(2)],'r-o')
       legend('x = sin(x)','y = cos(x)','Location','southwest')
        %pause
        hold on
        
       % First calculate the area -- Oh No!!!!!!!!!!!!!!!!!!!!!
       L1 = [V2-V1,0];
       L2 = [V3-V1,0];
       Area = norm(1/2*cross( L1, L2));
       
       % Solve the matrix of basis function nodes
       Plane_Mat = [V1(1) V1(2) 1; V2(1) V2(2) 1; V3(1) V3(2) 1];
        RHS1 = [1 0 0]';
        RHS2 = [0 1 0]';
        RHS3 = [0 0 1]';

        abc1 = Plane_Mat\RHS1;
        abc2 = Plane_Mat\RHS2;
        abc3 = Plane_Mat\RHS3;

        a1 = abc1(1);
        b1 = abc1(2);
        c1 = abc1(3);

        a2 = abc2(1);
        b2 = abc2(2);
        c2 = abc2(3);

        a3 = abc3(1);
        b3 = abc3(2);
        c3 = abc3(3);

        % Interactions between basis functions (gradient * gradient) OH
       % NO!!!!!!!!!!!!!
        ElementMatrix = Area*[a1*a1 + b1*b1  a2*a1 + b2*b1  a3*a1 + b3*b1;    
                           a1*a2 + b1*b2  a2*a2 + b2*b2  a3*a2 + b3*b2; 
                           a1*a3 + b1*b3  a2*a3 + b2*b3  a3*a3 + b3*b3]; 
       
        CN = ConnectedNodes;
        A(CN(1),CN(1)) = A(CN(1),CN(1))  + ElementMatrix(1,1);                
        A(CN(1),CN(2)) = A(CN(1),CN(2))  + ElementMatrix(1,2);                
        A(CN(1),CN(3)) = A(CN(1),CN(3))  + ElementMatrix(1,3);                

        A(CN(2),CN(1))  = A(CN(2),CN(1))  + ElementMatrix(2,1);                
        A(CN(2),CN(2))  = A(CN(2),CN(2))  + ElementMatrix(2,2);                
        A(CN(2),CN(3))  = A(CN(2),CN(3))  + ElementMatrix(2,3);                

        A(CN(3),CN(1))  = A(CN(3),CN(1))  + ElementMatrix(3,1);                
        A(CN(3),CN(2))  = A(CN(3),CN(2))  + ElementMatrix(3,2);                
        A(CN(3),CN(3))  = A(CN(3),CN(3))  + ElementMatrix(3,3);                

        F(CN(1)) = F(CN(1))+Area/3; 
        F(CN(2)) = F(CN(2))+Area/3;
        F(CN(3)) = F(CN(3))+Area/3;
end

% Boundary conditions
for(i = 1:NNodes)
    V1 = Vertices(i,1);
    V2 = Vertices(i,2);
    
    if( (V1^2 + V2^2)>.99) 
        A(i,:) = 0;
        A(i,i) = 1;
        F(i) = 0;
    end
    
%      if( (V1^2 + V2^2)<0.06) & (V1>0.95|V1<-0.95|V2>0.95|V2<-0.95))
%         A(i,:) = 0;
%         A(i,i) = 1;
%         F(i) = 0;
%      end
     
end

Solution = A\-F';

figure 
trisurf(Connectivity, Vertices(:,1), Vertices(:,2), Solution)
xlabel('x-axis') % x-axis label
ylabel('y-axis') % y-axis label
zlabel('z-axis') % z-axis label