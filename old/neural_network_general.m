clear
X = [];
Y = [];
name = 'soumak';
%==========================================================================
% getting positive samples for ids,name,sign

samples = 15;


for i = 1:samples
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    X = [X t];
end

for i = 1:samples
    a = [1;0];
    Y = [Y a];
end

fprintf('\nAdded %d positive training values...\n',samples);
%==========================================================================




% %==========================================================================
% % getting negative samples for ids

samples = 13;

for i = 1:samples
    t=[];
    baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    X = [X t];
end

for i = 1:samples
      a = [0;1];
    Y = [Y a];
end


fprintf('\nAdded %d negative training values...\n',samples);
clearvars -except X Y name
%==========================================================================


% %==========================================================================
% % training model

saveModel = 0;

fprintf('\nTraining network...\n');
prnet = newpr(X,Y,75);
trainedprnet = train(prnet,X,Y);


if(saveModel==1)
    var = strcat('model_',name);
    S.('model') =trainedprnet;
    save(strcat('trainedmodels/id_name_sign/',var,'.mat'),'-struct','S')  
    fprintf('\nSaving trained network with name %s...\n',var);
end


% %==========================================================================


% %==========================================================================
% % test images
init = 16;
samples = 3;
fprintf('\nPrediction for positive values:');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    display(sim(trainedprnet,t));
end

init = 14;
samples = 2;
fprintf('\nPrediction for negative values:');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    display(sim(trainedprnet,t));
end



clear
% %==========================================================================

