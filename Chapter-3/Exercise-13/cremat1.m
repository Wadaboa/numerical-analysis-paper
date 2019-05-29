function [A, b] = cremat1(m, n)
%
%  [A, b] = cremat1(m, n)     Crea una matrice A nxn ed un termine noto b,
%                             in modo che la soluzione del sistema lineare,
%                             A * x = b, nel senso dei minimi quadrati, sia
%                             x = [1, 2, ..., n]^T.
%
rng(0);
A = rand(m, n);
[q, r] = qr(A);
b = r * [1 : n]';
b(n + 1 : m) = rand(m - n, 1);
b = q * b;
return
