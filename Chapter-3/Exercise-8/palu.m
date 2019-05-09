function [A, p] = palu (A)
%
% function [A, p] = palu (A) calcola la fattorizzazione LU con pivoting parziale e 
%                            restituisce la matrice fattorizzata e il vettore
%                            contentente l'informazione relativa alla matrice 
%                            di permutazione
%
[m, n] = size(A);
if m ~= n
    error('Matrice non quadrata.');
end
p = 1 : n;
for i = 1 : n - 1
    [mi, ki] = max(abs(A(i : n, i)));
    if mi == 0 
        error('Matrice singolare.')
    end
    ki = ki + i - 1;
    if ki > i
        A([i ki], :) = A([ki i], :);
        p([i ki]) = p([ki i]);
    end
    A(i + 1 : n, i) = A(i + 1 : n, i) / A(i, i);
    A(i + 1 : n, i + 1 : n) = A(i + 1 : n, i + 1 : n) - A(i + 1 : n, i) * A(i, i + 1 : n);
end
p = p';
return
