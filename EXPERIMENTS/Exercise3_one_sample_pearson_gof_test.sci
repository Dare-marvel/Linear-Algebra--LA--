myObsList =[22, 17, 16]
expectedCount = 18.333333333333332
chiVal = sum((myObsList - expectedCount).^2 ./ expectedCount);
disp(chiVal); // Example value for chi-square statistic

df = length(myObsList) - 1;
disp(df); // Example degrees of freedom

// You don't need to install anything in Scilab for chi-squared distribution functions
// In Scilab, to calculate 1 - CDF of the chi-square distribution

pValue = 1 - cdfchi("PQ", chiVal, df);

disp(pValue);
