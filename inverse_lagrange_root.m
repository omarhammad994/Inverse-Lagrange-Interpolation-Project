function x_target = inverse_lagrange_root(x, y, y_target)
% inverse_lagrange_root  Find x corresponding to a given y (default y=0)
% using Inverse Lagrange Interpolation.
%
% Usage:
%   x_target = inverse_lagrange_root(x, y)
%   x_target = inverse_lagrange_root(x, y, y_target)
%
% Inputs:
%   x        - Row or column vector of x-values
%   y        - Row or column vector of y-values
%   y_target - The target y-value (default = 0)
%
% Output:
%   x_target - Estimated x corresponding to y_target

    if nargin < 3
        y_target = 0; % Default target is root (y = 0)
    end

    n = length(x);
    x_target = 0;

    for i = 1:n
        term = x(i);
        for j = 1:n
            if i ~= j
                term = term * (y_target - y(j)) / (y(i) - y(j));
            end
        end
        x_target = x_target + term;
    end
end
