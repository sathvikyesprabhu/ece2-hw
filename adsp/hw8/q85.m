load('hw8pbandlimited.mat');
A = sampmat(samptimes,51);
% alpha = inv(A)*y;
alpha = inv(A'*A)*A'*y;

B = 25;
t = 0:0.001:1;
y_hat = zeros(size(t));

for k=-B:B
    y_hat = y_hat + alpha(k+B+1)*exp(1j*2*pi*k*t);
end

plot(samptimes,y)
hold on;
plot(t,real(y_hat))
legend(["Original signal","Bandlimited signal"])