function [gammak, qk, k] = power_method(A)
N = length(A);

gamma = [0];
qk = ones(N,1)/sqrt(N);

for k=1:10000   
zk = A*qk;
qk = zk/norm(zk);
gammak = qk'*A*qk;
gamma = [gamma;gammak];

if abs(gamma(end-1)-gamma(end)) < eps
    break
end

end