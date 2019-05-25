function xi = ceby(n, a, b)
% 
% xi = ceby(n, a, b) Calcola le ascisse di Chebyshev 
%                    sull'intervallo [a, b]
%
if n <= 0, error('Il grado del polinomio deve essere almeno 1.'), end
if b < a
    t = a
    a = b
    b = t
end
xi = zeros(n + 1, 1);
for i = 0 : n
    xi(n + 1 - i) = (a + b) / 2 + cos(pi * (2 * i + 1) / (2 * (n + 1))) * (b - a) / 2;
end
return
