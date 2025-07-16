function [L, U] = crout_lu(A)
    [n, m] = size(A);  // Get the dimensions of A
    // Initialize L and U
    L = zeros(n, n);  
    U = eye(n, n);  // U is initially an identity matrix
    for j = 1:n
        for i = j:n
            sum = 0;
            for k = 1:j-1
                sum = sum + L(i,k) * U(k,j);
            end
            L(i,j) = A(i,j) - sum;
        end
        for i = j+1:n
            sum = 0;
            for k = 1:j-1
                sum = sum + L(j,k) * U(k,i);
            end
            U(j,i) = (A(j,i) - sum) / L(j,j);
        end
    end
endfunction

/*
### Step 2: Forward and Backward Substitution Functions

Next, we need functions to solve `Ly = B` and `Ux = y`.
*/

function y = forward_substitution(L, B)
    [n, m] = size(L);
    y = zeros(n, 1);
    for i = 1:n
        sum = 0;
        for j = 1:i-1
            sum = sum + L(i,j) * y(j);
        end
        y(i) = (B(i) - sum) / L(i,i);
    end
endfunction

function x = backward_substitution(U, y)
    [n, m] = size(U);
    x = zeros(n, 1);
    for i = n:-1:1
        sum = 0;
        for j = i+1:n
            sum = sum + U(i,j) * x(j);
        end
        x(i) = (y(i) - sum) / U(i,i);
    end
endfunction

/*
### Step 3: Solving the System `AX = B`

Finally, we combine everything to solve `AX = B`.
*/

// Example matrix A and B
A = [2, -1, 1; 3, 3, 9; 3, 3, 5];
B = [10; 39; 26];

// Step 1: LU Decomposition
[L, U] = crout_lu(A);

// Step 2: Solve LY = B
Y = forward_substitution(L, B);

// Step 3: Solve UX = Y
X = backward_substitution(U, Y);

disp(X, "Solution X: ");
