clear;
clc;
addpath("./l1_ls_matlab");

m = 200;
n = 500;
s = 18;

% Drawing signal and sensing matrix
indexes_x = sort(randperm(n,s));
x = zeros(n,1);
x(indexes_x) = 1000.*rand(s,1);
phi = (2.*binornd(1,0.5,[m,n]) - 1)/sqrt(m);

sigma = 0.05*sum(abs(phi*x))/m;
noise = normrnd(0,sigma,[m,1]);
y = phi*x + noise;

m1 = 9*m/10;
indexes = 1:m;
indexes_R = sort(randperm(m,m1));
indexes_V = ones(1,m);
indexes_V(indexes_R) = 0;
indexes_V = indexes(indexes_V == 1);

phi_R = phi(indexes_R,1:n);
phi_V = phi(indexes_V,1:n);
y_R = reshape(y(indexes_R),m1,1);
y_V = reshape(y(indexes_V),m/10,1);

lambda_set = [0.0001, 0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 2, 5, 10, 15, 20, 30, 50, 100];
VE = zeros(size(lambda_set));
RMSE = zeros(size(lambda_set));
count = 1;
for lambda = lambda_set
    [x_g, status] = l1_ls(phi_R,phi_R', m1, n, y_R,lambda,1e-10,true);
    ve_error =  y_V - phi_V*x_g;
    VE(count) = 10*sum(ve_error.*ve_error)/m;
    RMSE(count) = norm(x_g - x,2)/norm(x,2); 
    count = count + 1;
end


figure(1);
plot(log(lambda_set),VE);
xlabel('logarithmic lambda');
ylabel('Validation Error');
title('VE vs logarithm values of lambda');

figure(2);
plot(log(lambda_set),RMSE);
xlabel('logarithmic lambda');
ylabel('RMSE');
title('RMSE vs logarithm values of lambda');

