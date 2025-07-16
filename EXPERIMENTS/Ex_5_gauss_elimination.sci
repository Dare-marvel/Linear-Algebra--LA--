// A function to solve equations using the method called Gauss Elimination
function [x] = gaussEliminate(A, b)
    // Find out how many rows (n) and columns (m) the matrix A has
    [n, m] = size(A);
    
    // Start of the forward elimination process
    // (We make everything below the main diagonal of the matrix A become zero)
    for i = 1:n-1  // Loop over each row, except the last one
        for j = i+1:n  // For the current row, loop over all rows below it
            if A(i,i) == 0  // If the diagonal element is zero, we cannot proceed.
                disp("Pivot element is zero. The method failed.");
                x = [];  // Return an empty solution because we failed
                return;
            end
            // Calculate how much we need to multiply the current row by to subtract from the row below
            factor = A(j,i) / A(i,i);
            
            // For the selected row below, subtract the current row (after multiplying) to make the
            // below-left element zero, and do this for the rest of the elements in the row as well.
            for k = i:n
                A(j,k) = A(j,k) - factor * A(i,k);
            end
            // Also update the constant vector 'b' similarly to keep the equations equivalent
            b(j) = b(j) - factor * b(i);
        end
    end
    
    
    // Back substitution process
    // (Now that everything below the diagonal is zero, solve the equations from bottom to top)
    x = zeros(n, 1);  // Prepare a vector to store the solutions
    x(n) = b(n) / A(n,n);  // Solve for the last variable directly
    for i = n-1:-1:1  // Loop from the second-to-last row up to the first
        sum = 0;  // Initialize sum for storing the accumulated terms
        for j = i+1:n  // For the current variable, collect the terms involving already solved variables
            sum = sum + A(i,j) * x(j);
        end
        // Calculate the value for the current variable by taking what's left on the right ('b')
        // and subtracting the accumulated sum, then dividing by the coefficient in A.
        x(i) = (b(i) - sum) / A(i,i);  
    end

endfunction

// Example Usage: solving a set of equations given by matrix A and vector b
A = [2, -1, 0; -1, 2, -1; 0, -1, 2];  // Coefficients from the equations
b = [1; 0; 1];  // The 'answer' part of each equation
x = gaussEliminate(A, b);  // Solve the equations using our function

disp("Solution: ");  // Show the solutions we found
disp(x);

A = [1, 1, 1;1, 2, 3;2, 3, 4];

b = [2; 5; 11]

x = gaussEliminate(A, b);

disp('solution =', x)

//diagonal element becomes zero so solution doe not exist

/*

prove u=1, z=-7, y=4, x=5

10x-7y+3z+5u=6
-6x+8y-z-4u=5
3x+y+4z+11u=2
5x-9y-2z+4u=7



Imagine you are a chemical engineer working with a reaction that involves three reactants, A, B, and C, D which turn into two product, E. You conducted three experiments, and in each of them, you varied the amounts of A, B, and C, D. Your goal now is to find out the stoichiometric coefficients (i.e., the proportion in which these reactants combine) for the balanced chemical equation. 
    
The general form of the chemical reaction is:  
aA + bB + cC + dD → eE 


Here, a, b, c, d, e  are the stoichiometric coefficients we aim to find.

in first,second and third, forth expt
a=1,2,2,3
b=2,3,-1,2
c=3,-3,2,-4
d=-1,-1,3,3
  e = 10,1,7,2 
*/



