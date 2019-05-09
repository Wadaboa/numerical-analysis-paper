function x = qrsolve(QR, b)
%
% x = qrsolve(QR, b) Risolve sistemi lineari data la matrice QR 
%                    contenente le parti significative di una fattorizzazione 
%                    QR di Householder, che computa g = Q.'b e in seguito Rx = g
%
B = QR;
[m, n] = size(B);
if m < n || m ~= length(b), error('Sistema non risolvibile.'); end
x = b(:);
for i = 1 : n
    v = [1; B(i + 1 : m, i)];
    beta = 2 / (v' * v);
    x(i : m) = x(i : m) - (beta * (v' * x(i : m))) * v;
end
r = norm(x(n + 1 : m));
x = x(1 : n);
for i = n : -1 : 1
    x(i) = x(i) / B(i, i);
    x(1 : i - 1) = x(1 : i - 1) - B(1 : i - 1, i) * x(i);
end
return
