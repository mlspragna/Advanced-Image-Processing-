img = double(imread("..data/barbara256.png"));
var = sqrt(4);
img_noise = img + var*randn(size(var));

psi = kron(dctmtx(8)',dctmtx(8)');
phi = randn([32,64]);
A  = phi*psi;

lambda = 1;
alpha = 1 + max(eig(A'*A));

img_pad = zeros(256+14,256+14);
img_pad(8:7+256,8:7+256) = img; 
x_reconstructed = zeros(256+14,256+14);
count = zeros(256,256);
for i=1:256+7
    for j=1:256+7
        x_patch = img_pad(i:i+7, j:j+7);
        y_patch = phi*x_patch(:);
        theta_patch = ista(y_patch,A,lambda,alpha, 200);
        x_reconstructed(i:i+7, j:j+7) = x_reconstructed(i:i+7, j:j+7) + reshape(psi*theta_patch,8,8);
    end
    %disp([i,j]);
end

x_reconstructed = x_reconstructed(8:256+7, 8:256+7)/64;
rmse_noise = norm(img(:)-img_noise(:))/norm(img(:));
rmse_reconstruction = norm(img(:)-x_reconstructed(:))/norm(img(:));
disp(["RMSE = ", rmse_reconstruction]);

figure()
subplot(1,3,1);
imshow(img,[]);
title("original image");

subplot(1,3,2);
imshow(img_noise,[]);
title("noise image");

subplot(1,3,3);
imshow(x_reconstructed,[]);
title("reconstructed image");

