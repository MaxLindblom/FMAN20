close all
load('femfel')
load('femfel_1')

im1=mat2gray(femfel1);
im2=mat2gray(femfel2);

im1g=rgb2gray(femfel1);
im2g=rgb2gray(femfel2);

[o,m]=imregconfig('monomodal');
fixed=imregister(im1g,im2g,'affine',o,m);
fused=imfuse(fixed,im2g);
diff=imbinarize(im2g-fixed);

subplot(2,2,1)
imshow(im1)

subplot(2,2,2)
imshow(im2)

subplot(2,2,3)
imshow(fused)

subplot(2,2,4)
imshow(diff)