function ret = simpson_rule(f, a, b, n)

    % calculate true value once
    true_value = 0;%integral(f, a, b);
    fprintf('true value is %.6f\n',true_value);

    h = zeros(length(n), 1);
    errors = zeros(length(n), 1);

    %loop through different sizes
    for i = 1:length(n)
        % calculate the step
        h(i) = (b - a)/(n(i)-1);
        estimate=0;
        for j = a:h(i):b-h(i)
            
            % add f(a)
            x = j;
            estimate = estimate + f(x);
            % add f(b)
            x = j+h(i);
            estimate = estimate + f(x);
            %add f((a+b)/2)
            x = j + h(i)/2;
            estimate = estimate + 4 * f(x);
        end
        
        % divide by 6 for estimate and multiply by differences of a and b
        estimate = estimate * h(i)/6.0;

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
    title("Value vs Number of points simpson");
    ret = errors;
end