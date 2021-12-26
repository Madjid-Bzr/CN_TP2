
function [AA,JA,IA] = CSR(Mat)
n = size(Mat)(1);
m =  size(Mat)(2);
AA = zeros(n*m);
JA = zeros(n*m);
IA = zeros((n*m)+1);
c = 1;
for i = 1 : n
    IA(i) = c;
    for j = 1 : m
        if Mat(i,j) ~= 0 then
            AA(c) = Mat(i,j);
            JA(c) = j;
            c = c+1;
        end
    end
end
IA(n+1) = c;
AA = AA'; JA = JA'; IA = IA'

endfunction


function [Results] = Mat_Vec_Product(Mat,vec)
   
[AA,JA,IA] = CSR(Mat);

n = size(Mat)(1);
m = size(vec)(1);

Results = zeros(m,1);

for i = 1 : n
    for j = IA(i) : IA(i+1)-1
        Results(i) = Results(i) + AA(j) * vec(JA(j));
    end
end

endfunction

