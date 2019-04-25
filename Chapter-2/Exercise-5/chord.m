function [x, i] = chord(f, f1, x, imax, tol)
%
% [x, i] = chord(f, f1, x, imax, tol) Determina uno zero della funzione 
%                                     in ingresso utilizzando il
%                                     metodo delle corde.
%
f1x = feval(f1, x);
if f1x == 0, error('La derivata prima ha valore nullo, impossibile continuare.'), end
go = 1;
i = 0;
while go && i < imax
    i = i + 1;
    x0 = x;
    fx = feval(f, x0);
    x = x0 - fx / f1x;
    go = abs(x - x0) > tol * (1 + abs(x));
end
if go, disp('Il metodo non converge.'), end
return
