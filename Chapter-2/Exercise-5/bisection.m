function [x, i, imax] = bisection(f, a, b, tol)
%
% [x, i, imax] = bisection(f, a, b[, tol]) Determina uno zero della funzione in ingresso,
%                                          sull'intervallo [a, b],
%                                          utilizzando il metodo di bisezione.
%
if nargin <= 3
    tol = 1E-6;
elseif tol <= 0 || tol >= 0.1
    error('Tolleranza incosistente.');
end
if b < a
    t = a;
    a = b;
    b = t;
end
fa = feval(f, a);
fb = feval(f, b);
if fa == 0
    x = a;
    return
end
if fb == 0
    x = b;
    return
end
if abs(fa) == Inf || abs(fb) == Inf
    error('Funzione non valutabile in uno degli estremi.')
    return
end
if fa * fb > 0
    error('Funzione non soddisfacente la condizione f(a) * f(b) < 0.')
    return
end

x = (a + b) / 2;
fx = feval(f, x);
imax = ceil(log2(b - a) - log2(tol * (1 + abs(x))));
for i = 2 : imax
    f1x = ((fb - fa) / (b - a));
    if abs(fx / f1x) <= tol * (1 + abs(x))
        break
    elseif fa * fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
    x = (a + b) / 2;
    fx = feval(f, x);
    imax = ceil(log2(b - a) - log2(tol * (1 + abs(x))));
end
return
