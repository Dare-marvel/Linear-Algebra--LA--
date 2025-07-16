// Step 1: Create your dataset
// Let's create an artificial dataset
X = [1; 2; 3; 4]; // Feature
y = [2; 4; 6; 8]; // Target

// Step 2: Prepare the design matrix
// Add a column of ones to X
X_design = [ones(size(X, 1), 1) X]; // Adds a column of ones

// Step 3: Compute the coefficients using the Normal Equation
B = inv(X_design' * X_design) * X_design' * y;

// Display the computed coefficients
disp(B);
// B contains the intercept term and the slope of the line, respectively.

// Step 4: Making predictions
// Let's predict the outcomes for new values of X
new_X = [1; 5; 6];
new_X_design = [ones(size(new_X, 1), 1) new_X]; // Remember to add a column of ones
predictions = new_X_design * B;

// Display the predictions
disp(predictions);
