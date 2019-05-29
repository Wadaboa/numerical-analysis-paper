function x = palusolve(LU, p, b)
%
% x = palusolve(LU, p, b) risolve il sistema lineare LUx = b,
%                         con LU matrice fattorizzata LU
%                         con pivoting parziale
%
x = b;
[m, n] = size(LU);
if n ~= length(x) || m ~= n, error("Dati inconsistenti."), end
x = infsolve(LU, x(p));
x = supsolve(LU, x);
return

function [x] = infsolve(L, x)
n = length(x);
for i = 1 : n
    x(i + 1 : n) = x(i + 1 : n) - L(i + 1 : n, i) * x(i);
end
return

function [x] = supsolve(U, x)
n = length(x);
for i = n : -1 : 1
    x(i) = x(i) / U(i, i);
    x(1 : i - 1) = x(1 : i - 1) - U(1 : i - 1, i) * x(i);
end
return
