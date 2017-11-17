u=[1,-3;4,-1]
v=[1,1;-1,-1]*0.5
w=[1,-1;1,-1]*0.5

norm(u)
norm(v)
norm(w)

uv=u*v;
uw=u*w;
vw=v*w

det(u*v);
det(u*w);
det(v*w);