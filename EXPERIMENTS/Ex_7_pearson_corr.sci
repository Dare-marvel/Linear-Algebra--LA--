// Dummy data
X = [12, 17, 22, 27, 32];
Y = [113, 119, 117, 115, 121];

 
Sx=0;Sy=0;Sxy=0;Sx2=0;Sy2=0;r=0;Mx=0;My=0;


for(i=1:5)
  Sx=Sx+X(i);
  Sy=Sy+Y(i);
  Sxy=Sxy+X(i)*Y(i);
  Sx2=Sx2+X(i)*X(i);
  Sy2=Sy2+Y(i)*Y(i);
end



Mx=Sx/5
My=Sy/5
r=(Sxy-5*Mx*My)/(sqrt(Sx2-5*Mx*Mx)*sqrt(Sy2-5*My*My))

disp(r)
