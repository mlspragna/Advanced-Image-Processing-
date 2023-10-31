function biased_cov = covariance(rescaled_X,m,n,mu_2)
    biased_cov = rescaled_X*rescaled_X';
    biased_cov = 1/(n*(m^2+m)*mu_2^2).*biased_cov;
end