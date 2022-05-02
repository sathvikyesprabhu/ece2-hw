
% N = 10;
% 
% h = cos(2*pi*[0:N-1]/5);
% H = @(w) freqz(h, 1, w);
% Habs = @(w) abs(H(w));
% intHabs = integral(Habs, -pi, pi);

% L = 20;
% n=-20:20;
% b = bspline1(n);
% plot(b)

% B = @(w) exp(1j*w*L) .* freqz(b,1,w);
% G = @(w) exp(1j*w*L) * 
% H = @(w) 1/G(w);
% T = @(w,k) B(w+2*pi*k);

% 
% f = @(w,k) abs(T(w,k))^2;
% syms k;
% G = @(w) 1/symsum(f,k,-20,20);
% % H = @(w) G.*exp(1j*w*n);
% % h = (1/2*pi) * (integral(H,-pi,pi));


% h = @(n) integral(H * exp(n), -pi, pi);

% for l=1:4
%     figure;
%     array = h(-20:20,l);
%     stem(-20:20,array);
%     title('L = ' + string(l));
% end

figure;
nn = -20:20;
l=4;
array = h(nn,l);
b = bspline4(nn);
b_dual = conv(array,b,'same');
plot(nn,b_dual)
title('L = ' + string(l))

function out = h(n,L)
    out=0;
    for w=-pi:0.001:pi
        out = out + (1/G(w,L))*cos(w*n)*0.001;
    end
    out = out/(2*pi);
end

function out = G(w,L)
    out = 0;
    for k=-100:100
        out = out + abs(sin(w/2 + pi*k)/(w/2 + pi*k))^(2*L+2);
    end
end