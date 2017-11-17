function y = features2class(x,data)

k=1;
n=size(data,2);
distances=zeros(n,2);

%Calculate norm of distances for all data
for i=1:n
    diff=data{1,i}-x;
    dist=norm(diff);
    distances(i,1)=dist;
    distances(i,2)=i;
end

%Sort and put norm values into vector
sorted=sortrows(distances);
for i=1:k
    index=sorted(i,2);
    results(i)=data{2,index};
end

%Return most common ground truth
y=mode(results);
end