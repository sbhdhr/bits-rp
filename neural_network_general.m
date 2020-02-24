clear
X = [];
Y = [];
%==========================================================================
% getting positive samples for ids,name,sign

samples = 14;


for i = 1:samples
    t=[];
    baseFileName = strcat('ids/manoj_true/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,[330 70]);
    t = [t; x1];
    baseFileName = strcat('names/manoj_true/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,[515 70]);
    t = [t ;x1];
    baseFileName = strcat('signs/manoj_true/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,[300 72]);
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

samples = 12;

for i = 1:samples
        t=[];
    baseFileName = strcat('ids/manoj_false/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,[330 70]);
    t = [t; x1];
    baseFileName = strcat('names/manoj_false/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,[515 70]);
    t = [t ;x1];
    baseFileName = strcat('signs/manoj_false/',int2str(i),'.jpg');
    x1 = vec2img(baseFileName,[300 72]);
    t = [t; x1];
    X = [X t];
end

for i = 1:samples
      a = [0;1];
    Y = [Y a];
end


fprintf('\nAdded %d negative training values...\n',samples);
clearvars -except X Y 
%==========================================================================


% %==========================================================================
% % training model


prnet = newpr(X,Y,20);
trainedprnet = train(prnet,X,Y);
fprintf('\nTraining network...\n');

% %==========================================================================


% %==========================================================================
% % test images
o=[];
baseFileName = 'ids/manoj_false/2.jpg';
t = vec2img(baseFileName,[330 70]);
o = [o;t];
baseFileName = 'names/manoj_false/2.jpg';
t = vec2img(baseFileName,[515 70]);
o = [o;t];
baseFileName = 'signs/manoj_false/2.jpg';
t = vec2img(baseFileName,[300 72]);
o = [o;t];

fprintf('\nPrediction for negative value:');
display(sim(trainedprnet,o));


o=[];
baseFileName = 'ids/manoj_true/2.jpg';
t = vec2img(baseFileName,[330 70]);
o = [o;t];
baseFileName = 'names/manoj_true/2.jpg';
t = vec2img(baseFileName,[515 70]);
o = [o;t];
baseFileName = 'signs/manoj_true/2.jpg';
t = vec2img(baseFileName,[300 72]);
o = [o;t];

fprintf('\nPrediction for positive value:');
display(sim(trainedprnet,o));


clear
% %==========================================================================
