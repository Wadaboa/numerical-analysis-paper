function [A, a, d] = lstsquare(xi, fi, tol)
%
% lstsquare(xi, fi[, tol]) calcola il grado minimo, e i relativi coefficienti,
%                          del polinomio che meglio approssima le coppie (xi, fi)
%                          nel senso dei minimi quadrati
%
n = length(xi);
if n ~= length(fi), error('I dati devono essere vettori della stessa lunghezza.'), end
if nargin <= 2
    tol = 1E-6;
elseif tol <= 0 || tol >= 0.1
    error('Tolleranza inconsistente.');
end
nr = Inf(n - 1, 1);
A = zeros(n - 1, n - 1);
X = fliplr(vander(xi'));
for m = 1 : n - 1
    V = X(1 : end, 1 : m);
    QR = myqr(V);
    A(1 : m, m) = qrsolve(QR, fi);
    nr(m) = norm(V * A(1 : m, m) - fi, 2) ^ 2;
end
good = nr(nr <= tol);
if length(good) <= 0, warning('Approssimazione non trovata nella tolleranza richiesta.'), end
d = find(good==min(good), 1);
a = A(1 : d, d);
return
