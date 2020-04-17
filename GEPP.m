function [x] = GEPP(A, b)
% Fucntion GEPP returns solution vector for system of linear equations Ax =
% b, using Gaussian Elimination with Partial Pivoting.

N = length(A(1, :));
A = [A, b];
x = zeros(N, 1);

% elimination
for i = 1:N-1
    [~, max_row] = max(abs(A(i:N, i)));
    max_row = max_row + i -1;
    A([i, max_row], :) = A([max_row, i], :);
    A((i+1):N, :) = A((i+1):N, :) - (A((i+1):N, i)/A(i, i)) .* A(i, :);
end

% solution vecotor
for i =N:-1:1
    x(i) = (A(i, N+1) - (A(i, 1:N)) * x)/A(i, i);
end
