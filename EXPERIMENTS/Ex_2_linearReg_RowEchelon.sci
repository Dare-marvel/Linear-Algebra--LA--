// Define the matrix A and vector B
A = [1 0;2 0;3 0;4 0;5 0;6 0];
B = [2;4;6;8;10;12];

// Solve directly using Scilab functions
solution = A\B; // Where "\" is the left division operator in Scilab
m = solution(1);
c = solution(2);
mprintf("Slope (m) = %f\n", m);
mprintf("Intercept (c) = %f\n", c);
