xdata = [100:100:1000];

for n = xdata;
    i=n/100;

    A=rand(n,n);
    B=A*A';
         
     tic();    
    [M] =  LdlT(B);

    times(i) = toc()

      
    tic();
    [L] = LdlTComp(B);
    times1(i) = toc()

     tic();
     [L,D,P]= mylu(B)
     times2(i) = toc()
    
end


xtitle("Temps d execution", "tailles matrices", "temps");
plot2d(xdata, [times times1 times2]);
legend(["LdlT" "LdlT-compact" "Lu"], 2);

