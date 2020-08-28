% Aufgabe 1
function[newshape] = generateShape(mju,eigVec,p)
    %p=(scaling, rotation, x-verschieben, y-verschieben,b)
    b = p(5:end);
    check = size(b);
    if check(1) == 1
        b = b';
    end
    rotor=[cos(p(2)),-sin(p(2));sin(p(2)),cos(p(2))];
    slide = reshape(cat(1,ones(length(b)/2,1)*p(3),ones(length(b)/2,1)*p(4)),[],2);
    x_new = mju + sum((eigVec*b),2);%mean + eigen- mal parametervektor
    newshape = reshape(x_new,[],2); %zurück zur plotbaren form
    for i = 1:64 %rotieren
        newshape(i,:) = (rotor*newshape(i,:)')';
    end
    newshape = newshape*p(1); %skalieren
    newshape = newshape + slide; %verschieben
end