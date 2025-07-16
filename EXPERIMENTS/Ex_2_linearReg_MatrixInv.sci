// Step 1: Preparation - Sample dataset
x = [1; 2; 3; 4; 5]; // Independent variable
y = [2; 4; 6; 8; 10]; // Dependent variable

// Step 2: Design Matrix - Prepend a column of 1s for the intercept
// Ensuring that dimensions are correct and preparing for concatenation
ones_vec = ones(size(x,1), 1); // Column vector of ones

// Step 2: Design Matrix - Prepend a column of 1s for the intercept
X = [ones_vec x]; // Correctly concatenate column of ones to x

// Step 3: Application of the Matrix Inverse Method
// Calculate the coefficients
B = inv(X'*X)*X'*y; // b = (X'X)^-1 X'y

// Displaying the calculated coefficients
disp(B); // First value is the intercept, second value is the slope

// Step 4: Prediction and Visualization
// Predict y using the calculated coefficients
y_pred = X * B;

// Plot the original data and the regression line
scf(); // Create a new figure
plot(x, y, 'o'); // Plot original data points
plot(x, y_pred, '-r'); // Plot regression line
xtitle('Linear Regression using Matrix Inverse Method', 'X', 'Y');
legend(['Original data', 'Regression Line']);
