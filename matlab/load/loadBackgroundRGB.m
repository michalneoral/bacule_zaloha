function [ rgb_back ] = loadBackgroundRGB( path_to_bag_files, name )
%LOADBACKGROUNDRGB load a picture of background in rgb mode
%   
picture_n=3;

topics=cell(1,1);
topics{1,1}='/xtion1/rgb/image_raw';

path_and_bagfile = strcat(path_to_bag_files, name);
bag_background = ros.Bag(path_and_bagfile);
[msgs_back] = bagToStruct(bag_background,topics);
topic_position=getTopicPosition(msgs_back, '/xtion1/rgb/image_raw');
height=msgs_back{topic_position,1}{1,picture_n}.height;
width=msgs_back{topic_position,1}{1,picture_n}.width;
picture=queueToImageRGB(msgs_back{topic_position,1}{1,picture_n}.data,width,height);
rgb_back = normalizeRGB (picture,width,height);

end

