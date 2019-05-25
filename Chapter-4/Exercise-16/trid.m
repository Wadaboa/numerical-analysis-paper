function x = trid(a, b, c, f)
%
% x = trid(a, b, c, f) risolve il sistema tridiagonale con 
%                      diagonale principale a, sotto-diagonale b 
%                      e sopra-diagonale c, con vettore dei termini noti f
%
n = length(a);
if n ~= length(f) || length(b) >= n || length(c) >= n, error('Dati inconsistenti.'), end
d = a;
l = b;
x = f;
for i = 1 : n - 1
    if d(i) == 0, error('Matrice non fattorizzabile LU.'), end
    l(i) = b(i) / d(i);
    x(i + 1) = x(i + 1) - l(i) * x(i);
    d(i + 1) = d(i + 1) - l(i) * c(i);
end
if d(n) == 0, error('Matrice non fattorizzabile LU.'), end
x(n) = x(n) / d(n);
for i = n - 1 : -1 : 1
    x(i) = (x(i) - c(i) * x(i + 1)) / d(i);
end
return
