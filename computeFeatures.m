%Aufgabe 2
function[featurematrix] = computeFeatures(image)
    %output=(greyvalues,gradient-x,gradient-y,gradient power,haarlike,
    %harrlike with gradient,koords)
    a = size(image);
    grey = zeros(a(1),a(2));
    x = 1:a(1);
    y = 1:a(2);
    [xm,ym] = meshgrid(x,y);
    for i = 1:a(1)
        for j = 1:a(2)
            grey(i,j) = cast(image(i,j),'double');
        end
    end

    featurematrix(:,1) = reshape(grey,[],1);
    [FX,FY] = gradient(grey);
    featurematrix(:,2) = reshape(FX,[],1);
    featurematrix(:,3) = reshape(FY,[],1);
    gradstr = sqrt(FX.*FX+FY.*FY);
    featurematrix(:,4) = reshape(gradstr,[],1);
    haare = computeHaarLike(grey);
    featurematrix(:,5) = haare(1,:);
    gradhaare = computeHaarLike(gradstr);
    featurematrix(:,6) = gradhaare(1,:);
    featurematrix(:,7) = reshape(xm,[],1);
    featurematrix(:,8) = reshape(ym,[],1);
end