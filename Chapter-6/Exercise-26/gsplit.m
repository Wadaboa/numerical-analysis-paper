function [x, i] = gsplit(A, b, msolve, x0, tol, imax)
%
% [x, i] = gsplit(A, b, msolve [,x0 [, tol [, imax]]]) risolve il sistema
%                                                      lineare con il metodo
%                                                      iterativo definito dalla
%                                                      function msolve
%
[m, n] = size(A);
if m ~= n, error('Matrice non quadrata.'), end
if n ~= length(b), error('Vettore dei termini noti inconsistente.'), end
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
    r = A * x - b;
    nr = norm(r);
    if nr <= tolb, break, end
    x = x - msolve(r, A);
end
if nr > tolb, warning('Soluzione non trovata nella tolleranza specificata.'), end
return
