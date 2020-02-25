
name1 = 'manoj';
display(strcat('Loading trainedmodels/model_',name1,'.mat'));
load(strcat('trainedmodels/model_',name1,'.mat'));
model_manoj = model;

clear model


name2 = 'soumak';
display(strcat('Loading trainedmodels/model_',name2,'.mat'));
load(strcat('trainedmodels/model_',name2,'.mat'));
model_soumak = model;

clear model



% %==========================================================================
% % create test image matrix
testName = 'soumak';
count = 0;
s =18;
for i = 1:s
    t=[];
    baseFileName = strcat(testName,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    o1 = sim(model_manoj,t);
    o2 = sim(model_soumak,t);
    if(o1(1)<o2(1))
        count = count + 1;
    end
end
fprintf('\nPrediction accuracy for Soumak : %0.2f \n',count*100/s);

testName = 'manoj';
count = 0;
s = 14;
for i = 1:s
    t=[];
    baseFileName = strcat(testName,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    o1 = sim(model_manoj,t);
    o2 = sim(model_soumak,t);
    if(o1(1)>o2(1))
        count = count + 1;
    end
end
fprintf('\nPrediction accuracy for Manoj : %0.2f \n',count*100/s);


clear 

% %==========================================================================

