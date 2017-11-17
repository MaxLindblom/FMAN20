function [k, l] = leastSquares(x, y)
%LEASTSQUARES Least square solution
%   takes data points as input and outputs 
%   k and l for the line y=kx+l
A=ones(size(x,2),2);
A(:,1)=x';
p=A\y';  

k=p(1);
l=p(2);
end

