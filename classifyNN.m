

f = 'trainedmodels/model_classifier.mat';
display(strcat('Loading ',f));
load(f);
classifier = model;

clear model


% %==========================================================================
% % test images

count = 0;
tot_samples = 0; 




init = 6;
samples = 10;
name = 'soumak';
tot_samples = tot_samples+ samples;
fprintf('\nAdding soumak''s test samples::');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = img2vec(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = img2vec(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = img2vec(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    out = sim(classifier,t);
    if(out(1)>out(2))
        count = count+1;
    end
end

init = 2;
samples = 10;
name = 'manoj';
tot_samples = tot_samples+ samples;
fprintf('\nAdding manoj''s test samples::');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = img2vec(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = img2vec(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = img2vec(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    out = sim(classifier,t);
    if(out(1)<out(2))
        count = count+1;
    end
end

fprintf('\nPrediction accuracy (%d/%d) :: %0.2f \n',count,tot_samples,count*100/tot_samples);

clear





