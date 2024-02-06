% Function to implement the midpoint rule
function result = midpoint(func, a, b, n) %function function evaluates mathematical expression over a range of given variables
    h = (b - a) / n; %The step size
    x = a + h/2 : h : b - h/2; %Array the x values
    y = func(x); %Evaluate the function at each x 
    result = h * sum(y);% The midpoint rule
end