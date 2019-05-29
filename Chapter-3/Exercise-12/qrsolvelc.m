function x = qrsolvelc(A, QR, x)
%
% x = qrsolvelc(A, QR, x)  Function per la risoluzione di sistemi lineari
%                          data una matrice A iniziale e la matrice QR
%                          contenente le parti significative di
%                          una fattorizzazione QR di Householder,
%                          della matrice A, che computa g = Q.'b
%                          e in seguito Rx = g.
%
[m, n] = size(A);
Q = eye(m);
Q(1 : m, 1) = A(1 : m, 1) / QR(1, 1);
for j = 2 : n
    sum = zeros(m, 1);
    for i = 1 : j
        if i < j
            sum = sum + QR(i, j) * Q(1 : m, i);
        end
    end
    Q(1 : m, j) = (A(1 : m, j) - sum) / QR(j, j);
end
x = Q.' * x;
x = supsolve(QR, x);
x = x(1 : n);
end
