function mat = block_dct2(img)
N = length(img);
mat=zeros(N);

for i=1:8:N
    for j = 1:8:N
        mat(i:i+7,j:j+7) = dct2(img(i:i+7,j:j+7));
    end
end

end
