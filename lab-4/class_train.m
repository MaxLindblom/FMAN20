function [classification_data] = class_train(X,Y)
%CLASS_TRAIN KNN training
%   Training data and ground truths are concatenated

classification_data=[];

for i=1:size(X,2)
    data={X(:,i);Y(i)};
    classification_data=[classification_data data];
end
end