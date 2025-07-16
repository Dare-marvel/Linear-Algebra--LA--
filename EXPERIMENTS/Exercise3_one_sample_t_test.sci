// Sample data and hypothetical mean
myField3 = [10, 12, 15, 18, 20];
hypMean = 14.5;

// Calculate mean and standard error
n = length(myField3);
myMean = mean(myField3);
SE = stdev(myField3) / sqrt(n);

// Calculate t-value
tval = (myMean - hypMean) / SE;
disp("Standard Error:", SE);
disp("t-value:", tval);

// Degrees of freedom
df = n - 1;

// Calculate two-tailed p-value
pVal = 2 * (1 - cdft('PQ', abs(tval), df));
disp("p-value:", pVal);

