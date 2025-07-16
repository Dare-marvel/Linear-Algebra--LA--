function x = gauss_seidel(A, b, x, iters)
    for i = 1:iters
        for j = 1:size(A,1)
            x(j) = (b(j) - sum(A(j,:)'.*x) + A(j,j)*x(j)) / A(j,j);
        end
    end
endfunction

A = [ 4 -1  0;
     -1  4 -1;
      0 -1  4]

b = [15; 10; 10]

x = [0; 0; 0];

iters = 25;

x = gauss_seidel(A, b, x, iters)

disp(x)


/*
[ 10*x1 +  -1*x2 +   2*x3 +   0*x4] = [  6]
[ -1*x1 +  11*x2 +  -1*x3 +   3*x4] = [ 25]
[  2*x1 +  -1*x2 +  10*x3 +  -1*x4] = [-11]
[  0*x1 +   3*x2 +  -1*x3 +   8*x4] = [ 15]

Prove solution is Solution: [ 1.  2. -1.  1.]

*/


/*
The upward velocity of a rocket is given at three different times in the following table

Table 1: Velocity vs. time data.

 t(s)         Velocity,  v(m/s)
 
 
5	      106.8
8	      177.2
12	     279.2
The velocity data is approximated by a polynomial as

v(t)=xt^2+yt+z,5≤t≤12
 
Find the values of  x, y,and z
  using the Gauss-Seidel method. Assume an initial guess of the solution as

x, y, z is 1,2,5 respectively
 
 
In a fictional city, Alan shifts between using a car, a bus, and a bike for his weekly commutes due to fluctuating fuel prices and availability. He notices that spending on fuel differently impacts his budget depending on the mode of transport. Firstly, purchasing fuel for the car 12 times, for the bus 3 times, and 5 times on the bike's fuel equals 1 dollar. Secondly, a balanced use of the car once, the bus five times, and the bike thrice sums up 28 dollars. Lastly, prioritizing the bus and bike over the car with a combination of thrice for the car, seven times for the bus, and thirteen times for the bike leads to a precise budget allocation of 78 dollars. To optimize his spending, Alan tries to calculate for each mode of transport what will be the spending for 1 use. beginning his calculations with an initial guess of 1 for the car, 0 for the bus, and 1 for the bike
*/

/*
4x - y = 15
-x+4y-z=10
-y+4z=10

A = [4, -1, 0;
        -1, 4, -1;
        0, -1, 4];
        
b = [15;10;10];

  "solution"

 x =  4.9107143
 y =    4.6428571
 z =  3.6607143
*/


/*
[ 10*x1 +  -1*x2 +   2*x3 +   0*x4] = [  6]
[ -1*x1 +  11*x2 +  -1*x3 +   3*x4] = [ 25]
[  2*x1 +  -1*x2 +  10*x3 +  -1*x4] = [-11]
[  0*x1 +   3*x2 +  -1*x3 +   8*x4] = [ 15]

Prove solution is Solution: [ 1.  2. -1.  1.]
x1=1, x2=2,x3=-1,x4=1
*/

//Q - Plot partial dependence of x1 on the output?

//what is the impact of x on the output
//varying the units of x1
//x2, x3, x4 = constant
//how much that change in output

//Example 
//x1, 2*x1, 3*x1 
// impact on the output
//x2, x3, x4 = units will be constant
//partial dependence



//plot2d()
//on the x-axis keep the units of x1
//on the y-axis display output of nx1+x2+x3+x4 (n=1 to 20)

//get on the same plot the partial dependence of x2, x3, x4



