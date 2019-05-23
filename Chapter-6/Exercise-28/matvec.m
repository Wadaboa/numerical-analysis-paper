function y = matvec(x)
%
% y = matvec(x) calcola il prodotto ad hoc
%               matrice vettore
%
y = 4 * x;
y(1 : end - 1) = y(1 : end - 1) - x(2 : end);
y(2 : end) = y(2 : end) - x(1 : end - 1);
y(1 : end - 8) = y(1 : end - 8) - x(9 : end);
y(9 : end) = y(9 : end) - x(1 : end - 8);
return
