function [A, b]=Lap2D(m)
%input: no. of grid points of x direction
%output:-ve laplacian sparse matrix 2d, m^2-m^2 matrix
%b = RHS

h=1/(m+1);
I = speye(m,m);
E=spdiags([-ones(m,1) 4*ones(m,1), -ones(m,1)],-1:1,m,m);
D =kron(I,E); % gives the main diagonal block matrix

B=spdiags(ones(m,1),1,m,m);
B=kron(B,I); 
B=-B; % gives the off diagonal block matrices

A=D+B+B';
A=(1/h^2)*A;

%computes the RHS
x=zeros(m,1);
for i=1:m
    x(i)=i*h;
end
y=x;
f=zeros(m^2,1);
for i=1:m
    for j=1:m
        if (norm([x(i),y(j)]-[0.3 0.3])<=0.1)||(norm([x(i),y(j)]-[0.6 0.6])<=0.1)
            f((j-1)*m+i)=1;
        end
    end
end
b=f;

