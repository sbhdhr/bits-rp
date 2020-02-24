clear
X = [];
Y = [];
sf = [330 70];
%==========================================================================
% getting positive samples for ids

samples = 14;

for i = 1:samples
    baseFileName = strcat('ids/manoj_true/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,sf);
    X = [X x1];
end

for i = 1:samples
    a = [1;0];
    Y = [Y a];
end


fprintf('\nAdded %d positive training values...\n',samples);
%==========================================================================




% %==========================================================================
% % getting negative samples for ids

samples = 12;

for i = 1:samples
    baseFileName = strcat('ids/manoj_false/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,sf);
    X = [X x1];
end

for i = 1:samples
      a = [0;1];
    Y = [Y a];
end


fprintf('\nAdded %d negative training values...\n',samples);
clearvars -except X Y sf
%==========================================================================


% %==========================================================================
% % training model


prnet = newpr(X,Y,20);
trainedprnet = train(prnet,X,Y);
fprintf('\nTraining network...\n');

% %==========================================================================


% %==========================================================================
% % test images
baseFileName = 'ids/manoj_false/2.jpg';
tmf = vec2img(baseFileName,sf);

baseFileName = 'ids/manoj_true/4.jpg';
tmt = vec2img(baseFileName,sf);

clear baseFileName

fprintf('\nPrediction for negative value:');
display(sim(trainedprnet,tmf));

fprintf('\nPrediction for positive value:');
display(sim(trainedprnet,tmt));


clear
% %==========================================================================

