function y = spline3(xi, fi, x)
%
% y = spline3(xi, fi, x) Calcola la spline cubica naturale
%                        su una partizione assegnata e
%                        la valuta nelle ascisse date
%
if any(size(xi) ~= size(fi)) || size(xi, 2) ~= 1
    error('xi e fi devono essere vettori della stessa lunghezza.');
end
if length(xi) < 3, error('Sono necessari almeno 3 punti.'), end
[xi, p] = sort(xi);
fi = fi(p);

h = xi(2 : end) - xi(1 : end - 1);
n = length(h);

phi = h(1 : n - 1) ./ (h(1 : n - 1) + h(2 : n));
csi = 1 - phi;

d = (fi(2 : end) - fi(1 : end - 1)) ./ h;
b = 6 * ((d(2 : n) - d(1 : n - 1)) ./ (h(1 : n - 1) + h(2 : n)));

lower = phi(2 : n - 1);
main = 2 * ones(n - 1, 1);
upper = csi(1: n - 2);

m = [0; trid(main, lower, upper, b); 0];

ri = fi(1 : end - 1) - (h.^2 .* m(1 : end - 1)) / 6;
qi = d - (h .* (m(2 : end) - m(1 : end - 1))) / 6;

l = length(x);
y = zeros(l, 1);
for j = 1 : l
    if x(j) < xi(1) || x(j) > xi(end)
        error('Funzione interpolante non valutabile nelle ascisse date.')
    end
    i = 1;
    while i < n + 1 && xi(i) <= x(j), i = i + 1; end 
    y(j) = ( (x(j) - xi(i - 1))^3 * m(i) + (xi(i) - x(j))^3 * m(i - 1) ) / (6 * h(i - 1));
    y(j) = y(j) + qi(i - 1) * (x(j) - xi(i - 1)) + ri(i - 1);
end
return
