% Inverse Lagrange interpolation using all data points (no zero detection)
% Solves for x when y = 0

% --- Given data ---
x = [1.8 1.9 2 2.1 2.2 2.3];
y = [-1.765 -1.94 -1 0.61 2.567 3.654];

fprintf('Input Data:\n');
disp(table(x', y', 'VariableNames', {'x','y'}));

% --- Compute root using complete inverse Lagrange polynomial ---
target_y = 0;
root = 0;

n = length(x);

for i = 1:n
    % Compute L_i(target_y)
    Li = 1;
    for j = 1:n
        if j ~= i
            Li = Li * (target_y - y(j)) / (y(i) - y(j));
        end
    end

    % Add contribution to x(0)
    root = root + x(i) * Li;
end

fprintf('\nEstimated root using FULL inverse Lagrange interpolation:\n');
fprintf('x = %.10f\n', root);