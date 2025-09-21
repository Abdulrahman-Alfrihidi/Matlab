function x = main()
    x=0
    f = zeros(3,1)
    f1 = @(x) 1+exp(-cos(x-1));
    f2 = @(x) x.*sin(pi) - (x-2).*log(x);
    f3 = @(x) sin(x).^5 + log(1 + x.^2) - (cos(x).^3) / (1 + x.^4);
    
    start = 1
    finish = 3
    Ns = (2:1000);
    monte_carlo_integration(f1,start,finish,Ns);
    monte_carlo_integration(f2,start,finish,Ns);
    monte_carlo_integration(f3,start,finish,Ns);

    simpson_rule(f1,start,finish,Ns);
    simpson_rule(f2,start,finish,Ns);
    simpson_rule(f3,start,finish,Ns);

    trapezoidal_rule(f1,start,finish,Ns);
    trapezoidal_rule(f2,start,finish,Ns);
    trapezoidal_rule(f3,start,finish,Ns);

end
