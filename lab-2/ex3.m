c1=[0.4003,0.3988,0.3998,0.3997,0.4010,0.3995,0.3991];
c2=[0.2554,0.3139,0.2627,0.3802,0.3287,0.3160,0.2924];
c3=[0.5632,0.7687,0.0524,0.7586,0.4243,0.5005,0.6769];

c=[c1 c2 c3];

pdfs=zeros(3,21);

m=[0.4,0.3,0.5];
d=[0.01, 0.05, 0.2];

for i=1:21
    pdfs(1,i)=normpdf(c(i),m(1),d(1));
    pdfs(2,i)=normpdf(c(i),m(2),d(2));
    pdfs(3,i)=normpdf(c(i),m(3),d(3));
end

maxpdf=max(pdfs)