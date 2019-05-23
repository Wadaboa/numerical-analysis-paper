function [x, i] = splitting(b, matvec,msolve, x0, tol, imax)
%
% [x, i] = itersolve(b, matvec, msolve [,x0 [, tol [, imax]]]) risolve il sistema
%                                                              lineare con il metodo
%                                                              iterativo definito dalla
%                                                              function msolve
%
n = length(b);
if nargin <= 5
    if nargin <= 4
        if nargin <= 3
            x0 = zeros(n, 1);
        end
        tol = 1E-6;
    elseif tol <= 0 || tol >= 0.1
        error('Tolleranza inconsistente.');
    end
    imax = n * max(1, ceil(-log10(tol))) * 100;
end
x = x0;
tolb = tol * norm(b);
for i = 1 : imax
    r = matvec(x) - b;
    nr = norm(r);
    if nr <= tolb, break, end
    x = x - msolve(r);
end
if nr > tolb, warning('Soluzione non trovata nella tolleranza specificata.'), end
return
