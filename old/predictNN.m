name = 'manoj';
load(strcat('trainedmodels/model_',name,'.mat'));
model_manoj = model;

clear model

t=[];
i=4;
baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
t = [t; x1];
x1 = vec2img(strcat('names/',baseFileName),[515 70]);
t = [t ;x1];
x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
t = [t; x1];

fprintf('\nPrediction for positive value:');
display(sim(model_manoj,t));

t=[];
i=2;
baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
t = [t; x1];
x1 = vec2img(strcat('names/',baseFileName),[515 70]);
t = [t ;x1];
x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
t = [t; x1];

fprintf('\nPrediction for negative value:');
display(sim(model_manoj,t));


clear 