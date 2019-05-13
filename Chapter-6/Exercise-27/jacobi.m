function [x, i] = jacobi(A, b, tol, imax)
%
% [x, i] = jacobi(A, b, tol, imax) risolve il sistema lineare 
%                                  Ax = b, con il metodo iterativo
%                                  di Jacobi
%
n = size(A, 1);
M = zeros(n, n); 
N = zeros(n, n);
M = diag(diag(A));
N = M - A;
[x, i] = itersolve(M, N, b, tol, imax)
return
