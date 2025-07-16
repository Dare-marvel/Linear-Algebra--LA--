
data = [2.5, 2.4;
        0.5, 0.7;
        2.2, 2.9;
        1.9, 2.2;
        3.1, 3.0;
        2.3, 2.7;
        2, 1.6;
        1, 1.1;
        1.5, 1.6;
        1.1, 0.9];
 

// Calculate mean
meanData = mean(data, "r");


// Replicating meanData to match data dimensions
dataCentered = data - ones(data(:,1)) * meanData;
 
covMatrix = cov(dataCentered);
 
[eigenvectors, eigenvalues] = spec(covMatrix);
 
// Choosing the principal components (for example, we are choosing all here)
//PCs = eigenvectors;
PCs = eigenvectors(:,1);

// Transform the original centered data
dataTransformed = dataCentered * PCs;

disp(dataTransformed)

scf();
//plot(dataTransformed(:,1), dataTransformed(:,2), '+');
plot(dataTransformed(:,1), '+');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
title('PCA Projection');
