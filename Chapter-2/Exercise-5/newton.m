function [x, i] = newton(f, f1, x0, imax, tol)
%
% [x, i] = newton(f, f1, x0, imax, tol) Determina uno zero della funzione 
%                                       in ingresso utilizzando il metodo di Newton.
%
fx = feval(f, x0);
f1x = feval(f1, x0);
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
if go, disp('Il metodo non converge.'), end
return