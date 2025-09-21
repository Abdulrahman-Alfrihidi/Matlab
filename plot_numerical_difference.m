function plot_numerical_difference()
    % Define the function
    f = @(x) sin(x)^5 + log(1 + x^2) - (cos(x)^3) / (1 + x^4);
    
    % Inputs
    x = input('Enter the value of x: ');  
    
    % Analytical derivative using MATLAB Symbols
    syms xsym;
    f_sym = sin(xsym)^5 + log(1 + xsym^2) - (cos(xsym)^3) / (1 + xsym^4);
    f_prime = diff(f_sym, xsym); % Symbolic derivative
    f_prime_true_val = double(subs(f_prime, xsym, x)); 
    
    % Step size range for error analysis
    h_values = logspace(-5, 0, 100); % Logarithmic scale for step sizes
    forward_errors = zeros(size(h_values));
    backward_errors = zeros(size(h_values));
    central_errors = zeros(size(h_values));
    
    % Calculate errors for different step sizes
    for i = 1:length(h_values)
        h = h_values(i);
        
        % Numerical methods
        forward_difference = (f(x + h) - f(x)) / h;
        backward_difference = (f(x) - f(x - h)) / h;
        central_difference = (f(x + h) - f(x - h)) / (2 * h);
        
        % Error calculations
        forward_errors(i) = abs(f_prime_true_val - forward_difference);
        backward_errors(i) = abs(f_prime_true_val - backward_difference);
        central_errors(i) = abs(f_prime_true_val - central_difference);
    end
    
    % Plot the errors vs step sizes
    figure;
    loglog(h_values, forward_errors, 'r', 'LineWidth', 2); hold on;
    loglog(h_values, backward_errors, 'g', 'LineWidth', 2);
    loglog(h_values, central_errors, 'b', 'LineWidth', 2);
    
    % Adding labels, title, and legend
    xlabel('Step Size (h)', 'FontSize', 12);
    ylabel('Error', 'FontSize', 12);
    title('Error vs Step Size for Numerical Derivatives', 'FontSize', 14);
    legend({'Forward Difference', 'Backward Difference', 'Central Difference'}, 'Location', 'Best');
    grid on;
    
    % Display final results for user-specified h
    fprintf('=============================\n');
    fprintf('True derivative f''(x) = %.6f\n', f_prime_true_val);
    fprintf('=============================\n');
end