% L = 20;
% b = bspline1(-L:L);
% G = @(w) exp(1j*L*w) .* freqz(b,1,w);
% H = @(w) 1./G(w);

L = 20;
% b = bspline1(-L:L);
% B = @(w) (sin(w/2)/(w/2))^(1+1);
% G = @(w) exp(1j*L*w) .* B(w);
H = @(w) 1/G(w);

n_list = -20:1:20;
h = zeros(length(n_list),1);

for i=1:length(n_list)
    func = @(w) H(w) .* cos(n_list(i)*w);
    h(i) = integral(func,-pi,pi) ./(2*pi);
end

h = real(h);
stem(-20:1:20,h)

function out = G(w)
    out = 0;
    for k=-100:100
        out = out + abs(sin(w/2 + pi*k)/(w/2 + pi*k))^(2*1+2);
    end
end
