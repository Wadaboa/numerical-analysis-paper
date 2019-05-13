function [lambda, i] = power(A, tol, x0, imax)
%
% [lambda, i] = power(A, tol, x0, imax) calcola l'autovalore dominante
%                                       semplice della matrice in input,
%                                       utilizzando il metodo delle potenze
%
n = size(A, 1);
if nargin <= 2
    x = rand(n,1);
else
    x = x0;
end
x = x / norm(x);
if nargin <= 3
    imax = 100 * n * round( - log(tol));
end
lambda = inf;
for i = 1 : imax
    lambda0 = lambda;
    v = A * x;
    lambda = x' * v;
    err = abs(lambda - lambda0);
    if err <= tol
        break;
    end
    x = v / norm(v);
end
if err > tol
    error('Autovalore non trovato nella tolleranza specificata.');
end
return
