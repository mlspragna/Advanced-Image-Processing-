classdef matrix_At_2_slices    
    properties
        angles1
        angles2
        m
        n
    end    
    methods      
        function At = matrix_At_2_slices(angles1,angles2,m,n)            
            At.angles1 = angles1;
            At.angles2 = angles2;
            At.m = m;
            At.n = n;
       end
       
       function Atw = mtimes(At,w)
            mid = size(w,1)/2;
            w1 = w(1:mid);
            w2 = w(mid+1:end);

            p = size(At.angles1,2);
            At1w1 = dct2(iradon(reshape(w1, At.m, p), At.angles1, 'linear','Ram-Lak', 1,255));
            At2w2 = dct2(iradon(reshape(w2, At.m, p), At.angles2, 'linear','Ram-Lak', 1,255));

            row1 = At1w1(:)+At2w2(:);
            row2 = At2w2(:);

            Atw = [row1 ; row2];
       end 
    end   
end