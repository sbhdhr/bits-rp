clc;    % Clear the command window.
clear;
close all;  % Close all figures (except those of imtool.)
workspace;  % Make sure the workspace panel is showing.
fontSize = 20;

baseFileName = 'sample3.jpg';
fullFileName = fullfile(pwd, baseFileName);

if ~exist(fullFileName, 'file')
    errorMessage = sprintf('Error: %s does not exist.', fullFileName);
    uiwait(warndlg(errorMessage));
    return;
end
% Read the image from disk.
rgbImage = imread(fullFileName);


% Display image full screen.
%imshow(rgbImage);

imfinfo(fullFileName);


%% Cropping starts %%

lt = leftThreshold();
ut = upperThreshold();

height = 77;
widthId = 350;
widthName = 523;
widthSigns = 312;

y = 0;
y = y+ extractIDs(rgbImage,lt,ut,y,widthId,height);

y = y+  extractNames(rgbImage,lt,ut, y,widthName,height);

y = y+ extractSigns(rgbImage,lt,ut,y,widthSigns,height);








