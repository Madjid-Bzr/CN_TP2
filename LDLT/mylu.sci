// la méthode de pivot partiel
function [L, U, P] = mylu(A)
    n = size(A)(1);
    row = [1:n]; //vecteur des permutations
    
    for k=1:n-1
         //récupère le max piv à la ligne ind
        [piv,ind] = max(abs(A(k:n,k)));
        
        //convertit l'indice local en indice global
        ind = k-1+ind; 
        q = row(1,ind);
        
        if (ind~=k) 
            new = A(ind,:);
            
            //échange
            A(ind,:) = A(k,:); 
            A(k,:) = new; 
            
             //mise à jour du vecteur des permutations
            row(1,ind) = row(1,k);

            row(1,k) = q;
        end
        
        A(k+1:n,k) = A(k+1:n,k)./A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end
    
    P = eye(n,n)(row,:);
    U = triu(A);
    L = eye(n,n)+tril(A,-1);

endfunction
