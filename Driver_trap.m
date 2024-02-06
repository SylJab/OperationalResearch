clear
clc

% Define the function to be integrated
func = @(x) exp(x);

% Define the interval [a, b]
a = 0;
b = 1;

% Number of steps
n = 10;

% Hand calculation - project' requirement 
I_trap=1.718281828;

% Compute approximations using trapezium, midpoint, and Simpson's rules
approx_trap=trap(func, a, b, n);
approx_midpoint=midpoint(func, a, b, n);
approx_simpson=simpsons(func, a, b, n);

% Error
error_trap=abs(I_trap-approx_trap);
error_midpoint=abs(I_trap-approx_midpoint);
error_simpson=abs(I_trap-approx_simpson);

% Display results
fprintf('Approximation using Trapezium Rule: %.6f\n', approx_trap);
fprintf('Error for Trapezium Rule: %.6f\n\n', error_trap);
fprintf('Approximation using Midpoint Rule: %.6f\n', approx_midpoint);
fprintf('Error for Midpoint Rule: %.6f\n\n', error_midpoint);
fprintf('Approximation using Simpsons Rule: %.6f\n', approx_simpson);
fprintf('Error for Simpson''s Rule: %.6f\n\n', error_simpson);

% Plot the function and approximations
x_vals = linspace(a, b, 10);  
y_vals = func(x_vals);

figure;
plot(x_vals, y_vals, 'LineWidth', 2, 'DisplayName', 'Original Function');
hold on; 

% Plot the approximations
scatter(a, 0, 'ro', 'DisplayName', 'Start Point');
scatter(b, 0, 'ro', 'DisplayName', 'End Point');
plot([a, b], [0, 0], 'r--', 'DisplayName', 'Integration Interval');

% Highlight the area under the curve for each method 
highlight_trapezium = patch([a, linspace(a, b, n+1), b], [0, func(linspace(a, b, n+1)), 0], 'b', ...%patch function creates shaded regions under the curve for each numerical integration methods 
    'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Area under Trapezium Rule'); %FaceAlpha and EdgeColor are peremiters in patch function determinating transparency and the color of the edges respectively

highlight_midpoint = patch([a, a + n*(b-a)/n, b], [0, func(a + n*(b-a)/n), 0], 'g', ...
    'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Area under Midpoint Rule');

highlight_simpson = patch([a, linspace(a, b, 2*n+1), b], [0, func(linspace(a, b, 2*n+1)), 0], 'm', ...
    'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Area under Simpson''s Rule');

hold off;

title('Numerical Integration Methods');
xlabel('x');
ylabel('y');
legend('show');
grid on;
