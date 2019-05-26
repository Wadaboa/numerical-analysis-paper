function y = lagrange(xi, fi, x)
%
% y = lagrange(xi, fi, x) calcola il polinomio interpolante le coppie (xi, fi)
%                         sulle ascisse x
%
n = length(xi); if length(fi) ~= n, error('Dati inconsistenti.'), end
for i = 1 : n - 1
    for j = i + 1 : n
        if xi(i) == xi(j), error('Ascisse non distinte.'), end
    end
end
y = zeros(size(x));
for i = 1 : n
    if fi(i) ~= 0
        li = 1;
        for k = [1 : i - 1 i + 1 : n]
            li = li .* (x - xi(k)) / (xi(i) - xi(k));
        end
        y = y + fi(i) * li;
    end
end
return
