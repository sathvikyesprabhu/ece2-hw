load('blocksdeconv.mat');
A = Hmatrix(h,512);
A_plus = inv(A'*A)*A';
x1 = A_plus*y;
[U,S,V] = svd(A_plus,'econ');

err=[];
for q=0:512
S(end-q+1:end,:)=0;
A_tSVD = U*S*V';
x3 = A_tSVD*yn;
error_tSVD = norm(x1-x3)^2;
err=[err;error_tSVD];
end