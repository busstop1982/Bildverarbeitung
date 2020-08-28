function[pred, score] = predictSegmentation(rf,image)
    a = size(image);
    pic = cast(image,'double');
    [Yfit, scores] = predict(rf,cache(@computeFeatures,pic));
    X = zeros(1,length(Yfit));
    for i = 1:length(Yfit)
        X(i) = str2double(Yfit{i,1});
    end
    pred = reshape(X,a(1),a(2));
    score = reshape(scores(:,2),a(1),a(2));
end