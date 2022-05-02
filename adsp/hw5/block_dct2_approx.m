function im_hat = block_dct2_approx(im, M)

N = length(im);
im_dct = block_dct2(im);

ind = jpgzzind(8,8);
ind = ind(M+1:end);

for i=1:8:N
    for j = 1:8:N
        block = im_dct(i:i+7,j:j+7);
        block(ind) = 0;
        im_dct(i:i+7,j:j+7) = block;
    end
end

im_hat = iblock_dct2(im_dct);
end