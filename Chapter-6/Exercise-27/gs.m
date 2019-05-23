function [x, i] = gs(A, b, x0, tol, imax)
%
% [x, i] = gs(A, b[, x0[, tol[, imax]]]) risolve il sistema lineare
%                                        Ax = b, con il metodo iterativo
%                                        di Gauss-Seidel
%
[m, n] = size(A);
if m ~= n, error('Matrice non quadrata.'), end
if n ~= length(b), error('Vettore dei termini noti inconsistente.'), end
M = tril(A);
N = M - A;
if nargin <= 2
    [x, i] = itersolve(M, N, b);
elseif nargin <= 3
    [x, i] = itersolve(M, N, b, x0);
elseif nargin <= 4
    [x, i] = itersolve(M, N, b, x0, tol);
elseif nargin <= 5
    [x, i] = itersolve(M, N, b, x0, tol, imax);
end
return
