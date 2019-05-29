function [x, i] = newton(f, f1, x0, imax, tol)
%
% [x, i] = newton(f, f1, x0[, imax[, tol]]) Determina uno zero della funzione
%                                           in ingresso utilizzando il metodo di Newton.
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
    x0 = x;
    fx = feval(f, x0);
    f1x = feval(f1, x0);
    if f1x == 0, error('La derivata prima ha assunto valore zero, impossibile continuare.'), end
    x = x0 - fx / f1x;
    go = abs(x - x0) > tol * (1 + abs(x));
end
if go, warning('Il metodo non converge.'), end
return
