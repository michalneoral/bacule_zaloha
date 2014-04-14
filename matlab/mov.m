figure
for k = 1:size(struct_points,2)
% 	hold off
%     subplot(1,3,1);
% 
%     plot(points(:,2,k),-points(:,1,k));
% 	
%     axis equal;
%     axis([0 640 -480 0]);
%     
% 	subplot(1,3,2);
% 
%     imshow(frontOfRGB{1,k});
%     
%     subplot(1,3,3);

    axis equal;
    axis([0 640 0 480]);
    %imshow(frontOfRGB{1,k});
    imshow(maskFrontOfRGB{1,k});
    hold on;
    plot(struct_points{1, k}(:,2),struct_points{1, k}(:,1),'or');
    
    
    
    M(k) = getframe(gcf);
end

%clf
%axes('Position',[0 0 1 1])
movie(M,30)