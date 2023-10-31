function e = NormalizedError(cov1,cov2)
    e = norm(cov2-cov1,2) / sqrt(sum(cov1(:)).^2);
end