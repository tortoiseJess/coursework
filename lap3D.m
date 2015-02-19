function A=lap3D(m)

h=1/(m+1);
B=spdiags(ones(m,1),1,m,m);
I = speye(m^2,m^2);
B=kron(B,I); 
B=-B;
figure
spy(B)

D=spdiags([-ones(m,1) 6*ones(m,1), -ones(m,1)],-1:1,m,m); %gives the main diagonal
E=kron(I,D);
figure
spy(E)
A=E+B+B';
A=(1/h^3)*A;
