function y=banana(x)
  y =x^2+10;
endfunction
opt = optimset ( "PlotFcns" , optimplotfval );
[x fval] = fminsearch ( banana , [-1.2] , opt );

disp(x)
