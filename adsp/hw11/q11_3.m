A=[2 4 -1;1 -2 1;4 0 1;5 6 -1;8 -4 2];
y=[1; 2; -1; -2; 5];

C = [A y];
[W,G,Z] = svd(C,'econ');
z = Z(:,end);

%% a
x_tls = (-1/z(end))*z(1:end-1)

%% b
X_hat = W(:,1:3)*G(1:3,1:3)*Z(:,1:3)';
delta = X_hat-C;
err = norm(delta,"fro")^2

delta_A = delta(:,1:3)
delta_y = delta(:,4)

