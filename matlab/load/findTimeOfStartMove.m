function [ timeOfStartMove, out ] = findTimeOfStartMove( msgs )

    topic = '/joint_states';
    offset=5e-5;
    pos=getTopicPosition(msgs, topic);
    quantity=size(msgs{pos,1},2);
    times = cell2mat(getTimeOfTopicEvent( msgs, pos, quantity));
    startPos=zeros(1,quantity);
    for i=1:quantity-1
        startPos(1,i+1)=sum(abs(abs(msgs{1, 1}{1, i}.position)-abs(msgs{1, 1}{1, i+1}.position)))>offset;
    end
    out=startPos;
    startPos=startPos.*times;
    timeOfStartMove=startPos(1,find(startPos,1,'first'));
end

