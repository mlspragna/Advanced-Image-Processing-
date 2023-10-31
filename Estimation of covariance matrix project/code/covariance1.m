function unbiased_cov = covariance1(biased_cov,m,p,k)
    alpha1 = (k/(m+1))/(1+ (k/(m+1)));
    alpha2 = 1/((1+ (k/(m+1)))*(m+1+k+p));
    unbiased_cov = biased_cov - alpha1*diag(diag(biased_cov)) - alpha2*sum(diag(biased_cov))*eye(p,p);
end