function y = hermite(xi, fi, f1i, x)
% 
% y = hermite(xi, fi, f1i, x) Calcola il polinomio interpolante di grado n 
%                             in forma di Hermite, nei punti x
%    
n = length(xi) - 1;
xh = zeros(2 * n + 2, 1);
xh(1 : 2 : 2 * n + 1) = xi;
xh(2 : 2 : 2 * n + 2) = xi;
fh = zeros(2 * n + 2, 1);
fh(1 : 2 : 2 * n + 1) = fi;
fh(2 : 2 : 2 * n + 2) = f1i;
fh = divdif(xh, fh);
y = horner(xh, fh, x);
y = y.';
return

function fh = divdif(xh, fh)
%
% fh = divdif(xh, fh) Calcola le differenze divise 
%                     sulle coppie (xh, fh)
%       
nh = length(xh) - 1;
for i = nh : -2 : 3
    fh(i) = (fh(i) - fh(i - 2)) / (xh(i) - xh(i - 1));
end
for i = 2 : nh
    for j = nh + 1 : -1 : i + 1
        fh(j) = (fh(j) - fh(j - 1)) / (xh(j) - xh(j - i));
    end
end
return

function y = horner(xh, fh, x)
%
% y = horner(xh, fh, x) Valuta il polinomio interpolante nelle ascisse xh,
%                       se il vettore fh contiene i coefficienti di p, 
%                       ordinati a partire dal termine noto
% 
nh = length(xh) - 1;
y = fh(nh + 1) * ones(size(x));
for i = nh : -1 : 1
    y = y .* (x - xh(i)) + fh(i);
end
return
