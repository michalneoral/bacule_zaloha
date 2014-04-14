 background_2=rgb_back;
 background_2(:,1:550,:)=frontOfRGB{1,18}(:,1:550,:);
 background_2(824:1024,500:1280,:)=frontOfRGB{1,28}(824:1024,500:1280,:);
 imshow(background_2);