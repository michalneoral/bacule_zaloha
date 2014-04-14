% function get back position od searching points

function [ pointPattern ] = depthPointsPosition( nanmask, n_points_x, n_points_z, otherMask )
%% initialize
default_x=5;
default_z=8;
default_mask=ones(size(nanmask));
frame_width=20;

if nargin == 3
    otherMask=default_mask;
elseif nargin == 2
    otherMask=n_points_x;
    n_points_x=default_x;
    n_points_z=default_z;
elseif nargin == 1
    otherMask=default_mask;
    n_points_x=default_x;
    n_points_z=default_z;
end

nanmask=nanmask.*otherMask;

%% finding corners of area of points
west=size(nanmask,2);
east=1;
south=size(nanmask,1);
north=1;
for i=1:size(nanmask,1)
    first=find(nanmask(i,:)==1,1,'first');
    last=find(nanmask(i,:)==1,1,'last');
    if ~isempty(first) && ~isempty(last)
        if first<west
            west=first;
        end
        if last>east
            east=last;
        end
    end
end
for i=1:size(nanmask,2)
    first=find(nanmask(:,i)==1,1,'first');
    last=find(nanmask(:,i)==1,1,'last');
    if ~isempty(first) && ~isempty(last)
        if first<south
            south=first;
        end
        if last>north
            north=last;
        end
    end

end

% disp(east);
% disp(west);
% disp(south);
% disp(north);


%% frame with cutting and conditions
east=east-frame_width;
south=south+frame_width;
west=west+frame_width;
north=north-frame_width;

if west > east
    west=east;
end
if north < south
    north = south;
end

%% find points

x_part = (east-west)/(n_points_x-1);
z_part = (north-south)/(n_points_z-1);
pointPattern=cell(n_points_z,n_points_x);
for i=0:n_points_x-1
    for j=0:n_points_z-1
        pointPattern(j+1,i+1)={[round(west+i*x_part), 0, round(south+j*z_part)]};
    end
end


end

