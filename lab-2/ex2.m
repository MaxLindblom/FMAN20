close all
clear all

f=[1,4,6,8,7,5,3];
x=0:6;
xq=0:6;
vq=interp1(x,f,xq);

plot(x,f,'o',xq,vq)

w=[1,-1];

c=conv(f,w)