function [x, i] = itersolve(M, N, b, x0, tol, imax)
%
% [x, i] = itersolve(M, N, b [,x0 [, tol [, imax]]]) risolve il sistema lineare, con
%                                                    matrice dei coefficienti definita
%                                                    da un generico splitting M - N, in
%                                                    modo iterativo
%
n = length(b);
if rank(M) ~= n, error('Matrice M singolare.'), end
if nargin <= 5
    if nargin <= 4
        if nargin <= 3
            x0 = rand(n, 1);
        end
        tol = 1E-6;
    elseif tol <= 0 || tol >= 0.1
        error('Tolleranza inconsistente.');
    end
    imax = n * max(1, ceil(-log10(tol))) * 100;
end
x = x0;
A = M - N;
for i = 1 : imax
    r = A * x - b;
    nr = norm(r, inf);
    if nr <= tol, break, end
    x = x - M\r;
end
if nr > tol, warning('Soluzione non trovata nella tolleranza specificata.'), end
return
