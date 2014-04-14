if ~ exist('countImage','var')
    countImage=1;
end
if countImage > size(frontOfDepth,2)
    countImage=1;
end

surf(frontOfDepth{1,countImage},'EdgeColor','none');
view(0,-90);
rotate3d off;
colormap(jet);
grid on;
axis equal;
countImage=countImage+1;