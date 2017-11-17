load('ocrsegments')

%Extract features for training data
for i=1:size(S,2)
    X(:,i)=segment2features(S{i})';
end

%Classify and save training data
classification_data=class_train(X,y);
save('classification_data.mat','classification_data');

inl4_test_and_benchmark;