function u = jacobi(r)
%
% u = jacobi(r) risolve il sistema lineare ad hoc
%               con il metodo iterativo di Jacobi
%
n = length(r);
if n < 10, error('Dimensione minima non rispettata.'), end
u = r / 4;
return
