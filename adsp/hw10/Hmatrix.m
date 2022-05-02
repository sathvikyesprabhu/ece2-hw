function H = Hmatrix(h,N)
L = length(h);
M = L+N-1;
H = zeros(M,N);

for i=1:N
    H(i:i+L-1,i)=h;
end

end