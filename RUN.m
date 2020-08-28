load handdata.mat
data = reshape(aligned(:,:,1:30),[],30);
C = ourCov(data);
[eigVec,eigVal] = pca(C);
eigVal(eigVal<0) = 0;
mju = mean(data,2);
b = zeros(1,128);
% Aufgabe 1 plots
p = [2,pi/4,0,0,b];
plotShape(mju,eigVec,p);
p = [1,pi/2,50,50,b];
plotShape(mju,eigVec,p);
p = [0.3,-pi/4,-20,17,b];
plotShape(mju,eigVec,p);
p = [1,0,50,-10,b];
plotShape(mju,eigVec,p);

% Aufgabe 2 plots
image = images{1,:};
a = size(image);
features = cache(@computeFeatures,image);
for i = 1:8
    curr = reshape(features(:,i),a(1),a(2));
    figure
    imagesc(curr);
end

[rf, mju, eigVec, eigVal] = train;
best=zeros(132,20);

% Aufgabe 3 (b)
errors = rf.oobError();

% Aufgabe 3 (c)
figure
plot(rf.OOBPermutedVarDeltaError);

% Aufgabe 4 (c)

for i = 31:50
    [~, scores] = predictSegmentation(rf,images{i});
    b = zeros(1,128);
    n = size(scores);
    v = [1,0,0,0,b];
    surf_coll(1:n(1),1:n(2),i-30)= (1 - scores);
    surface = 1 - scores;
    costing = @(v)costfunction(surface,v);

    pmin = [1;0;0;0;zeros(1,128)'];
    pmax = [5;2*pi;500;500;ones(1,128)'];

    best(:,i-30) = optimize(costing,pmin,pmax);
end
% Aufgabe 4(d)
for i = 1:20
    d(i) = costfunction(surf_coll(:,:,i),best(:,i));
end
figure
boxplot(d);
