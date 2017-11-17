function [S] = im2segment(im)
% [S] = im2segment(im)

level=139;

im(find(im<=level))=0;
im(find(im>level))=1;
im=~im;

[I,nrofsegments]=bwlabel(im,8);

% nrofsegments = 4;
for kk = 1:nrofsegments
    [r,c]=find(I==kk);
    rc=[r,c];
    S{kk}=zeros(size(im));
    for i=1:size(rc,1)
        coord=rc(i,:);
        S{kk}(coord(1),coord(2))=1;    
    end
end
