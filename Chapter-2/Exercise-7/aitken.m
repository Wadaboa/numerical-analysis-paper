function [x, i] = aitken(f, f1, x0, imax, tol)
%
% [x, i] = aitken(f, f1, x0[, imax[, tol]]) Determina uno zero della funzione
%                                           in ingresso, con molteplicita' multipla,
%                                           utilizzando il metodo di Aitken.
%
if nargin <= 4
    tol = 1E-6;
    if nargin <= 3
        imax = ceil(-log10(tol)) * 100;
    end
elseif tol <= 0 || tol >= 0.1
    error('Tolleranza incosistente.');
end
x = x0;
i = 0;
go = 1;
while go && i < imax
    i = i + 1;
    x0 = x;
    fx = feval(f, x0);
    f1x = feval(f1, x0);
    if f1x == 0, error('La derivata prima ha assunto valore zero, impossibile continuare.'),end
    x1 = x0 - fx / f1x;
    fx = feval(f, x1);
    f1x = feval(f1, x1);
    if f1x == 0
        if abs(x1 - x0) < tol * (1 + abs(x))
            x = x1;
            warning('Nella tolleranza richiesta, ma con approssimazioni intermedie al metodo di Aitken.');
            return
        end
        error('La derivata prima ha assunto valore zero, impossibile continuare.')
    end
    x = x1 - fx / f1x;
    t = (x - 2 * x1 + x0);
    if t == 0
        if abs(x - x1) < tol * (1 + abs(x))
            warning('Nella tolleranza richiesta, ma con approssimazioni intermedie al metodo di Aitken.');
            return
        end
        error('Impossibile determinare la radice nella tolleranza desiderata.')
    end
    x = (x * x0 - (x1)^2) / t;
    go = abs(x - x0) > tol * (1 + abs(x));
end
if go, warning('Il metodo non converge.'), end
return
