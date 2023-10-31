classdef matrix_A_2_slices    
    properties
        angles1
        angles2
        m
        n
    end    
    methods      
        function A = matrix_A_2_slices(angles1,angles2,m,n)            
            A.angles1 = angles1;
            A.angles2 = angles2;
            A.m = m;
            A.n = n;
       end
       
       function Az = mtimes(A,z)
            mid = size(z,1)/2;
            z1 = z(1:mid);
            z2 = z(mid+1:end);
            
            %disp(size(z))
            %disp(size(z1))
            %disp(A.n)
            b1 = idct2(reshape(z1, A.n, A.n));
            diff_b = idct2(reshape(z2, A.n, A.n));

            A1_b1 = radon(b1, A.angles1);
            A2_diff_b = radon(diff_b, A.angles2);
            A2_b1 = radon(b1, A.angles2);

            row1 = A1_b1(:);
            row2 = A2_b1(:) + A2_diff_b(:);

            Az = [row1 ; row2];
       end 
    end   
end