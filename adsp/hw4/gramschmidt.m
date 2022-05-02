function Q = gramschmidt(A)
    [N,K] = size(A);
    Q = zeros(N,K);
    Q(:,1)=A(:,1)/norm(A(:,1));
    
    for k=2:K
        sum = zeros(N,1);
        for l=1:k-1
            sum = sum + dot(A(:,k),Q(:,l))*Q(:,l);
        end
        w = A(:,k) - sum;
        Q(:,k)=w/norm(w);
    end
end