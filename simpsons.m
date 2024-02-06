% Function to implement Simpson's rule
function result = simpsons(func,a,b,n) %function function evaluates mathematical expression over a range of given variables 
    h = (b - a) / n; %The step size
    x = a:h:b; %Array of x values
    y = func(x); %Evaluate the function at each x value 
    result = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));% Simpson's rule
end