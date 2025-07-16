s = 'hello world'
disp(s)

a = 5;
b = 3;
sum = a + b;
difference = a - b;
product = a * b;
quotient = a / b;

disp(sum, 'Sum:');
disp(difference, 'Difference:');
disp(product, 'Product:');
disp(quotient, 'Quotient:');


vec = [1, 2, 3, 4, 5]; // Define a vector
mat = [1, 2, 3; 4, 5, 6; 7, 8, 9]; // Define a matrix

disp(vec, 'Vector:');
disp(mat, 'Matrix:');


x = 0:0.1:10; // Define x values
y = sin(x); // Compute corresponding y values

plot(x, y); // Plot sin(x)
xlabel('x');
ylabel('sin(x)');
title('Plot of sin(x)');


n = 10;
for i = 1:n
    disp(i);
end

x = 5;
if x > 0 then
    disp('Positive');
else
    disp('Non-positive');
end



function y = square(x)
    y = x^2;
endfunction

result = square(3);
disp(result, 'Square:');


A = [1, 2; 3, 4]; // Define a matrix
B = [5, 6; 7, 8]; // Define another matrix

C = A + B; // Matrix addition
D = A * B; // Matrix multiplication

disp(C, 'Sum of matrices:');
disp(D, 'Product of matrices:');

disp('div mat = ', A/B) // check


disp('adding scalar = ', A+2)
disp('subs scalar = ',A-2)
disp('mult scalar = ', A*2)
disp('div scalar = ', A/2) 


// Define the function to integrate
function y = f(x)
    y = exp(-x^2);
endfunction

a = 0; // Lower limit
b = 1; // Upper limit

// Integrate f from a to b
result = intg(a, b, f);
disp(result, 'Integral:');



// Step 1: Open a file for writing
filename = 'example.txt'; // Define the filename
write_mode = 'wt'; // Write text mode, 'wt' or 'w' for Windows, 'w' for Linux/Mac (Overwrites if exists or creates a new one)
fileID_write = mopen(filename, write_mode); // Open the file to write

// Check if file opened successfully
if fileID_write < 0 then
    disp("Failed to open the file for writing.");
    abort; // Stop the execution if failed to open
end


x = 0:0.1:10; // Define x values
y1 = sin(x);  // Compute corresponding y values for sin(x)
y2 = cos(x);  // Compute corresponding y values for cos(x)

plot(x, y1, 'r'); // Plot sin(x) in red
plot(x, y2, 'b'); // Plot cos(x) in blue
xlabel('x');
ylabel('y');
title('Plot of sin(x) and cos(x)');
legend('sin(x)', 'cos(x)');


random_matrix = rand(3, 3); // Generate a 3x3 matrix of random numbers
disp(random_matrix, 'Random Matrix:');


A = [1, 2; 3, 4]; // Define a matrix

A_inv = inv(A); // Calculate the inverse of A
disp(A_inv, 'Inverse of A:');


A = [1, 2; 3, 4]; // Define a matrix

[eigenvalues, eigenvectors] = spec(A);
disp(eigenvalues, 'Eigenvalues:');
disp(eigenvectors, 'Eigenvectors:');


A = [2, 3; 4, 5]; // Coefficient matrix
b = [10; 20];     // Right-hand side vector

x = A \ b; // Solve Ax = b
disp(x, 'Solution:');


// mean, median, mode, std dev, variance

data = [1,2,3,4,5,6]

disp('mean =', mean(data))

disp('median = ', median(data))

disp('std dev =', stdev(data))

//variance, mode

data = rand(1,1000) * 10

clf();
histplot(10, data)

A=[1,2,3;4,5,6];
disp('original',A)
y=mean(A)
disp("mean",y)
y=mean(A,'r')
disp('mean r',y)
y=mean(A,'c')
disp('mean c',y)

y=mean(A,'m')
disp(y)

//Homework:
// How to divide element wise two matrices
//   [1,2    /   [2   2]   =  [0.5    1]
//    3,4]        [2  2]       [1.5   2]   
//How to calculate mode,variance?
//read a csv - dataset from internet - iris flower dataset - 150 rows and 5 columns with X having 4 columns and y having one column
//disp the first few rows
//calculate mean of numeric rows
//plot histogram of numeric rows
// read - mean, median, mode, sample, population, std dev and variance
// confidence level and confidence interval, margin of error
//chebyshev rule statistics, empiral rule of std deviation





