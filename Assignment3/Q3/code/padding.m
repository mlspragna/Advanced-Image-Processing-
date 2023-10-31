function img_padded = padding(img)
    [m,n] = size(img);
    m = (255 - m)/2;
    n = (255 - n)/2;
    img_padded = padarray(img, [m,n], 0, 'both');
end