clear all
close all

image=zeros(5);
r=linspace(0,1,5);
for x = 1:5
    image(:,x)=(4*r(x))*(1-r(x));
end
image=round(image.*15);
I=mat2gray(image)

imshow(I);