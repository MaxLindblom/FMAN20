function y = classify(x, classification_data, k)
%CLASSIFY KNN classification
%   K-Nearest neighbour classification. k is given as input.
%   Returns a predicted classification

n=size(classification_data,2);
distances=zeros(n,2);

%Calculate norm of distances for all data
for i=1:n
    diff=classification_data{1,i}-x;
    dist=norm(diff);
    distances(i,1)=dist;
    distances(i,2)=i;
end

%Sort and put norm values into vector
sorted=sortrows(distances);
for i=1:k
    index=sorted(i,2);
    results(i)=classification_data{2,index};
end

%Return most common ground truth
y=mode(results);
end

