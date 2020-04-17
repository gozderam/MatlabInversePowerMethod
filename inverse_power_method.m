function [w, it_count] = inverse_power_method(A, x0, eps)
% Function INVERSE_POWER_METHOD returns the lowest eigen value w of matrix
% A and the number of iterations it_count. It uses inverse power method
% (with normalization).
% Initial approximation of eigen vector is x0 and precison is eps. 

if(det(A)==0) 
    error("Inverse power moethod cannot be used because det(A)=0");
end

% initial values
iter_counter=0;
wk = 0;
wk1 = 1;
xk1 = x0;

% iterations 
while (iter_counter<100000 && abs(wk1-wk)>=eps )
    iter_counter=iter_counter+1;
    xk = xk1;
    yk1 = GEPP(A, xk);
    xk1 = yk1/norm(yk1);
    wk = wk1;
    wk1 = (yk1'*xk)/(xk'*xk);
end

if(iter_counter==100000) 
    disp("The iteration limit has been reached.");
end

w = 1/wk1;
it_count = iter_counter;
end



