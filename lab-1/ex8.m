close all
load('assignment1bases.mat');

b=size(bases,2);
s=size(stacks,2);

err_norms=zeros(b,s);

for i=1:b
    for j=1:s
        for k=1:size(stacks{j},3)
            [im,err]=project(stacks{j}(:,:,k),bases{i});
            err_norms(i,j)=err_norms(i,j)+err;
        end
        err_norms(i,j)=err_norms(i,j)/size(stacks{j},3);
    end
end

err_norms

subplot(2,2,1); imshow(mat2gray(stacks{1}(:,:,120)));
subplot(2,2,2); imshow(mat2gray(stacks{1}(:,:,180)));
subplot(2,2,3); imshow(mat2gray(stacks{1}(:,:,279)));
subplot(2,2,4); imshow(mat2gray(stacks{1}(:,:,313)));

figure(2)
subplot(2,2,1); imshow(mat2gray(stacks{2}(:,:,145)));
subplot(2,2,2); imshow(mat2gray(stacks{2}(:,:,166)));
subplot(2,2,3); imshow(mat2gray(stacks{2}(:,:,244)));
subplot(2,2,4); imshow(mat2gray(stacks{2}(:,:,366)));

figure(3)
for i=1:4
    subplot(2,2,i); imshow(mat2gray(bases{1}(:,:,i)));
end

figure(4)
for i=1:4
    subplot(2,2,i); imshow(mat2gray(bases{2}(:,:,i)));
end

figure(5)
for i=1:4
    subplot(2,2,i); imshow(mat2gray(bases{3}(:,:,i)));
end