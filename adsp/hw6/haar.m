function w = haar(x,L)
w = [];
sj = x;
for j=1:L
    wj = (downsample(sj,2)-downsample(sj,2,1))/sqrt(2);
    sj = (downsample(sj,2)+downsample(sj,2,1))/sqrt(2);
    w = [wj;w];
end
w = [sj;w];
end

