function [x, i] = secant(f, f1, x0, imax, tol)
%
% [x, i] = secant(f, f1, x0[, imax[, tol]]) Determina uno zero della funzione
%                                           in ingresso utilizzando il
%                                           metodo delle secanti.
%
if nargin <= 4
    tol = 1E-6;
    if nargin <= 3
        imax = ceil(-log10(tol)) * 100;
    end
elseif tol <= 0 || tol >= 0.1
    error('Tolleranza incosistente.');
end
fx = feval(f, x0);
f1x = feval(f1, x0);
if f1x == 0, error('La derivata prima ha assunto valore zero, impossibile continuare.'), end
x = x0 - fx / f1x;
i = 0;
go = 1;
while go && i < imax
    i = i + 1;
    fx0 = fx;
    fx = feval(f, x);
    t = (fx - fx0);
    if t == 0, error('Impossibile determinare la radice nella tolleranza desiderata.'), end
    x1 = (fx * x0 - fx0 * x) / t;
    x0 = x;
    x = x1;
    go = abs(x - x0) > tol * (1 + abs(x));
end
if go, warning('Il metodo non converge.'), end
return
