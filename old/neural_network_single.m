clear
X = [];
Y = [];
name = 'soumak';
col1 = 'ids';
sf1 = [330 70];
col2 = 'names';
sf2 = [515 70];
%==========================================================================
% getting positive samples for col

samples = 15;


for i = 1:samples
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col,'/',baseFileName),sf);
    X = [X x1];
end

for i = 1:samples
    a = [1;0];
    Y = [Y a];
end

fprintf('\nAdded %d positive training values...\n',samples);
%==========================================================================




% %==========================================================================
% % getting negative samples for cols

samples = 12;

for i = 1:samples
    baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col,'/',baseFileName),sf);
    X = [X x1];
end

for i = 1:samples
      a = [0;1];
    Y = [Y a];
end


fprintf('\nAdded %d negative training values...\n',samples);
clearvars -except X Y name col sf
%==========================================================================


% %==========================================================================
% % training model

saveModel = 1;

fprintf('\nTraining network...\n');
prnet = newpr(X,Y,50);
trainedprnet = train(prnet,X,Y);


if(saveModel==1)
    var = strcat('model_',name);
    S.('model') =trainedprnet;
    save(strcat('trainedmodels/id/',var,'.mat'),'-struct','S')  
    fprintf('\nSaving trained network with name %s...\n',var);
end


%==========================================================================

clear X Y


% %==========================================================================
% % test images

init = 16;
samples = 3;
fprintf('\nPrediction for positive values:');
for i = init:init+samples-1
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col,'/',baseFileName),sf);
    display(sim(trainedprnet,x1));
end

init = 13;
samples = 3;
fprintf('\nPrediction for negative values:');
for i = init:init+samples-1
    baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col,'/',baseFileName),sf);
    display(sim(trainedprnet,x1));
end


clear
% %==========================================================================

