xdata = [10:10:100];

for n = xdata;
    i=n/10;

    A=rand(n,n);
    B=A*A';

    tic();
    
    [L,D] =  LdlT(B);

    times(i) = toc()
    tic();
    [A] = LdlTComp(B);
    times1(i) = toc()
end

xtitle("Temps d execution", "tailles matrices", "temps");
plot2d(xdata, [times times1]);
legend(["LdlT" "LdlT-compact"], 2);


