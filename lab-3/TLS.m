function [a, b, c] = TLS(x, y)
%TLS Total least squares solution
%   Takes datapoints as input and outputs
%   a, b, and c in the line ax+by+c

%Calculate some values
xx=sum(x)*sum(x);
xy=sum(x)*sum(y);
yy=sum(y)*sum(y);
x2=sumsqr(x);
y2=sumsqr(y);
N=size(x,2);

%Build A matrix
A=[x2-(1/N)*xx sum(x.*y)-(1/N)*xy;sum(x.*y)-(1/N)*xy y2-(1/N)*yy];
[V,D]=eig(A);
p=V(:,1); %Get eigenvector

a=p(1);
b=p(2);
c=-(1/N)*(a*sum(x)+b*sum(y));
end

