classdef matrix_At_3_slices    
    properties
        angles1
        angles2
        angles3
        m
        n
    end    
    methods      
        function At = matrix_At_3_slices(angles1,angles2,angles3,m,n)            
            At.angles1 = angles1;
            At.angles2 = angles2;
            At.angles3 = angles3;
            At.m = m;
            At.n = n;
       end
       
       function Atw = mtimes(At,w)
            one_third = size(w,1)/3;
            w1 = w(1:one_third);
            w2 = w(one_third+1:2*one_third);
            w3 = w(2*one_third+1:end);

            p = size(At.angles1,2);
            At1w1 = dct2(iradon(reshape(w1, At.m, p), At.angles1, 'linear','Ram-Lak', 1,255));
            At2w2 = dct2(iradon(reshape(w2, At.m, p), At.angles2, 'linear','Ram-Lak', 1,255));
            At3w3 = dct2(iradon(reshape(w3, At.m, p), At.angles3, 'linear','Ram-Lak', 1,255));

            row1 = At1w1(:)+At2w2(:)+At3w3(:);
            row2 = At2w2(:);
            row3 = At3w3(:);

            Atw = [row1 ; row2 ; row3];
       end 
    end   
end