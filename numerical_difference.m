% Function to calculate forward difference using Taylor expansion
function numerical_difference()
    % Define the function
    f = @(x) sin(x)^5 + log(1 + x^2) - (cos(x)^3) / (1 + x^4);
    
    % Inputs
    x = input('Enter the value of x: '); 
    h = input('Enter the step size h: '); 
    
    % Analytical Derrivate using Matlab Symbols
    syms xsym;
    f_sym = sin(xsym)^5 + log(1 + xsym^2) - (cos(xsym)^3) / (1 + xsym^4);
    f_prime = diff(f_sym, xsym); % Symbolic derivative
    f_prime_true_val = double(subs(f_prime, xsym, x)); 
    
    % Numerical Difference Methods
    forward_difference = (f(x + h) - f(x)) / h;
    backward_difference = (f(x) - f(x - h)) / h;
    central_difference = (f(x+h)-f(x-h))/(2*h);

    % Error calculations
    forward_error = abs(f_prime_true_val - forward_difference);
    backward_error = abs(f_prime_true_val - backward_difference);
    central_error = abs(f_prime_true_val - central_difference);

    % Display results
    fprintf('=============================\n');
    fprintf('True derivative f''(x) = %.6f\n', f_prime_true_val);
    fprintf('Forward difference approximation = %.6f , Error = %.6f\n', forward_difference,forward_error);
    fprintf('Backward difference approximation = %.6f , Error = %.6f\n', backward_difference,backward_error);
    fprintf('Central difference approximation = %.6f , Error = %.6f\n', central_difference,central_error);
end