
x = [1 2 3 4 5];
y = [2 4 6 8 10];

// Number of points
n = length(x);

// Calculating slope (m)
m = (n*sum(x.*y) - sum(x)*sum(y)) / (n*sum(x.^2) - sum(x)^2);

// Calculating y-intercept (b)
b = (sum(y) - m*sum(x)) / n;

// Display the linear regression equation
disp("The linear regression model is: y = " + string(m) + "x + " + string(b));


// Predicting y values
y_pred = m*x + b;

// Plotting the original data points
plot(x, y, 'o');

// Holding the plot
xgrid(1)


// Plotting the regression line
plot(x, y_pred, '-r');
xlabel('X');
ylabel('Y');
title('Linear Regression');
legend(['Data points', 'Regression line']);


