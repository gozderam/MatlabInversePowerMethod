function [table] = eps_iter(n, k)
eps_v = [0.00000001, 0.0000001, 0.000001, 0.00001, 0.0001, 0.001];
iterations = zeros(1, length(eps_v));
for i =1:length(eps_v)
    TAB = test(n, k, eps_v(i));
    iterations(i) = mean(cell2mat(TAB(:, 4)));
end
table = [eps_v', iterations'];
end

