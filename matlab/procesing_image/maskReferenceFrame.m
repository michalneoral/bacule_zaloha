function [maskFrontOfRGB] =maskReferenceFrame(frontOfRGB,referenceFrame,sizeMorpMask)
    if nargin < 3
        sizeMorpMask=15;
    end
dim = size(frontOfRGB,2);
maskFrontOfRGB=cell(2,dim);
maskFrontOfRGB(2,:)=frontOfRGB(2,:);

for i=1:dim
[ maskImage] = maskDetection( frontOfRGB{1,i},referenceFrame,sizeMorpMask );
maskFrontOfRGB(1,i)={maskImage};
end

end

function [maskImage] = maskDetection( image1,image2,openMask )
    if nargin < 3
        openMask=15;
    end
offset = 0.1;
%% Masked part of picture - this is a part of picture where is a visible part of manipulator. This is a mistake and must be removed.
A=ones(size(image1,1),size(image1,2));
%A(1:200,1:300)=0;
%A(300:600,1000:1280)=0;
 A(1:100,1:200)=0;   
%% determine the difference between the reference and the desired image
maskImage = abs(image1-image2) >= offset;
maskImage(:,:,1) = (maskImage(:,:,1)+maskImage(:,:,2)+maskImage(:,:,3)) >= 1-offset;

%% mathematical morphology opening
openingMask = ones (openMask);
maskImage(:,:,1) = imopen(maskImage(:,:,1),openingMask);


% %% mathematical morphology closing
% closingMask = ones (20);
% maskImage(:,:,1) = imclose(maskImage(:,:,1),closingMask);


%%
maskImage(:,:,1) = maskImage(:,:,1).*A;
maskImage(:,:,2) = maskImage(:,:,1);
maskImage(:,:,3) = maskImage(:,:,2);

maskImage = nullToNan(maskImage);

end

function [Mask] = nullToNan(Mask)
    Mask=double(Mask);
    Mask(Mask==0)=nan;
end