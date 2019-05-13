function y = spline3(xi,fi,x)
%
% y = spline3(xi,fi,x) Calcola la spline cubica not-a-knot
%                      su una partizione assegnata
%
if any(size(xi) ~= size(fi)) || size(xi,2) ~= 1
    error('xi e fi devono essere vettori della stessa lunghezza.');
end

n = length(xi);

h = xi(2:n) - xi(1:n-1);
d = (fi(2:n) - fi(1:n-1))./h;

lower = h(2:end);
main  = 2*(h(1:end-1) + h(2:end));
upper = h(1:end-1);

T = spdiags([lower main upper], [-1 0 1], n-2, n-2);
rhs = 6*(d(2:end)-d(1:end-1));

m = T\rhs;

m = [m(1)+m(2)+m(3); m; m(n)+m(n-1)+m(n-2)];

s0 = fi;
s1 = d - h.* (2 * m(1:end-1) + m(2:end)) / 6;
s2 = m / 2;
s3 =( m(2:end) - m(1:end-1)) ./ (6 * h);

l = length(x);
y =zeros(l,1);
for j = 1:l
    if x(j) < xi(1) || x(j) > xi(n)
        error('Funzione interpolante non valutabile nelle ascisse date.')
    end
    i=1;
    while xi(i)<x(j),i=i+1;end
    i=i-1;
    y(j) = s0(i) + s1(i) * (x(j) - xi(i)) + s2(i) * (x(j) - xi(i)) .^2 + s3(i) * (x(j) - xi(i)) .^3;
end
return
