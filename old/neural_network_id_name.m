clear
X = [];
Y = [];
name = 'manoj';
col1 = 'ids';
sf1 = [330 70];
col2 = 'names';
sf2 = [515 70];
%==========================================================================
% getting positive samples for col

samples = 12;


for i = 1:samples
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col1,'/',baseFileName),sf1);
    t = [t; x1];
    x1 = vec2img(strcat(col2,'/',baseFileName),sf2);
    t = [t ;x1];
    X = [X t];
end

for i = 1:samples
    a = [1;0];
    Y = [Y a];
end

fprintf('\nAdded %d positive training values...\n',samples);
%==========================================================================




% %==========================================================================
% % getting negative samples for cols

samples = 10;

for i = 1:samples
    t=[];
    baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col1,'/',baseFileName),sf1);
    t = [t; x1];
    x1 = vec2img(strcat(col2,'/',baseFileName),sf2);
    t = [t ;x1];
    X = [X t];
end

for i = 1:samples
      a = [0;1];
    Y = [Y a];
end


fprintf('\nAdded %d negative training values...\n',samples);

%==========================================================================


% %==========================================================================
% % training model

saveModel = 1;

fprintf('\nTraining network...\n');
prnet = newpr(X,Y,35);
trainedprnet = train(prnet,X,Y);


if(saveModel==1)
    var = strcat('model_',name);
    S.('model') =trainedprnet;
    save(strcat('trainedmodels/id_name/',var,'.mat'),'-struct','S')  
    fprintf('\nSaving trained network with name %s...\n',var);
end


%==========================================================================

clear X Y


% %==========================================================================
% % test images

init = 13;
samples = 2;
fprintf('\nPrediction for positive values:');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col1,'/',baseFileName),sf1);
    t = [t; x1];
    x1 = vec2img(strcat(col2,'/',baseFileName),sf2);
    t = [t; x1];
    display(sim(trainedprnet,t));
end

init = 11;
samples = 2;
fprintf('\nPrediction for negative values:');
for i = init:init+samples-1
    t=[];
    baseFileName = strcat(name,'_false/',int2str(i),'.jpg');
    x1 = vec2img(strcat(col1,'/',baseFileName),sf1);
    t = [t; x1];
    x1 = vec2img(strcat(col2,'/',baseFileName),sf2);
    t = [t; x1];
    display(sim(trainedprnet,t));
end


clear
% %==========================================================================

