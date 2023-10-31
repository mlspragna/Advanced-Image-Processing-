classdef matrix_At    
    properties 
        angles
        m
        n
    end    
    methods      
        function At = matrix_At(angles,m,n) 
            At.angles = angles;
            At.m = m;
            At.n = n;
       end
       
       function Atw = mtimes(At,w)
           [dummy,p] = size(At.angles);
           %disp(p);
           %disp(size(w));
           w = iradon(reshape(w,At.m,p), At.angles, 'linear','Ram-Lak', 1, 255);
           Atw = dct2(w);
           Atw = Atw(:);
       end 
    end   
end