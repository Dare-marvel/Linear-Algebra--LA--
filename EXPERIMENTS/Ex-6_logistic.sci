// Define the logistic function
function y = logistic(x, beta)
    y = 1 ./ (1 + exp(-(beta(1) + beta(2)*x)));
endfunction

// Define the negative log-likelihood function for logistic regression
function neg_log_likelihood = log_likelihood(beta, x, y)
    p = logistic(x, beta);
    neg_log_likelihood = -sum(y .* log(p) + (1 - y) .* log(1 - p));
endfunction

// Generate some sample data
x = [-2; -1; 0; 1; 2];  // Input values
y_true = [0; 0; 1; 1; 1];  // Corresponding labels (0 or 1)

// Perform logistic regression using fminsearch
beta_initial_guess = [0; 0]; // Initial guess for beta
beta_optimized = fminsearch(list(log_likelihood,x,y_true), beta_initial_guess);

disp('Optimized Coefficients:');
disp(beta_optimized);

// Plot the results
clf;
scatter(x, y_true, 'fill');
x_values = linspace(-5, 5, 100)';
y_values = logistic(x_values, beta_optimized);
plot(x_values, y_values, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('Probability');
title('Logistic Regression');
legend('Data', 'Logistic Regression Fit');

