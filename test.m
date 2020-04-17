function [TAB] = test(n, k, eps)
% Function TEST returns matrix TAB of size k x 4. It generaltes k matrices
% of size n x n and tries to find the least eigen values of each matrix.
% First colums of TAB is the information whether or not the assumptions for inverse power method are
% met: "should be correct" - all assumptions are met, "assumptions are not met" 
% - some assumption (or several assumptions) is (are) not met, "det(A) = 0" - determinant of A equals 0"

TAB = cell(k, 4);

for i=1:k
    A = rand(n) + 1i*rand(n);
    %A = [4 0 2 3; 0 4 2 1; 0 0 4 1; 0 0 0 5];
    %A = [4 9 2 3; 8 18 4 6; 0 0 4 1; 0 0 0 5];
    if(det(A)~=0)
        % using Matlab functions
        [V, D] = eig(A);
        abs_eigen_val_vect = max(abs(D));
        [~,qq]=min(abs_eigen_val_vect);
        v0 = rand(1,1)*V(:, qq) + rand(n, 1) + 1i*rand(n, 1);
        min_eigen_val = nonzeros(D(:, qq)');
        no_min_eigen_val = sum(abs_eigen_val_vect(:) == abs(min_eigen_val)); 
        if(no_min_eigen_val==1 && det(V)~=0) 
            % using inverse_power_method
            TAB{i, 1} = "should be correct";
            TAB{i, 2} = min_eigen_val;
            [TAB{i, 3}, TAB{i, 4}] = inverse_power_method(A, v0, eps);   
        else
            TAB{i, 1} = "assumptions are not met";
        end
        
    else
         TAB{i, 1} = "det(A) = 0";
    end
    
end
end

