function u = jacobi(r, A)
%
% u = jacobi(r, A) risolve il sistema lineare con
%                  il metodo iterativo di Jacobi
%
d = diag(diag(A));
u = r ./ d;
return
