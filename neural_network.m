clear
X = [];
Y = [];

%==========================================================================
% getting soumak's samples for ids,name,sign

samples = 12;
name = 'soumak';

for i = 1:samples
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = img2vec(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = img2vec(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = img2vec(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    X = [X t];
end

for i = 1:samples
    a = [1;0];
    Y = [Y a];
end

fprintf('\nAdded %d soumak''s training values...\n',samples);
%==========================================================================




% %==========================================================================
% getting manoj's samples for ids,name,sign

samples = 12;
name = 'manoj';

for i = 1:samples
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = img2vec(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = img2vec(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = img2vec(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    X = [X t];
end

for i = 1:samples
      a = [0;1];
    Y = [Y a];
end


fprintf('\nAdded %d manoj''s training values...\n',samples);
clearvars -except X Y
%==========================================================================


% %==========================================================================
% % training model

saveModel = 0;

fprintf('\nTraining network...\n');
prnet = newpr(X,Y,100);
trainedprnet = train(prnet,X,Y);


if(saveModel==1)
    var = strcat('model_','classifier');
    S.('model') =trainedprnet;
    save(strcat('trainedmodels/',var,'.mat'),'-struct','S')  
    fprintf('\nSaving trained network with name %s...\n',var);
end


% %==========================================================================

clearvars -except trainedprnet

% %==========================================================================
% % test images
init = 13;
samples = 2;
name = 'soumak';
fprintf('\nPrediction with soumak''s data::');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = img2vec(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = img2vec(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = img2vec(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    display(sim(trainedprnet,t));
end

init = 12;
samples = 2;
name = 'manoj';
fprintf('\nPrediction with manoj''s data::');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = img2vec(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = img2vec(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = img2vec(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    display(sim(trainedprnet,t));
end



clear
% %==========================================================================

