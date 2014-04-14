function [] = showCenterOfFabric( centerOfFabric, n)
kons=size(centerOfFabric{1,1},1);
if kons==1024
    kons2=1280;
else
    kons2=640;
end
im=nan(kons,kons2);
for i=1:kons
    index=centerOfFabric{1,n}(i,1);
    if ~isnan(index)
        im(i,round(index))=1;
    end
end

imshow(im);

end

