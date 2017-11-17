load('ocrfeaturestrain.mat')

%Take two letters from the set
Yl=logical(Y==13 | Y==14);
X=X(:,Yl==1);
Y=Y(Yl==1);

tree_acc=0;
NN_acc=0;
SVM_acc=0;

%Iterate 1000 times
for j=1:1000
    part=cvpartition(size(X,2),'HoldOut',0.20);
    X_train=X(:,part.training==1);
    Y_train=Y(part.training==1);
    X_test=X(:,part.test==1);
    Y_test=Y(part.test==1);

    %Regression tree Classifier
    tree=fitctree(X_train',Y_train');
    ctrl=zeros(size(X_test,2),2);
    for i=1:size(X_test,2)
        ctrl(i,1)=predict(tree,X_test(:,i)');
        ctrl(i,2)=Y_test(i);
        
        % Testing on training data
%         ctrl(i,1)=predict(tree,X_train(:,i)');
%         ctrl(i,2)=Y_train(i);
    end
    correct=(ctrl(:,1)==ctrl(:,2));
    tree_acc=tree_acc+(sum(correct)/size(X_test,2));
    
    %Nearest Neighbour Classifier
    md1=fitcknn(X_train',Y_train');
    ctrl=zeros(size(X_test,2),2);
    for i=1:size(X_test,2)
        ctrl(i,1)=predict(md1,X_test(:,i)');
        ctrl(i,2)=Y_test(i);
        
        % Testing on training data
%         ctrl(i,1)=predict(md1,X_train(:,i)');
%         ctrl(i,2)=Y_train(i);
    end
    correct=(ctrl(:,1)==ctrl(:,2));
    NN_acc=NN_acc+(sum(correct)/size(X_test,2));
    
    %Support Vector Machine Classifier
    SVMModel = fitcsvm(X_train',Y_train');
    ctrl=zeros(size(X_test,2),2);
    for i=1:size(X_test,2)
        ctrl(i,1)=predict(SVMModel,X_test(:,i)');
        ctrl(i,2)=Y_test(i);
        
        % Testing on training data
%         ctrl(i,1)=predict(SVMModel,X_train(:,i)');
%         ctrl(i,2)=Y_train(i);
    end
    correct=(ctrl(:,1)==ctrl(:,2));
    SVM_acc=SVM_acc+(sum(correct)/size(X_test,2));
end
tree_error_rate=1-tree_acc/1000
NN_error_rate=1-NN_acc/1000
SVM_error_rate=1-SVM_acc/1000