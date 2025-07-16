
// Define the matrix A and vector B
x = [1; 2; 3; 4; 5];
y = [2; 4; 6; 8; 10];

// For a linear regression y = mx + b, we need to construct the design matrix A
// The design matrix includes a column of the independent variable (x)
// and a column of ones for the intercept
A = [x, ones(size(x, 1), 1)];

// Method 1: Using Matrix Inversion (Pseudo-inverse in Scilab)
// Calculate the pseudo-inverse of matrix A
A_pseudo_inv = pinv(A);

// Calculate the solution Param = A_pseudo_inv * B (vector of parameters [m; b])
Param = A_pseudo_inv * y;

// Extract slope (m) and y-intercept (b) from the solution
m = Param(1);
b = Param(2);

// Display the solution
disp('Solution using matrix inversion:');
printf('Slope (m): %f\n', m);
printf('Y-intercept (b): %f\n', b);

