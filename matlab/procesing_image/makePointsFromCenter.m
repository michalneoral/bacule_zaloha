% function make 2d point clound from RGB images

function [ struct_points ] = makePointsFromCenter( centerOfFabric, points_n, time_of_start )

if nargin<3
    time_of_start=0;
end

images=size(centerOfFabric,2);
time=cell2mat(centerOfFabric(2,:))-time_of_start;
allpoints=cell2mat(centerOfFabric(1,:));
struct_points=cell(2,images);

[startOfFabric,endOfFabric]=findStartEndFabric(allpoints);

stepHalf=(endOfFabric-startOfFabric)/(2*(points_n-1));
%disp(stepHalf);
thisPoint=zeros(size(allpoints,1),1);

points=zeros(points_n,2,images);
    for i=1:images
        %size(points(:,:,i))
            thisPoint(:,1)=1:size(allpoints,1);
            thisPoint(:,1)=round(allpoints(:,i)+thisPoint(:,1)-allpoints(:,i));
            for j=1:points_n
                points(j,1,i)=nanmean( thisPoint(round(startOfFabric-stepHalf+2*(j-1)*stepHalf):round(startOfFabric+stepHalf+2*(j-1)*stepHalf),1) );
                points(j,2,i)=nanmean( allpoints(round(startOfFabric-stepHalf+2*(j-1)*stepHalf):round(startOfFabric+stepHalf+2*(j-1)*stepHalf),i) );
            end
        %points(:,:,i) = makePointsFromImage( allpoints(:,i), points_n, startOfFabric, stepHalf );
        struct_points(1,i)={points(:,:,i)};
        struct_points(2,i)={time(i)};
    end
end


% to do
function [startOfFabric,endOfFabric]=findStartEndFabric(allpoints)

    startOfFabric=70;
    endOfFabric=343;

end


% function [ points ] = makePointsFromImage( P, n, start, stepHalf )
%     
% %disp(P);disp(n);disp(start);disp(stepHalf);
%     
%     points=zeros(n,2,1);
%     for j=1:n
%                 size(points);
%                 points(j,1,1)=1;
%                 points(j,2,1)=nanmean( P((start-stepHalf+2*j*stepHalf):(start+stepHalf+2*j*stepHalf),1) );
%                 
%     end
% end