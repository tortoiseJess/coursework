function x=GaussElim(A,b)
%gives the solution of Ax=b via GE and back subsitution
n=size(A,1);
for i=1:n-1
    for k=i+1:n
        alpha=A(k,i)/A(i,i);
        for j=i+1:n
            A(k,i)=0;
            A(k,j)=A(k,j)-alpha*A(i,j);
        end
        b(k)=b(k)-alpha*b(i);
    end
end

%back subsitution for x after GE on A, A is upper triangular matrix
x=b;
for i=n:-1:1
    for j=i+1:n
        x(i)=x(i)-A(i,j)*x(j);
    end
    x(i)=x(i)/A(i,i);
end
