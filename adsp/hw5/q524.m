im = double(imread('frog.tiff'));
load('jpeg_Qtable.mat');

N = length(im);
im_dct = block_dct2(im);
im_dct1 = im_dct;

for i=1:8:N
    for j = 1:8:N
        block = im_dct(i:i+7,j:j+7);
        block = Q.*round(block./Q);
        im_dct(i:i+7,j:j+7) = block;
    end
end

im_hat = iblock_dct2(im_dct);
imagesc(im_hat)