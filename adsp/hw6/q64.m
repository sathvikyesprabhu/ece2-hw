for str=["blocks", "bumps"]
load(str + '.mat');
x = c;
w = haar(x,3);
J = 10;
disp(str  + string(norm(w)-norm(x)));

figure;
sgtitle(str)
subplot(2,2,1);
s1 = w(1 : 2^(J-3));
plot(s1); title('Scaling coefficients: J-3');

subplot(2,2,2);
w1 = w(2^(J-3)+1 : 2^(J-2));
plot(w1); title('Wavelet coefficients: J-3');

subplot(2,2,3);
w2 = w(2^(J-2)+1 : 2^(J-1));
plot(w2); title('Wavelet coefficients: J-2');

subplot(2,2,4);
w3 = w(2^(J-1)+1 : 2^J);
plot(w3); title('Wavelet coefficients: J-1');
end