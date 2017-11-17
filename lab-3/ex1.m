close all
load('linjepunkter.mat')

%Calculate least squares solution
[k,l]=leastSquares(x,y);
f=@(x)k*x+l;

%Plot least squares
hold on
plot(x,y,'*')
fplot(f,[min(x) max(x)])

%Calculate total least squares solution
[a,b,c]=TLS(x,y);
g=@(x)-(a*x+c)/b;

%Plot total least squares
fplot(g,[min(x) max(x)])
legend('Data points','Least squares','Total Least Squares')

%Residuals calculation
OLSres=[0 0];
TLSres=[0 0];
for i=1:size(x,2)
    OLSres(1)=OLSres(1)+(y(i)-f(x(i)))^2;
    OLSres(2)=OLSres(2)+(y(i)-g(x(i)))^2;
    TLSres(1)=TLSres(1)+((abs(k*x(i)-y(i)+l))/(sqrt(k^2+1)))^2;
    TLSres(2)=TLSres(2)+((abs(a*x(i)+b*y(i)+c))/(sqrt(a^2+b^2)))^2;
end
OLSres
TLSres