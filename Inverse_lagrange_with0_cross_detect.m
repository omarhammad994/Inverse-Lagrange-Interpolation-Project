% Inverse lagrange using zero detection method

% --- Given data ---
x = [1.8 1.9 2 2.1 2.2 2.3];
y = [-1.765 -1.94 -1 0.61 2.567 3.654];

fprintf('Input Data:\n');
disp(table(x', y', 'VariableNames', {'x','y'}));

% --- Step 1: Find all sign changes in y ---
sign_change_idx = find(y(1:end-1) .* y(2:end) < 0);

if isempty(sign_change_idx)
    error('No zero crossings found in data!');
end

roots_all = []; % to store roots

% --- Step 2: Loop over each sign change ---
for k = 1:length(sign_change_idx)
    i = sign_change_idx(k);

    % Choose nearby points (1 before and 2 after if possible)
    idx_start = max(i-1, 1);
    idx_end   = min(i+2, length(x));

    x_local = x(idx_start:idx_end);
    y_local = y(idx_start:idx_end);

    fprintf('\nZero crossing #%d detected between x = %.3f and x = %.3f\n', ...
        k, x(i), x(i+1));
    disp(table(x_local', y_local', 'VariableNames', {'x','y'}));

    % --- Step 3: Estimate root using inverse Lagrange interpolation ---
    root = inverse_lagrange_root(x_local, y_local);
    roots_all(end+1) = root;

    fprintf('→ Estimated real root #%d: x = %.6f\n', k, root);
end

% --- Step 4: Display summary ---
fprintf('\nAll detected roots:\n');
disp(roots_all');
