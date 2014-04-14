%% find center of fabric in all time on RGB images
%
function [ centerOfFabric ] = findCenterOfFabric( mask )

centerOfFabric=cell(size(mask));
centerOfFabric(2,:)=mask(2,:);

for i=1:size(mask,2);
    centerOfFabric(1,i)={findCenter(mask{1,i}(:,:,1))};
end
end


%% find center of fabric on one picture
function [center] = findCenter (singlePicture)
center=nan(size(singlePicture,1),1);

for i=1:size(singlePicture,1)
    first=find(singlePicture(i,:,1)==1,1,'first');
    last=find(singlePicture(i,:,1)==1,1,'last');
    if ~isempty(first)
        center(i)=(first+last)/2;
    end
end
end