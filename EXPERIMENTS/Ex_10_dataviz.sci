
clf();
x=[0:0.1:2*%pi]';
plot2d(x,sin(x));


clf();
x=[0:0.1:2*%pi]';
plot2d(x,[sin(x) sin(2*x) sin(3*x)])


// auto scaling with previous plots + style
clf();
x=[0:0.1:2*%pi]';
plot2d(x,sin(x),-1);
plot2d(x,2*sin(x),12);
plot2d(2*x,cos(x),3);

// First example : one input argument  x=[1 2 5]
clf();
scf(0);
pie([1 2 5]);


// Second example : two input arguments x=[5 9  4 6 3], sp=[0 1 0 1 0], the second and the fourth are separated of the others
clf();
scf(1);
pie([5 9 4 6 3],[0 1 0 1 0]);


// Second example: draw 3 bars (i.e 3 polylines with polyline_style type =6),default style='grouped'
clf();
scf(1);
x=[1 2 5];
y=[1  -5 6;3 -2 7;4  -3 8];
bar(x,y);

clf();
scf(2);
x=[1 2 5];
y=[1 4 7;2 5 8;3 6  9];
bar(x,y,'stacked');

clf();
x=[1 2 5];
y=[1 4 7;2 5 8;3 6  9];
barh(x,y,'stacked');

clf();
x=[1 2 5];
y=[1  -5 6;3 -2 7;4  -3 8];
barh(x,y);
