function y = extractSigns( rgbImage,lt, ut, offset ,width,height)
%EXTRACTSIGNS Summary of this function goes here
%   Detailed explanation goes here

    deleteAllFiles('signs','*.jpg');
    % Cropping signatures ==============

    for i = 0:17
        i2 = imcrop(rgbImage,[lt+offset,ut+(i*height),width,height]);
        filename = fullfile('.\signs',strcat(int2str(i+1),'.jpg'));
        i2 = imcrop(i2,[3,3,width-3,height-3]);
        imwrite(i2,filename);
        %imshow(i2);
    end


    %============================
    
    y = width + 1;

end

