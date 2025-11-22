# Inverse Lagrange Interpolation Project

This repository contains MATLAB implementations of inverse Lagrange interpolation for estimating the value of x corresponding to a given y-value. The main goal is computing the root where y = 0 using two different approaches: one with zero-crossing detection and another that uses all data points without detecting sign changes.

Overview

Inverse Lagrange interpolation constructs a polynomial in terms of y rather than x. The polynomial has the form:

x(y) = Σ x_i * L_i(y)

where L_i(y) are Lagrange basis polynomials. Evaluating this expression at y = 0 provides an estimate of the root.

Features

Automatic zero-crossing detection to identify intervals containing roots.

Local inverse interpolation around each zero crossing.

Global inverse interpolation using all points.

Modular MATLAB functions for reuse.

Simple example data included.

File Structure

Inverse-Lagrange-Interpolation-Project/

Inverse_lagrange_with0_cross_detect.m

inv_lagrange_no0_cross_detect.m

inverse_lagrange_root.m

report.pdf

README.md

LICENSE

Usage
Zero-crossing detection method

roots = Inverse_lagrange_with0_cross_detect(x, y)

Detects sign changes in y, selects nearby points, and applies inverse interpolation.

Full-data method (no sign detection)

root = inv_lagrange_no0_cross_detect(x, y)

Builds an inverse Lagrange polynomial using all provided points and evaluates it at y = 0.

Core interpolation function

value = inverse_lagrange_root(x, y, target_y)

Computes x corresponding to any target y.

Example

x = [1.8 1.9 2 2.1 2.2 2.3]
y = [-1.765 -1.94 -1 0.61 2.567 3.654]

roots_local = Inverse_lagrange_with0_cross_detect(x, y)
root_global = inv_lagrange_no0_cross_detect(x, y)

Notes

Results depend on how well the data approximates a smooth function.

Using all data can reduce accuracy if the function changes shape quickly.

License

This project is released under the MIT License.
