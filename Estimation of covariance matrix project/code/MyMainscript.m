clear;
clc;
%%
%mnist dataset 

file = load("..\data\mnist.csv");
X = file(:,2:785);
X = X';

n = 5923;
p = 28*28;
m = floor(0.4*p);

cov = X*X'/n;
gamma_set = 0.1:0.1:0.5;

error_biased_mnist = zeros(size(gamma_set));
error_unbiased_mnist = zeros(size(gamma_set));
count = 1;
for gamma = gamma_set
    s = floor(m/gamma);
    pd = [1/(2*s),1-1/s,1/(2*s)];
    k = s-3;
    mu_2 = 1/s;
    rescaled_X = zeros(p,n);
    for i = 1:n
        x_i = X(:,i);
        R_i = reshape(randsample([-1,0,1],p*m,true,pd),[p,m]);
        rescaled_X(:,i) = R_i*R_i'*x_i;
    end
    biased_cov = covariance(rescaled_X,m,n,mu_2);
    unbiased_cov = covariance1(biased_cov,m,p,k);    
    
    error_biased_mnist(count) = NormalizedError(cov,biased_cov);
    error_unbiased_mnist(count) = NormalizedError(cov,unbiased_cov);
    count = count + 1;
    disp(count);
end

figure(1);
plot(log10(gamma_set),error_biased_mnist,"-o");
hold on;
plot(log10(gamma_set),error_unbiased_mnist,"-o");
xlabel("compressive factor = m/s");
ylabel("Normalized estimation error");
legend("Biased estimator", "Unbiased estimator");
title("Accuracy for mnist dataset log scale");

%%
%Gen dataset
file = load("..data\gen4.mat","-mat",'Problem');
Xstruct = file.imbd;

n = 4298;
p = 1537;
m = floor(0.4*p);

cov = X*X'/n;
gamma_set = 0.1:0.1:0.5;

error_biased_gen4 = zeros(size(gamma_set));
error_unbiased_gen4 = zeros(size(gamma_set));
count = 1;
for gamma = gamma_set
    s = floor(m/gamma);
    pd = [1/(2*s),1-1/s,1/(2*s)];
    k = s-3;
    mu_2 = 1/s;
    rescaled_X = zeros(p,n);
    for i = 1:n
        x_i = X(:,i);
        R_i = reshape(randsample([-1,0,1],p*m,true,pd),[p,m]);
        rescaled_X(:,i) = R_i*R_i'*x_i;
    end
    biased_cov = covariance(rescaled_X,m,n,mu_2);
    unbiased_cov = covariance1(biased_cov,m,p,k);    
    
    error_biased_gen4(count) = NormalizedError(cov,biased_cov);
    error_unbiased_gen4(count) = NormalizedError(cov,unbiased_cov);
    count = count + 1;
    disp(count);
end

figure(2);
plot(gamma_set,error_biased_gen4,"-o");
hold on;
plot(gamma_set,error_unbiased_gen4,"-o");
xlabel("compressive factor = m/s");
ylabel("Normalized estimation error");
legend("Biased estimator", "Unbiased estimator");
title("Accuracy for gen4 dataset");



%%
%Traffic data set
n = 5139;
p = 48*48;
m = floor(0.4*p);

file = load("..data\traffic.mat","-mat");
Xdict = file.imgdb;
X = zeros(p,m);
count = 1;
for i=1:254
    x_i = Xdict{i};
    t = size(x_i,3);
    x_i = reshape(x_i,p,t);
    X(:,count:count+t-1) = x_i;
    count = count + t;
end

cov = X*X'/n;
gamma_set = 0.1:0.1:0.5;

error_biased_traffic = zeros(size(gamma_set));
error_unbiased_traffic = zeros(size(gamma_set));
count = 1;
for gamma = gamma_set
    s = floor(m/gamma);
    pd = [1/(2*s),1-1/s,1/(2*s)];
    k = s-3;
    mu_2 = 1/s;
    rescaled_X = zeros(p,n);
    for i = 1:n
        x_i = X(:,i);
        R_i = reshape(randsample([-1,0,1],p*m,true,pd),[p,m]);
        rescaled_X(:,i) = R_i*R_i'*x_i;
    end
    biased_cov = covariance(rescaled_X,m,n,mu_2);
    unbiased_cov = covariance1(biased_cov,m,p,k);    
    
    error_biased_traffic(count) = NormalizedError(cov,biased_cov);
    error_unbiased_traffic(count) = NormalizedError(cov,unbiased_cov);
    count = count + 1;
    disp(count);
end

figure(3);
plot(gamma_set,error_biased_traffic,"-o");
hold on;
plot(gamma_set,error_unbiased_traffic,"-o");
xlabel("compressive factor = m/s");
ylabel("Normalized estimation error");
legend("Biased estimator", "Unbiased estimator");
title("Accuracy for traffic dataset");


