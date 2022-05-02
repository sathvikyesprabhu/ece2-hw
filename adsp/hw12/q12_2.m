A = [10000 10001;10001 10002;10002 10003;10003 10004;10004 10005];
b = [20001;20003;20005;20007;20009];
%% a
condition_number = max(eig(A'*A))/min(eig(A'*A))
%% b
x_pinv = inv(A'*A)*A'*b
%% c
[Q,R] = qr(A);
d = Q'*b;
% Solving Rx=d using back-substitution
x2 = d(2)/R(2,2);
x1 = (d(1)-R(1,2)*x2)/R(1,1);
x_qr = [x1;x2]

%% d
L = chol(A'*A,"lower");
% Solving Lw = A'b
y = A'*b;
w1 = y(1)/L(1,1);
w2 = (y(2)-w1*L(2,1))/L(2,2);
w = [w1;w2];
% Sloving L'x = w;
R = L';
x2 = w(2)/R(2,2);
x1 = (w(1)-R(1,2)*x2)/R(1,1);
x_chol = [x1;x2]
%% e
x_matlab = A\b % QR
