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

/*
x + 2y + 3z = 9 \\
2x - y + z = 8 \\
3x + 3y - 2z = 3


   1.   0.   0.   2.75
   0.   1.   0.  -0.25
   0.   0.   1.   2.25
   
   
   
   reduced-row echelon form, also known as row canonical form, if the following conditions are satisfied:All rows with only zero entries are at the bottom of the matrix


All rows with only zero entries are at the bottom of the matrix
The first nonzero entry in a row, called the leading entry or the pivot, of each nonzero row is to the right of the leading entry of the row above it.
The leading entry, also known as the pivot, in any nonzero row is 1.
All other entries in the column containing a leading 1 are zeroes.
*/
