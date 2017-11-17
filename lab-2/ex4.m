eps=0.5
diff=1-eps

Pn=(((diff^3)*eps)*(1/4)) + ((diff*(eps^3))*(1/4)) + (((diff^2)*eps^2)*(1/2))

P1=eps*(diff^3)*(1/4);
P2=(eps^3)*diff*(1/4);
P3=(diff^2)*(eps^2)*(1/2);

P1a=P1/Pn
P2a=P2/Pn
P3a=P3/Pn