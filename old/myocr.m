function text = myocr( filename )
%OCR Summary of this function goes here
%   Detailed explanation goes here


    infoRes = imfinfo(filename);
    img = imread(filename);
%     figure
%     imshow(img)
    % infoRes.Width
    % infoRes.Height

    % crpImg = imcrop(img,[8,8,infoRes.Width-8,infoRes.Height-15]);
    % figure(2)
    % imshow(crpImg)
    grayImg = rgb2gray(img);

    bwImg = imbinarize(grayImg);
    ocrResults = ocr(bwImg,[8,8,infoRes.Width-8,infoRes.Height-10]);
    % % 
    % % figure
    % % imshowpair(grayImg,bwImg,'montage')

    text = ocrResults.Text;

end

