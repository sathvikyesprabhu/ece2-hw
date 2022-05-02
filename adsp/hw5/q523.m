x=double(imread('frog.tiff'));
y_list = zeros(64,1);

for M=1:64
x_hat = block_dct2_approx(x,M);
y_list(M) = log10((norm(x-x_hat,'fro')^2)/(norm(x,'fro')^2));
end

plot(y_list)
xlabel('M')
ylabel('Log normalized error')

% imagesc(x);
% imagesc(x_hat);