% Aufgabe 3 (a)
function[rf] = trainRF(images,masks)
    feature = [];
    masken = [];
    for i = 1:length(images)
        curr_feat = cache(@computeFeatures,images{i});
        curr_mask = reshape(masks{i},[],1);
        X = curr_mask(:,end) == 10; %logic vector: true bei kontur, sonst false
        feat_con = curr_feat(X,:); %features von konturpunkten
        feat_nocon = curr_feat(~X,:); %features von nicht-konturpunkten
        D = randperm(length(feat_nocon),length(feat_con));
        feat_nocon_rand = feat_nocon(D',:); %zufällige nicht-kontur features; n = n_kontur-feat
        curr_feat = cat(1,feat_con,feat_nocon_rand);
        curr_mask = cat(1,ones(1,length(feat_con))',zeros(1,length(feat_con))');
        feature = cat(1,feature,curr_feat);
        masken = cat(1,masken,curr_mask);
    end
    rf = TreeBagger(32,feature,masken,'OOBVarImp','on');
end