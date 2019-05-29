function u = gs(r, A)
%
% u = gs(r, A) risolve il sistema lineare con
%              il metodo iterativo di Gauss-Seidel
%
u = r;
n = length(r);
for i = 1 : n
    u(i) = u(i) / A(i, i);
    u(i + 1 : n) = u(i + 1 : n) - A(i + 1 : n, i) * u(i);
end
return
