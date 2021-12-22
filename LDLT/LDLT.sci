
function [L,D]=LdlT(A)

n = size(A)(1);
L = tril(A);
D = diag(A);
v = zeros(n,1);

v(1) = D(1);
L(2:n,1) = A(2:n,1) / D(1);
for j = 2 : n
    for i = 1 : j-1
        v(i) = L(j,i) * D(i);
    end
    D(j) = A(j,j) - L(j,1:j-1) * v(1:j-1);
    L(j+1:n,j) = (A(j+1:n,j) - L(j+1:n,1:j-1) * v(1:j-1)) / D(j);
end

endfunction

