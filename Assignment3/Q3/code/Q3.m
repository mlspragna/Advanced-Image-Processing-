x_50 = im2double(imread("..data/slice_50.png"));
x_51 = im2double(imread("..data/slice_51.png"));
x_52 = im2double(imread("..data/slice_52.png"));
x_53 = im2double(imread("..data/slice_53.png"));
x_54 = im2double(imread("..data/slice_54.png"));
x_55 = im2double(imread("..data/slice_55.png"));

%%%  Q3 part a answer

angles = 180*rand(1,18);
recon_ramlak_x_50 = filtered_bp(x_50,angles);
recon_ramlak_x_51 = filtered_bp(x_51,angles);
recon_ramlak_x_52 = filtered_bp(x_52,angles);
recon_ramlak_x_53 = filtered_bp(x_53,angles);
recon_ramlak_x_54 = filtered_bp(x_54,angles);
recon_ramlak_x_55 = filtered_bp(x_55,angles);

figure();
imshow(recon_ramlak_x_50);
colormap('gray');
title("Slide 50, Filtered Backprojection using Ram-Lak filter");
colorbar;

figure();
imshow(recon_ramlak_x_51);
colormap('gray');
title("Slide 51, Filtered Backprojection using Ram-Lak filter");
colorbar;

figure();
imshow(recon_ramlak_x_52);
colormap('gray');
title("Slice 52, Filtered Backprojection using Ram-Lak filter");
colorbar;

figure();
imshow(recon_ramlak_x_53);
colormap('gray');
title("Slice 53, Filtered Backprojection using Ram-Lak filter");
colorbar;

figure();
imshow(recon_ramlak_x_54);
colormap('gray');
title("Slice 54, Filtered Backprojection using Ram-Lak filter");
colorbar;

figure();
imshow(recon_ramlak_x_55);
colormap('gray');
title("Slice 55, Filtered Backprojection using Ram-Lak filter");
colorbar;

%%%  Q3 part b 
%%
addpath("./l1_ls_matlab");

x_50 = padding(x_50);
y_50 = radon(x_50, angles);

m = size(y_50,1);
n = size(x_50,1);

A = matrix_A(angles,m,n);
At = matrix_At(angles,m,n);

y_50 = y_50(:);
m = size(y_50,1);
n = size(x_50(:),1);
[beta, status] = l1_ls(A, At, m, n, y_50, 0.08,1e-7,true);
recon_partb_x_50 = idct2(reshape(beta, size(x_50)));

x_51 = padding(x_51);
y_51 = radon(x_51, angles);
y_51 = y_51(:);

[beta, status] = l1_ls(A, At, m, n, y_51,0.08,1e-7, true);
recon_partb_x_51 = idct2(reshape(beta, size(x_51)));

x_52 = padding(x_52);
y_52 = radon(x_52, angles);
y_52 = y_52(:);

[beta, status] = l1_ls(A, At, m, n, y_52,0.08,1e-7, true);
recon_partb_x_52 = idct2(reshape(beta, size(x_52)));

x_53 = padding(x_53);
y_53 = radon(x_53, angles);
y_53 = y_53(:);

[beta, status] = l1_ls(A, At, m, n, y_53,0.08,1e-7, true);
recon_partb_x_53 = idct2(reshape(beta, size(x_53)));

x_54 = padding(x_54);
y_54 = radon(x_54, angles);
y_54 = y_54(:);

[beta, status] = l1_ls(A, At, m, n, y_54,0.08,1e-7, true);
recon_partb_x_54 = idct2(reshape(beta, size(x_54)));

x_55 = padding(x_55);
y_55 = radon(x_55, angles);
y_55 = y_55(:);

[beta, status] = l1_ls(A, At, m, n, y_55,0.08,1e-7, true);
recon_partb_x_55 = idct2(reshape(beta, size(x_55)));


figure();
imshow(recon_partb_x_50);
colormap('gray');
title("Slide 50, Independent CS based Reconstruction, part b");
colorbar;

figure();
imshow(recon_partb_x_51);
colormap('gray');
title("Slide 51, Independent CS based Reconstruction, part b");
colorbar;

figure();
imshow(recon_partb_x_52);
colormap('gray');
title("Slide 52, Independent CS based Reconstruction, part b");
colorbar;

figure();
imshow(recon_partb_x_53);
colormap('gray');
title("Slide 53, Independent CS based Reconstruction, part b");
colorbar;

figure();
imshow(recon_partb_x_54);
colormap('gray');
title("Slide 54, Independent CS based Reconstruction, part b");
colorbar;

figure();
imshow(recon_partb_x_55);
colormap('gray');
title("Slide 55, Independent CS based Reconstruction, part b");
colorbar;

%%%  Q3 part c 2 slices 
%%
angles1 = 180*rand(1,18);
angles2 = 180*rand(1,18);

x_50 = padding(x_50);
x_51 = padding(x_51);

y_50 = radon(x_50, angles1);
y_51 = radon(x_51, angles2);

m = size(y_50,1);
n = size(x_50,1);

A = matrix_A_2_slices(angles1, angles2,m,n);
At = matrix_At_2_slices(angles1, angles2,m,n);

y_50 = y_50(:);
y_51 = y_51(:);

m = 2*size(y_50,1);
n = 2*size(x_50(:), 1);
[beta, status] = l1_ls(A, At, m, n, [y_50; y_51], 0.08,1e-7, true);
b1 = beta(1:n/2);
diff_b = beta(n/2+1:end);
b2 = b1 + diff_b;
recon_partc_2_slices_x_50 = idct2(reshape(b1, size(x_50)));
recon_partc_2_slices_x_51 = idct2(reshape(b2, size(x_51)));

figure();
imshow(recon_partc_2_slices_x_50);
colormap('gray');
title("Slide 50, 2 slices Coupled CS based Reconstruction, part c");
colorbar;

figure();
imshow(recon_partc_2_slices_x_51);
colormap('gray');
title("Slide 51, 2 slices Coupled CS based Reconstruction, part c");
colorbar;

%%%  Q3 part c 3 slices 
%%
angles1 = 180*rand(1,18);
angles2 = 180*rand(1,18);
angles3 = 180*rand(1,18);

x_50 = padding(x_50);
x_51 = padding(x_51);
x_52 = padding(x_52);

y_50 = radon(x_50, angles1);
y_51 = radon(x_51, angles2);
y_52 = radon(x_52, angles2);

m = size(y_50,1);
n = size(x_50,1);

A = matrix_A_3_slices(angles1, angles2,angles3,m,n);
At = matrix_At_3_slices(angles1, angles2,angles3,m,n);

y_50 = y_50(:);
y_51 = y_51(:);
y_52 = y_52(:);

m = 3*size(y_50,1);
n = 3*size(x_50(:), 1);
[beta, status] = l1_ls(A, At, m, n, [y_50; y_51;y_52], 0.08,1e-7, true);
one_third = n/3;
b1 = beta(1:one_third);
diff_b1 = beta(one_third+1:2*one_third);
diff_b2 = beta(2*one_third+1:end);
b2 = b1 + diff_b1;
b3 = b2 + diff_b2;

recon_partc_3_slices_x_50 = idct2(reshape(b1, size(x_50)));
recon_partc_3_slices_x_51 = idct2(reshape(b2, size(x_51)));
recon_partc_3_slices_x_52 = idct2(reshape(b3, size(x_52)));

figure();
imshow(recon_partc_3_slices_x_50);
colormap('gray');
title("Slide 50, 3 slices Coupled CS based Reconstruction, part c");
colorbar;

figure();
imshow(recon_partc_2_slices_x_51);
colormap('gray');
title("Slide 51, 3 slices Coupled CS based Reconstruction, part c");
colorbar;

figure();
imshow(recon_partc_3_slices_x_51);
colormap('gray');
title("Slide 52, 3 slices Coupled CS based Reconstruction, part c");
colorbar;
