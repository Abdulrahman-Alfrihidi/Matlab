f = @(x) 1+exp(-cos(x-1))

f_sym = 1 + exp(-cos(xsym - 1));

==============

f = @(x) x*sin(pi) - (x-2)*log(x);

f_sym = xsym * sin(pi) - (xsym - 2) * log(xsym);