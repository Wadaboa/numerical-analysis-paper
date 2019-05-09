function QR = myqr(A)
%
% QR = myqr(A) calcola la fattorizzazione QR della 
%              matrice sovradeterminata A
%
[m, n] = size(A);
if m < n, error('Numero di righe della matrice minore del numero di colonne.'); end
QR = A;
for i = 1 : n
    alfa = norm(QR(i : m, i));
    if alfa == 0, error('La matrice A non ha rango massimo.'); end
    if QR(i, i) >= 0, alfa = -alfa; end
    v1 = QR(i, i) - alfa;
    QR(i, i) = alfa;
    QR(i + 1 : m, i) = QR(i + 1 : m, i) / v1;
    beta = v1 / alfa;
    v = [1; QR(i + 1 : m, i)];
    QR(i : m, i + 1 : n) = QR(i : m, i + 1: n) + (beta * v) * (v' * QR(i : m, i + 1 : n));
end
return
