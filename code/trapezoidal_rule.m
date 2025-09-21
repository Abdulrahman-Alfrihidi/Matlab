function I = trapezoidal_rule(f, a, b, n)
    % make arrays for h and errors, keeps the value of h and errors
    % within it
    h = zeros(length(n), 1); 
    errors = zeros(length(n), 1); 
    
    % calculate true value once
    true_value = 0;%integral(f, a, b);
    fprintf('true value is %.6f\n',true_value);
    % loop over different n values
    for i = 1:length(n)
        % calculate step size h = (b-a)/(n-1), the larger the n, the
        % smaller the h
        h(i) = (b - a)/(n(i)-1);
        
        % create equally spaced points to apply our function on
        x = linspace(a, b, n(i));
        fx = f(x);
 
        % trapezoidal rule formula for equally spaced points, it's a bit different than the slide,
        % but this is the best possible way we could write the formula in matlab.
        estimate = h(i) * (sum(fx) - (fx(1) + fx(end))/2);
        
        % calculate error between true value and the approximation
        errors(i) = abs(estimate - true_value);
        
        % print results for each n
        %fprintf('\nResults for n = %d:\n', n(i));
        %fprintf('h = %.6f\n', h(i));
        %fprintf('approximation: %.10f\n', estimate);
        %fprintf('error: %.10f\n', errors(i));
    end
    
    % plot error vs h
    figure;
    loglog(n, errors, 'bo-', 'LineWidth', 2); % plot x,y in logarithmic scale
    grid on;
    xlabel('number of points N');
    ylabel('Value');
    title('Value vs Number of Points for Trapezoidal Rule');
    I = errors;
end


