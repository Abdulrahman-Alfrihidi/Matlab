function ret = monte_carlo_integration(f, a, b, n)

    % calculate true value once
    true_value = 0;%integral(f, a, b);
    fprintf('true value is %.6f\n',true_value);

    h = zeros(length(n), 1);
    errors = zeros(length(n), 1);

    %loop through different sizes
    for i = 1:length(n)
        % calculate the random points
        
        x = a + (b - a) * rand(n(i), 1);
        % get their mean, so that every y has equal weight
        sum = 0;
        for j = 1:length(x)
            sum = sum+f(x(j));
        end
        mean = sum / length(x);
        % multiply by width
        estimate = mean * (b-a);
        
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
    xlabel('n, how many points chosen');
    ylabel('Value');
    title("Value vs Number of random points monte carlo");
    ret = errors;
end