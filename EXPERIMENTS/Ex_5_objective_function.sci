// Define the objective function
function f = objective_function(x)
    f = x^2 - 4*x + 4;
endfunction

opt = optimset ( "PlotFcns" , optimplotfval );
[x fval] = fminsearch ( objective_function , [-1.2] , opt );

disp(x)
