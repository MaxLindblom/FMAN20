eps1=0.3;
eps2=0.2;
diff1=1-eps1;
diff2=1-eps2;

B=[1 1 0;1 0 1;1 1 0;1 0 1;1 1 0];
O=[0 1 0;1 0 1;1 0 1;1 0 1;0 1 0];
Eight=[0 1 0;1 0 1;0 1 0;1 0 1;0 1 0];
x=[0 0 0;1 0 0;0 1 0;0 0 1;1 1 0];

w={B,O,Eight};

P1=(eps2^5)*(diff2^5)*(diff1^5)*0.3
P2=(eps2^5)*(eps1^2)*(diff2^3)*(diff1^5)*0.4
P3=(eps2^3)*(eps1)*(diff2^4)*(diff1^7)*0.3

Px=P1+P2+P3
P1a=P1/Px
P2a=P2/Px
P3a=P3/Px

for i=1:3
    correct{i}=logical(x==w{i});
    incorrect{i}=logical(x~=w{i});
end

% correct{1}
% incorrect{1}