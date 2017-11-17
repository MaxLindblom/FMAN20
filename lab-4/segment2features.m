function features = segment2features(I)
% features = segment2features(I)

%Features:
val_sum=0;          %Pixel value sum
horiz_edges=0;      %Amount of edges horizontally
vert_edges=0;       %Amount of edges, vertically
max_val_rows=0;     %Highest total value of any row
nbr_MVR=0;          %Amount of max value rows
nonzero_rows=0;     %Amount of non-zero rows
max_val_cols=0;     %Highest total of any column
nbr_MVC=0;          %Amount of max value columns
nonzero_cols=0;     %Amount of non-zero columns
mom=0;              %Moment of the image
ratio=0;            %Width-to-height ratio


% row_sums=sum(I,2);
col_sums=sum(I);
rows=size(I,1);
% cols=size(I,2);

max_val_cols=max(col_sums);
factor=rows/max_val_cols;

I(:,all(I==0))=[];
I(all(I==0),:)=[];
I=imresize(I,factor,'nearest');
% I=I(:,any(I~=0,2));


I=imresize(I,[400 400]);

I=padarray(I,[2 2]);


row_sums=sum(I,2);
col_sums=sum(I);
rows=size(I,1);
cols=size(I,2);

val_sum=sum(col_sums);
for r=1:rows
    for c=1:cols-1
        if I(r,c)~=I(r,c+1)
            horiz_edges=horiz_edges+1;
        end
    end
end
for c=1:cols
    for r=1:rows-1
        if I(r,c)~=I(r+1,c)
            vert_edges=vert_edges+1;
        end
    end
end
max_val_rows=max(row_sums);
nbr_MVR=sum(row_sums(:)==max_val_rows);
nonzero_rows=rows-sum(row_sums(:)==0);
max_val_cols=max(col_sums);
nbr_MVC=sum(col_sums(:)==max_val_cols);
nonzero_cols=cols-sum(col_sums(:)==0);
mom=round(sum(moment(I,3))*10);
ratio=round((max_val_rows/max_val_cols)*100);

features = [val_sum horiz_edges vert_edges max_val_rows nbr_MVR nonzero_rows nbr_MVC mom];
end