
load('blocksdeconv.mat');
A = Hmatrix(h,512);
% S = svd(A);

%% b
A_plus = inv(A'*A)*A';
x1 = A_plus*y;
plot(x1)
%% c
x2 = A_plus*yn;
hold on;
plot(x2)
erorr_mean = norm(x1-x2)^2;
error_measurement = norm(y-yn)^2;
%% d: tSVD
[U,S,V] = svd(A_plus,'econ');
q = 1;
S(end-q+1:end,:)=0;
A_tSVD = U*S*V';
x3 = A_tSVD*yn;
error_tSVD = norm(x1-x3)^2;
plot(x3)
%% e: Tikhonov
delta = 0.0005;
A_tik = inv(A'*A + delta*eye(512))*A';
x4 = A_tik*yn;
error_tik = norm(x1-x4)^2;
plot(x4)
%% f: Comparison
erorr_mean
error_tSVD
error_tik
error_nothing = norm(x1-yn(15:526))^2

legend(["x","x_{pinv}","x_{tSVD} q="+string(q),"x_{tik} \delta="+string(delta)])
xlim([0 512])