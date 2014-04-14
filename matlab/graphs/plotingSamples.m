for i=1:4
subplot(2,2,i);
%     imshow(filtredFrontOfRGB{1, 5+5*i});
    showCenterOfFabric( centerOfFabric, 5+5*i)
    axis on;
    xlabel('px');
    ylabel('px');
    hold on;
     %plot(struct_points{1, 5+5*i}(:,2),struct_points{1, 5+5*i}(:,1),'or');
end