classdef matrix_A    
    properties 
        angles
        m
        n
    end    
    methods      
        function A = matrix_A(angles,m,n)            
            A.m = m;
            A.n = n;
            A.angles = angles;
       end
       
       function Az = mtimes(A,z)
            %disp(size(z));
            z = idct2(reshape(z,A.n,A.n));
            Az = radon(z,A.angles);
            row1 = Az(:);
            Az = [row1];
       end 
    end   
end