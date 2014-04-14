% function get back depth of point position

function [ points ] = getDepthValueOfPoints( frontOfDepth, pointPattern, area )
    %% init
    if nargin<3
        area = ones(9); % mask of counting pixels
    end
    points = cell(1,size(frontOfDepth,2));
    for i=1:size(frontOfDepth,2)
        points{1,i}=pointPattern;
    end
    fulllenght=size(area,1);
    halflenght=round(size(area,1)/2); % lenght of mask to both side of point
    
    %% assign values
    for i=1:size(pointPattern,1)
        for j=1:size(pointPattern,2)
            x=pointPattern{i,j}(1,1);
            z=pointPattern{i,j}(1,3);
                for k=1:size(frontOfDepth,2)
                    points{1,k}{i,j}(2)=nanmean(nanmean( area.*frontOfDepth{1,k}(z-halflenght+1:z-halflenght+fulllenght, x-halflenght+1:x-halflenght+fulllenght) ));
                end
        end
    end
end

