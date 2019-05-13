function I4 = adapsimp(f, a, b, tol, fa, fb)
%
% I4 = adapsimp(f, a, b, tol, fa, fb) calcola l'integrale definito di f 
%                                     in [a, b], utilizzando le formule
%                                     adattative di Simpson
%
if nargin <= 4
    fa = feval(f, a);
    fb = feval(f, b);
end
h = b - a;
x2 = (a + b) / 2;
f2 = feval(f, x2);
I2 = (h / 6) * (fa + 4 * f2 + fb);
x1 = (a + x2) / 2;
f1 = feval(f, x1);
x3 = (x2 + b) / 2;
f3 = feval(f, x3);
I4 = (h / 12) * (fa + 4 * f1 + 2 * f2 + 4 * f3 + fb);
e = abs(I4 - I2) / 15;
if e > tol
    I4 = adapsimp(f, a, x2, tol / 2, fa, f2) + adapsimp(f, x2, b, tol / 2, f2, fb);
end
return
