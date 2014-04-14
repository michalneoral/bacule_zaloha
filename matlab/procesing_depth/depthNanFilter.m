% function for finding area of moving subject

function [ nanmask ] = depthNanFilter( frontOfDepth )
nanmask=zeros(size(frontOfDepth{1,1}));
for i=1:size(frontOfDepth,2)
    nanmask=nanmask+(~isnan(frontOfDepth{1,i}));
end
nanmask=nanmask~=0;

end

