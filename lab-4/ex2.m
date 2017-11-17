load('heart_data')

%Regularization weight
v=4.8;

[M, N]=size(im);
n=M*N;

%Estimate means and standard deviations
mean_b=mean(background_values);
mean_c=mean(chamber_values);
std_b=std(background_values);
std_c=std(chamber_values);

%Find neighbours and construct A matrix
nb=edges4connected(M,N);
i=nb(:,1);
j=nb(:,2);
A=sparse(i,j,v,n,n);

%Probabilities of background and chamber
P_b=-log(normpdf(im,mean_b,std_b));
P_c=-log(normpdf(im,mean_c,std_c));

%Construct T matrix
T=[P_c(:) P_b(:)];
T=sparse(T);

%Calculate maxflow/min cut
[E, Theta]=maxflow(A,T);
Theta=reshape(Theta,M,N);
Theta=double(Theta);

imshowpair(im,Theta,'montage');