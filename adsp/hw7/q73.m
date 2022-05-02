t = linspace(-20,30,10000);
x = @(t) ((t>=0).*(t<10).*0.5) + ((t>=10).*(t<=20)).*(-sin(pi*t/10));

conv1 = conv(xbln,h(-20:20,4));
xa = zeros(size(t));
for nn=-23:43
    xa = xa+conv1(nn+24)*bspline4(t-nn);
end

xbln = zeros(1, 27);
for nn=-3:23
    func = @(z) x(z).*bspline4(z-nn);
    xbln(nn+4)=integral(func,-3,23);
end

figure;
plot(t,xa);
hold on;
plot(t,x(t),'r');
title('L = 4');

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