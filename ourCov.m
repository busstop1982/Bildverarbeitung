% Beispiel 1(a)
% returns covariant matrix dim*dim
% input D = dim*n matrix
function[C] = ourCov(D)
    N = size(D,2);
    mid = mean(D,2);
    mj = D - mid;
    C = (mj*mj.')/(N-1);
end
