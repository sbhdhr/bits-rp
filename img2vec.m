function x2 = img2vec(baseFileName,sf)
    fullFileName = fullfile(pwd, baseFileName);

    if ~exist(fullFileName, 'file')
        errorMessage = sprintf('Error: %s does not exist.', fullFileName);
        uiwait(warndlg(errorMessage));
        return;
    end
    % Read the image from disk.
    rgbImage = imread(fullFileName);
    rgbImage= imresize(rgbImage, sf);

    grayImage = rgb2gray(rgbImage);
    x1 = dct2(grayImage);
    x2 = [];
    for i = 1:sf(1)
        for j = sf(2)-i:-11:1
            %fprintf('%d - %d',i,j);
            x2 = [x2;x1(i,j)];
        end
    end
   %display(x2);
end