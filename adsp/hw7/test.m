% N = 10;
% h = cos(2*pi*[0:N-1]/5);
% H = @(w) freqz(h, 1, w);
% Habs = @(w) abs(H(w));
% intHabs = integral(Habs, -pi, pi);
% BL = @(w) freqz(bl, 1, w);

% syms k;
% HL = @(w) 1/symsum(abs(BL(1j*(w+2*pi*k))),k,-inf,inf);

% hl = (1/2*pi)*integral(HL,-pi,pi);

% n = -20:20;
b = @(n) bspline1(n);
% [acf, lags] = autocorr(b);
B = @(w) freqz(b(n),1,w);
Babs = @(w) (abs(B(w))).^2;


