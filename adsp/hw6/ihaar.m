function x = ihaar(w,L)
len = length(w);
sj = w(1:len/(2^L));
for j=1:L
    wj = w(2^(j-1)*(len/(2^L))+1 : (2^j)*(len/(2^L)));
    wn = (upsample(wj,2)-upsample(wj,2,1))/sqrt(2);
    sn = (upsample(sj,2) + upsample(sj,2,1))/sqrt(2);
    sj = [sn + wn];
end
x = sj;
end