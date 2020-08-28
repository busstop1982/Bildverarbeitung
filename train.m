% Aufgabe 4(a)
function[rf, mju, eigVec, eigVal] = train
    load handdata.mat aligned images masks
    data = reshape(aligned(:,:,1:30),[],30);
    C = ourCov(data);
    [eigVec,eigVal] = pca(C);
    eigVal(eigVal<0) = 0;
    mju = mean(data,2);
    rf = trainRF(images(1:30),masks(1:30));
end