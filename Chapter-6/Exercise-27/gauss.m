function [x, i] = gauss(A, b, tol, imax)
%
% [x, i] = gauss(A, b, tol, imax) risolve il sistema lineare 
%                                 Ax = b, con il metodo iterativo
%                                 di Gauss-Seidel
%
n = size(A, 1);
M = zeros(n, n); 
N = zeros(n, n);
M = triu(A);
N = M - A;
[x, i] = itersolve(M, N, b, tol, imax)
return
