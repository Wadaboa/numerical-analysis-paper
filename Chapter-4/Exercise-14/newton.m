function y = newton(xi, fi, x)
%
% y = newton(xi, fi, x) calcola il polinomio interpolante le coppie (xi, fi)
%                       sulle ascisse x
%
n = length(xi); if length(fi) ~= n, error("Dati inconsistenti."), end
for i = 1 : n - 1
    for j = i + 1 : n
        if xi(i) == xi(j), error("Ascisse non distinte."), end
    end
end
fi = divdif(xi, fi);
y = fi(n) * ones(size(x));
for i = n - 1 : -1 : 1
    y = y .* (x - xi(i)) + fi(i);
end
return

function fi = divdif(xi, fi)
%
% f = divdif(xi, fi) calcola le differenze divise 
%                    sulle coppie (xi, fi)
%       
n = length(xi);
for i = 1 : n - 1
    for j = n : -1 : i + 1
        fi(j) = (fi(j) - fi(j - 1)) / (xi(j) - xi(j - i));
    end
end
return
