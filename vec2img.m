function x1 = vec2img(baseFileName,sf)
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
    x1 = x1(:);
%     display(size(x1));
end