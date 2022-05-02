function A = sampmat(smptimes,N)

M = length(smptimes);
A = zeros(M,N);

for k= -(N-1)/2 : (N-1)/2
    for t=1:M
        A(t, k + (N+1)/2) = exp(1i*2*pi*k*smptimes(t));
    end
end

end

