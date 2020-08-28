% Beispiel 2
% returns eigenvectors (d*d) and eigenvalues (1*d)
% input data = d*n
function[evecs, evals] = pca(D)
    C = ourCov(D);
    [V,C] = eig(C); %eigenvectors and eigenvalues of D
    evals = sort(diag(C),'descend')';%get diagonal elements in descending order
    %ediag=diag(evals);%diagonal matrix of sorted diagonal elements
    [c, ind]=sort(evals);%get column indices of the evals
    evecs = V(:,ind);
end