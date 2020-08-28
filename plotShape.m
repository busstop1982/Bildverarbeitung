function[] = plotShape(mju, eigVec,p)
    % p(scale,rot,x,y,b)
    b = p(5:end);
    bzero = generateShape(mju, eigVec,[1,0,0,0,zeros(1,length(b))]);
    b1 = generateShape(mju, eigVec,p);
    text = sprintf('scale=%.2f, transl=(%d,%d),rot=%.2f pi',p(1),p(2),p(4),p(2)/pi);
    figure
    axis equal
    hold
    plot(bzero(:,1),bzero(:,2),'ro','Displayname','no scaling');
    plot(b1(:,1),b1(:,2),'b.','Displayname',text);
    legend
end