function [x, i] = itergs(A, b, x0, tol, imax)
%
% [x, i] = itergs(A, b, x0, tol, imax) risolve il sistema lineare
%                                      Ax = b, con il metodo iterativo
%                                      di Gauss-Seidel
%
[m, n] = size(A);
if m ~= n, error('Matrice non quadrata.'), end
if n ~= length(b), error('Vettore dei termini noti inconsistente.'), end
M = tril(A);
N = M - A;
[x, i] = itersolve(M, N, b, x0, tol, imax);
return
