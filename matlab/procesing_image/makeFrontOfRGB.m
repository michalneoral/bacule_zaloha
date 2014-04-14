% clopema_model_by_vision
% Michal Neoral

%% funkce ktera vytridi z msgs pouze RGB obrazky a casovou znacku
function [ frontOfRGB ] = makeFrontOfRGB( msgs )

topic = '/xtion1/rgb/image_raw';
pos=getTopicPosition(msgs, topic);
height=msgs{pos,1}{1,1}.height;
width=msgs{pos,1}{1,1}.width;
quantity=size(msgs{pos,1},2);
frontOfRGB=cell(1,quantity);
for i=1:quantity
   frontOfRGB(1,i) = {queueToImageRGB(msgs{pos,1}{1,i}.data, width, height)./255 };
end
frontOfRGB(2,:) = getTimeOfTopicEvent( msgs, pos, quantity);


end

% %% Extraction of topic content with time from msgs
% function [queue] = makeQueueOfChoosenTopic(msgs,topic)
%     pos=getTopicPosition(msgs, topic);
%     quantity=size(msgs{pos,1},2);
%     queue=cell(quantity,1);
%     for i=1:quantity
%         queue(i,:) = 
%     end
% end