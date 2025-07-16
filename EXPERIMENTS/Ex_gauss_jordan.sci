/*
Solve the following system by the Gauss-Jordan method.

2 x+y+2 z =10 \\ 
x+2 y+z =8 \\ 
3 x+y-z=2 
 
Solution
Write the augmented matrix.
Interchange rows if necessary to obtain a non-zero number in the first row, first column.
Use a row operation to get a 1 as the entry in the first row and first column.
Use row operations to make all other entries as zeros in column one.
Interchange rows if necessary to obtain a nonzero number in the second row, second column. Use a row operation to make this entry 1. Use row operations to make all other entries as zeros in column two.
Repeat step 5 for row 3, column 3. Continue moving along the main diagonal until you reach the last row, or until the number is zero.
The final matrix is called the reduced row-echelon form.


2 x+3 y-4 z=5 \\ 
3 x+4 y-5 z=-6 \\ 
4 x+5 y-6 z=7

The Gauss-Jordan method is similar to the Gaussian elimination process, except that the entries both above and below each pivot are zeroed out.


After performing Gaussian elimination on a matrix, the result is in row echelon form, while the result after the Gauss-Jordan method is in reduced row echelon form.
    
x + 2y + 6z = 44
3x + 4y + z = 52
6x - y - z = 38

prove  x = 8, y = 6, z = 4.
*/
function A = gaussJordan(A)
    [m, n] = size(A);
    for i = 1:m
        // Partial pivoting
        [pivot, k] = max(abs(A(i:m, i)));
        k = k + i - 1;
        if k ~= i then
            temp = A(i, :);
            A(i, :) = A(k, :);
            A(k, :) = temp;
        end
        
        // Make the diagonal element 1
        A(i, :) = A(i, :) / A(i, i);
        
        // Make all other elements in the current column 0
        for j = 1:m
            if j ~= i then
                A(j, :) = A(j, :) - A(j, i) / A(i, i) * A(i, :);
            end
        end
    end
endfunction

A = [1 2 3 9; 2 -1 1 8; 3 3 -2 3];
A_rref = gaussJordan(A);
disp(A_rref);


//https://people.math.carleton.ca/~kcheung/math/notes/MATH1107/wk04/04_gaussian_elimination.html

/*
The provided code snippet is a part of a MATLAB script that appears to perform row reduction on a matrix \(A\) using the Gaussian elimination method, in an attempt to transform the matrix into reduced row echelon form (RREF). Let's explain each line:

1. **`[m, n] = size(A)`**
   - This line determines the size of matrix \(A\), where \(m\) is the number of rows and \(n\) is the number of columns.

2. **`disp('rows and cols of A', m, n)`**
   - This MATLAB command outputs the string 'rows and cols of A' followed by the values of \(m\) and \(n\). It's intended to show the user the dimensions of matrix \(A\). However, the syntax here is incorrect for combining text and variables in the `disp` function. It should use concatenation or another display function like `fprintf`.

3. **`p = 1;`**
   - Initializes the variable `p` to 1. This variable appears to act as a pivot row marker to track which row is being used in the elimination process.

4. **`for k = 1:n`**
   - Begins a loop from 1 to \(n\) (the number of columns of \(A\)). This loop will handle the column operations for transforming \(A\).

5. **`i = p;`**
   - Sets an index `i` to the value of `p`. This is used to find a suitable pivot in the current column.

6. **`while (i <= m) & (A(i,k) == 0)`**
   - A `while` loop that continues down the column as long as `i` is within the row limits of \(A\) and the current entry \(A(i,k)\) is zero. Its purpose is to find a non-zero element to serve as a pivot.

7. **`i = i + 1;`**
   - Increments `i` to check the next row in the current column for a non-zero pivot element.

8. **`if (i <= m)`**
   - Checks if a valid (non-zero) pivot has been found within the bounds of matrix \(A\).

9. **`if (i ~= p)`**
   - Determines if the pivot row (`i`) found is different from the current pivot index `p`. If they are different, a row swap will be necessary.

10. **`A([i,p],:) = A([p,i],:)`**
    - Swaps the rows `i` and `p` in matrix \(A\) to move the pivot row to the correct position for elimination.

11. **`alpha = A(p,k);`**
    - Sets `alpha` to the pivot element. This will be used to normalize the pivot row.

12. **`A(p,:) = A(p,:) / alpha;`**
    - Divides the entire pivot row by `alpha` to normalize the pivot to 1.

13. **`for q = 1:m`**
    - Another loop over all the rows of \(A\) to perform the row elimination.

14. **`if (q ~= p)`**
    - Ensures that the operation does not alter the pivot row itself.

15. **`alpha_q = A(q,k);`**
    - Grabs the element in row `q`, column `k`, which will be used to make the corresponding element in other rows zero.

16. **`A(q,:) = A(q,:) - alpha_q * A(p,:);`**
    - Performs the row operation to zero out elements below and above the pivot.

17. **`p = p + 1;`**
    - Moves to the next pivot row for subsequent columns' reduction.

18. **`if (p > m) disp('stop'); end`**
    - This conditional statement checks if the pivot exceeds the number of rows (perhaps indicating that the row reduction is complete or further pivoting is impossible). It then displays 'stop' indicating the process or limit condition.

This structured approach systematically converts \(A\) into an upper-triangular matrix and, if continued with full row operations, could further transform the matrix into RREF. Note, however, there are error handling and enhancement opportunities like verifying matrix singularity before processing and using a more MATLAB-compliant method for displaying mixed strings and variables.
*/

[m, n] = size(A)

disp('rows and cols of A', m, n)
p = 1;
for k = 1:n
   i = p;
   while (i <= m) & (A(i,k) == 0)
      i = i + 1;
   end
   if (i <= m)
      if (i ~= p)
         A([i,p],:) = A([p,i],:);
      end
      alpha = A(p,k);
      A(p,:) = A(p,:) / alpha;
      for q = 1:m
         if (q ~= p)
            alpha_q = A(q,k);
            A(q,:) = A(q,:) - alpha_q * A(p,:);
         end
      end
      p = p + 1;
   end
end
if (p > m) 
    disp('stop');
end

disp('solution part 2=', A);
