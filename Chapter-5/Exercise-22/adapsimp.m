function I4 = adapsimp(f, a, b, tol, fa, fb, f1)
%
% I4 = adapsimp(f, a, b[, tol]) calcola l'integrale definito di f
%                               in [a, b], utilizzando le formule
%                               adattative di Simpson
%
I4 = 0;
if a == b, return, end
if b < a
    t = a;
    a = b;
    b = t;
end
x1 = (a + b) / 2;
if nargin <= 4
    if nargin <= 3
        tol = 1E-6;
    elseif tol <= 0 || tol >= 0.1
        error('Tolleranza inconsistente.');
    end
    fa = feval(f, a);
    fb = feval(f, b);
    f1 = feval(f, x1);
end
h = (b - a) / 6;
x2 = (a + x1) / 2;
f2 = feval(f, x2);
x3 = (x1 + b) / 2;
f3 = feval(f, x3);
I2 = h * (fa + 4 * f1 + fb);
I4 = 0.5 * h * (fa + 4 * f2 + 2 * f1 + 4 * f3 + fb);
e = abs(I4 - I2) / 15;
if e > tol
    I4 = adapsimp(f, a, x1, tol / 2, fa, f1, f2) + ...
         adapsimp(f, x1, b, tol / 2, f1, fb, f3);
end
return
