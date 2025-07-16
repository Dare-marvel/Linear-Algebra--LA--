/*
The code snippet above presents an implementation of the Gauss-Jacobi iterative method for solving a system of linear equations. Here's a breakdown of its components and how the algorithm operates:

### Variables:

1. **A**: This is a square matrix representing the coefficients of the system of linear equations.
2. **B**: This is a vector representing the constants on the right-hand side of each equation in the system.
3. **x0**: Initial guess for the solution vector. The Gauss-Jacobi method iteratively refines this guess.
4. **tol**: A small value (tolerance) used to determine when the algorithm has converged to a solution.
5. **max_iter**: The maximum number of iterations to perform, preventing the algorithm from running indefinitely if it doesn't converge.
6. **n**: The number of equations (and variables) in the system. It's determined by the number of rows in matrix A.
7. **x**: The current guess for the solution vector. Initially, this is set to the initial guess x0.

### Steps of the Gauss-Jacobi Method:

1. **Initialization**: The solution vector, `x`, is initialized to the initial guess, `x0`. Other parameters such as the tolerance, `tol

, maximum number of iterations `max_iter`, and the count of equations `n` are also set.

2. **Iteration**:
   - The method iteratively updates each element of the vector `x` using the previous iteration's values. This requires temporarily storing the old values of `x` in `x_old` at the beginning of each iteration to ensure that the updates for each variable are based on the values from the same iteration step.
   - For each variable `x(i)` in `x`, the algorithm calculates a new value by rearranging one of the original equations to solve for `x(i)`. Specifically, it isolates `x(i)` on one side of the equation and moves all other variables to the opposite side. The sum of the products of these other variables and their corresponding coefficients in `A` is subtracted from the `i`-th value in `B`, and the result is divided by the coefficient of `x(i)` in the equation, which is `A(i,i)`.
   - This step involves looping over each equation (index `i`) and then within that loop, summing terms that involve all the other variables (index `j`, skipping when `j == i`) by multiplying their values from the previous iteration (stored in `x_old`) by their corresponding coefficients in `A`.

3. **Convergence Check**:
   - After each full iteration (updating all variables in `x`), the algorithm checks if the solution has converged. Convergence is determined by checking if the maximum absolute difference between the old and the new values of `x` is less than the specified tolerance `tol`.
   - If the solution has converged (i.e., changes in `x` are sufficiently small), the algorithm outputs the solution and a message indicating convergence. This is done using `disp()` function calls.

4. **Termination**:
   - If convergence is not achieved within `max_iter` iterations, the loop terminates, and the program indicates that the maximum number of iterations was reached without convergence.
   - If the algorithm converges, it breaks out of the loop early and provides the solution.

### Summary:

The Gauss-Jacobi method is an iterative technique for solving systems of linear equations characterized by separating the diagonal elements of the coefficient matrix from the rest and iteratively refining guesses for each variable based on the other variables' values from the previous iteration. It is particularly useful when the system of equations is large and sparse. However, its convergence depends on the properties of matrix `A`, particularly its diagonal dominance.
        
        
In mathematics, a square matrix is said to be diagonally dominant if, for every row of the matrix, the magnitude of the diagonal entry in a row is larger than or equal to the sum of the magnitudes of all the other (non-diagonal) entries in that row.
          
Input: initial guess x(0) to the solution, (diagonal dominant) matrix A, right-hand side vector b, convergence criterion
Output: solution when convergence is reached
Comments: pseudocode based on the element-based formula above

k = 0
while convergence not reached do
    for i := 1 step until n do
        σ = 0
        for j := 1 step until n do
            if j ≠ i then
                σ = σ + aij xj(k)
            end
        end
        xi(k+1) = (bi − σ) / aii
    end
    increment k
end
*/

// Define the matrix A and the vector B
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
B = [7.85; -19.3; 71.4];

//A = [26 2 2; 3 27 1; 2 3 17];
//B = [12.6; -14.3; 6.0]; 
/*
Solve the system of equations using the Jacobi Method

26x1 + 2x2 + 2x3 = 12.6

3x1 + 27x2 + x3 = – 14.3

2x1 + 3x2 + 17x3 = 6.0

Obtain the result correct to three decimal places.

A = [26 2 2; 3 27 1; 2 3 17];
B = [12.6; -14.3; 6.0];
x1 = 0.5, x2 = – 0.6, x3 = 0.4.
*/

// Initial guess for x
x0 = [0; 0; 0];

// Tolerance
tol = 1e-5;

// Maximum number of iterations
max_iter = 1000;

// Number of equations
n = size(A,1);

// Initialize x as the initial guess
x = x0;

// Gauss-Jacobi Iteration
for iter = 1:max_iter
    // Store the previous iteration values
    x_old = x;
    
    for i = 1:n
        // Calculate the sum for the i-th equation
        sum = 0;
        for j = 1:n
            if j ~= i
                sum = sum + A(i,j) * x_old(j);
            end
        end
        // Update x_i using the Gauss-Jacobi formula
        x(i) = (B(i) - sum) / A(i,i);
    end
    
    // Check for convergence
    if max(abs(x - x_old)) < tol
        disp("Converged!");
        disp("Solution:");
        disp(x);
        break;
    end
end

if iter == max_iter
    disp("Max iterations reached, solution might not have converged.");
end
