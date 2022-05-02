% phi = @(z) exp(-z.^2);
% N =25;
% t = linspace(0, 1, 1000);
% figure(1); clf
% hold on
% for kk = 1:N
% plot(t, phi(N*t - kk + 1/2))
% end

% N=4;
% a=[1 -1 1 -1];
% t = linspace(0,1,1000);
% y = zeros(size(t));
% for jj = 1:N
% y = y + a(jj)*phi(N*t - jj + 1/2);
% end
% plot(t, y)

t = linspace(0, 1, 1000);
x = @(z) (z < 1/4).*(4*z) + (z>=1/4).*(z<1/2).*(-4*z+2) - (z>=1/2).*sin(20*pi*z);
phi = @(z) exp(-z.^2);

N=50;
b=[]; % Find b vector
for jj = 1:N
    x_phik = @(z) x(z).*phi(N*z - jj + 1/2);
    b(jj) = integral(x_phik, 0, 1);
end

G = []; % Find Grammian
for ii = 1:N
    for jj = 1:N
        phi_phi = @(z) phi(N*z - ii + 1/2).*phi(N*z - jj + 1/2);
        G(ii,jj)=integral(phi_phi, 0, 1);
    end
end

a = inv(G)*b' % Find a vector

% Plot
y = zeros(size(t));
for jj = 1:N
    y = y + a(jj)*phi(N*t - jj + 1/2);
end
hold on;
plot(t, x(t));
plot(t, y);