function [up, r] = project(u, b)
%PROJECT Summary of this function goes here
%   Detailed explanation goes here
dim=size(b,3);
up=zeros(size(u));

for i=1:dim
    e=b(:,:,i);
    x=e(:)'*u(:);
    up=up+x*e;
end

r=norm(abs(u-up),'fro');
end

