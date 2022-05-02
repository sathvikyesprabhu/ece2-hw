A = [1.02 1.00;1.00 0.99];
y = [1;1];

x = inv(A) * y;
err = [];

for i=1:10000
    e = randn(2,1);
    y = [1;1] + e;
    x_hat = inv(A)*y;
    err = [err norm(x - x_hat)^2];
end

mean(err)