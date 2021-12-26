
 n= 5
   Mat=sprand(n,n,0.4)
   vec=rand(n,1)
  
   [Results] = Mat_Vec_Product(Mat,vec)  
   x = Mat*vec  

disp("Multiplication Matrice-Vecteur")
disp('Format CSR  ::',Results')
disp('Format Classique Mat*Vec  ::',x')
