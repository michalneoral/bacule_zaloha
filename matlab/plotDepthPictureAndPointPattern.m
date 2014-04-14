function [ ] = plotDepthPictureAndPointPattern( frontOfDepth, points, numberOfFrame )
hold off;
% surf(frontOfDepth{1,numberOfFrame},'EdgeColor','none');
% view(0,-90);
% rotate3d off;
% colormap(jet);
% grid on;
axis equal;

par='or';
for i=1:size(points{1,1},1)
    for j=1:size(points{1,1},2)
        scatter3(points{1,numberOfFrame}{i,j}(1),points{1,numberOfFrame}{i,j}(2)*1000,points{1,numberOfFrame}{i,j}(3),par);
        hold on;
    end
    if par=='or'
        par='ob';
    else
        par='or';
    end
end
axis equal;
hold off;
end

