% Function to implement the trapezium rule
function result = trap(func, a,b,n) %function function evaluates mathematical expression over a range of given variables
    h = (b - a) / n;% The step size
    x = a:h:b;% Array of x values
    y = func(x);% Evaluate the function at each x value
    result = h * (sum(y) - 0.5 * (y(1) + y(end)));% The trapezium rule 
end