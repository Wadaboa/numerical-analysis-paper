function [l1, x1, i] = mypower(A, x0, tol, imax)
%
% [l1, x1, i] = mypower(A[, x0[, tol[, imax]]]) calcola l'autovalore dominante
%                                               semplice della matrice in input,
%                                               utilizzando il metodo delle potenze
%
[m, n] = size(A);
if m ~= n, error('Matrice non quadrata.'), end
if nargin <= 3
   if nargin <=2
        if nargin <= 1
            x0 = rand(n, 1);
        end
        tol = 1E-6;
    elseif tol <= 0 || tol >= 0.1
        error('Tolleranza inconsistente.');
    end
    imax = ceil(-log10(tol));
end
x = x0;
l1 = 0;
for i = 1 : imax
    x1 = x / norm(x);
    x = A * x1;
    l0 = l1;
    l1 = x1' * x;
    e = abs(l1 - l0);
    if e <= tol * (1 + abs(l1)), break, end
end
if e > tol * (1 + abs(l1)), warning('Autovalore non trovato nella tolleranza specificata.'), end
return
