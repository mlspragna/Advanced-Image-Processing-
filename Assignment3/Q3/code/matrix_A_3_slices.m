classdef matrix_A_3_slices    
    properties
        angles1
        angles2
        angles3
        m
        n
    end    
    methods      
        function A = matrix_A_3_slices(angles1,angles2,angles3,m,n)            
            A.angles1 = angles1;
            A.angles2 = angles2;
            A.angles3 = angles3;
            A.m = m;
            A.n = n;
       end
       
       function Az = mtimes(A,z)
            one_third = size(z,1)/3;
            z1 = z(1:one_third);
            z2 = z(one_third+1:2*one_third);
            z3 = z(2*one_third+1:end);

            %disp(size(z))
            %disp(size(z1))
            %disp(A.n)
            b1 = idct2(reshape(z1, A.n, A.n));
            diff_b1 = idct2(reshape(z2, A.n, A.n));
            diff_b2 = idct2(reshape(z3, A.n, A.n));


            A1_b1 = radon(b1, A.angles1);
            A2_b1 = radon(b1, A.angles2);
            A2_diff_b1 = radon(diff_b1, A.angles2);
            A3_b1 = radon(b1, A.angles3);
            A3_diff_b2 = radon(diff_b2, A.angles3);

            row1 = A1_b1(:);
            row2 = A2_b1(:) + A2_diff_b1(:);
            row3 = A3_b1(:) + A3_diff_b2(:);

            Az = [row1 ; row2; row3];
       end 
    end   
end