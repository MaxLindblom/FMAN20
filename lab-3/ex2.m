clear all
close all
load('FaceNonFace.mat')

k=1; %Set k value for k-nearest neighbour. k=1 seems to give best performance
acc=0;
%Iterate 1000 times to get a good mean error rate
for j=1:1000
    %Define training and testing sets
    part=cvpartition(200,'HoldOut',0.20);
    X_train=X(:,part.training==1);
    Y_train=Y(part.training==1);
    X_test=X(:,part.test==1);
    Y_test=Y(part.test==1);

    %Train model
    classification_data=class_train(X_train,Y_train);

    ctrl=zeros(size(X_test,2),2);
    %Iteratively test the model
    for i=1:size(X_test,2)
        ctrl(i,1)=classify(X_test(:,i),classification_data,k);
        ctrl(i,2)=Y_test(i);
        
        % Testing on training data
%         ctrl(i,1)=classify(X_train(:,i),classification_data,k);
%         ctrl(i,2)=Y_train(i);
    end
    correct=(ctrl(:,1)==ctrl(:,2));
    acc=acc+sum(correct)/size(X_test,2);
end

%Display four example images
ints=randi([1 size(X_test,2)],1,4);
example_out=zeros(4,3);
for i=1:4
    ex=X_test(:,ints(i));
    example_out(i,1)=ints(i);
    example_out(i,2)=classify(ex,classification_data,k);
    example_out(i,3)=Y_test(1,ints(i));
    im=mat2gray(reshape(ex,[19,19]));
    subplot(2,2,i); imshow(im);
end

%Display the four examples (index, predicted ground truth,
%and actual ground truth)
example_out

%Calculate error rate
error_rate=1-acc/1000