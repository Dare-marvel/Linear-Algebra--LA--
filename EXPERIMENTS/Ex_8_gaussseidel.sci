// Define or Load X and y
X = [1, 2; 1, 3; 1, 4; 1, 5]; // Example design matrix (with first column for intercept)
y = [2; 3; 5; 4]; // Example outcome vector


X = [ 4 -1  0;
     -1  4 -1;
      0 -1  4]

y = [15; 10; 10]

  
A = X.'*X;
b = X.'*y;

 
beta = zeros(size(A,2),1);

 
tolerance = 1e-6;
maxIterations = 1000;
iteration = 0;
error = 1;

 
while (iteration < maxIterations) & (error > tolerance)
    beta_old = beta;
    for i = 1:size(A,1)
        sigma = 0;
        for j = 1:size(A,2)
            if j ~= i
                sigma = sigma + A(i,j)*beta(j);
            end
        end
        beta(i) = (b(i) - sigma) / A(i,i);
    end
    error = max(abs(beta - beta_old)); // Corrected error calculation
    iteration = iteration + 1;
end

disp("Solution:");
disp(beta);
