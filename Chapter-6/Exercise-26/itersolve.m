function [x, i] = itersolve(M, N, b, tol, imax)
%
% [x, i] = itersolve(M, N, b, tol, imax) risolve il sistema lineare, con
%                                        matrice dei coefficienti definita
%                                        da un generico splitting M - N, in
%                                        modo iterativo
%
n = size(M, 1);
x0 = zeros(n, 1);
i = 0;
nx = norm(x0); 
diff = 10^300;
x = x0;
while diff > tol * nx && i < imax
    i = i + 1;
    x0 = x;
    x = M \ (N * x + b);
    nx = norm(x);
    diff = norm(x - x0);
end
if diff > tol
    error('Soluzione non trovata nella tolleranza specificata.');
end
return
