eps=0.2
diff=1-eps

Pn=(((diff^10)*eps^6)*0.3)+(((diff^12)*eps^4)*0.2)+(((diff^10)*eps^6)*0.2)+(((diff^8)*eps^8)*0.3)

z=zeros(4);

n=z;
n(1,1)=1;
n(2,2)=1;
n(3,3)=1;
n(4,2)=1;


for i=1:4
    l{i}=z;
    l{i}(:,i)=1;
    correct{i}=logical(n==l{i});
    incorrect{i}=logical(n~=l{i});
end

correct{1}
incorrect{1}

P1=prod(diff*nonzeros(correct{1}))*prod(eps*nonzeros(incorrect{1}))*0.3;
P1a=P1/Pn
P2=prod(diff*nonzeros(correct{2}))*prod(eps*nonzeros(incorrect{2}))*0.2;
P2a=P2/Pn
P3=prod(diff*nonzeros(correct{3}))*prod(eps*nonzeros(incorrect{3}))*0.2;
P3a=P3/Pn
P4=prod(diff*nonzeros(correct{4}))*prod(eps*nonzeros(incorrect{4}))*0.3;
P4a=P4/Pn

% correct{2}
% correct{3}
% correct{4}
