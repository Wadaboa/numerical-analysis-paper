function u = gs(r)
%
% u = gs(r) risolve il sistema lineare ad hoc
%           con il metodo iterativo di Gauss-Seidel
%
n = length(r);
if n < 10, error('Dimensione minima non rispettata.'), end
u = r;
u(1) = u(1) / 4;
for i = 2 : 8
    u(i) = (u(i) + u(i - 1)) / 4;
end
for i = 1: n - 8
    u(i + 8) = (u(i + 8) + u(i) + u(i + 7)) / 4;
end
return
