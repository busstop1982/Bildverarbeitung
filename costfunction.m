% Aufgabe 4 (b)
function value = costfunction(surface, p)
    a = size(surface);
    load handdata.mat aligned
    data = reshape(aligned(:,:,1:30),[],30);
    C = ourCov(data);
    [eigVec,~] = pca(C);
    mju = mean(data,2);
    shape = generateShape(mju,eigVec,p);
    shape = round(shape);
    valleys = surface;
    values = zeros(length(shape),1);
    for i = 1:length(shape)
        if shape(i,1) <= a(2) && shape(i,2) <= a(1) && shape(i,1)>0 && shape(i,2)>0
            values(i) = valleys(shape(i,2),shape(i,1));
        else
            values(i) = 2;
        end
    end
    value = mean(values);
end