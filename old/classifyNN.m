
name1 = 'manoj';
f = strcat('trainedmodels/id_name_sign/model_',name1,'.mat');
display(strcat('Loading ',f));
load(f);
model_manoj = model;

clear model


name2 = 'soumak';
f = strcat('trainedmodels/id_name_sign/model_',name2,'.mat');
display(strcat('Loading ',f));
load(f);
model_soumak = model;

clear model



% %==========================================================================
% % create test image matrix
testName = 'soumak';
count = 0;
s = 15;
e =18;
len = e-s;
for i = s:e
    t=[];
    baseFileName = strcat(testName,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    o1 = sim(model_manoj,t);
    if(o1(1)>o1(2))
        p1=1;
    else
        p1=0;
    end
    o2 = sim(model_soumak,t);
    if(o2(1)>o2(2))
        p2=1;
    else
        p2=0;
    end
    if(p1==0 && p2==1)
        count = count+1;
    end
   
end
% fprintf('\nPrediction accuracy for Soumak : %0.2f \n',count*100/s);

testName = 'manoj';
count = 0;
s = 2;
e =14;
len = len+e-s;
for i = s:e
    t=[];
    baseFileName = strcat(testName,'_true/',int2str(i),'.jpg');
    x1 = vec2img(strcat('ids/',baseFileName),[330 70]);
    t = [t; x1];
    x1 = vec2img(strcat('names/',baseFileName),[515 70]);
    t = [t ;x1];
    x1 = vec2img(strcat('signs/',baseFileName),[300 72]);
    t = [t; x1];
    o1 = sim(model_manoj,t);
    if(o1(1)>o1(2))
        p1=1;
    else
        p1=0;
    end
    o2 = sim(model_soumak,t);
    if(o2(1)>o2(2))
        p2=1;
    else
        p2=0;
    end
    if(p1==1 && p2==0)
        count = count+1;
    end
end
fprintf('\nPrediction accuracy (%d/%d): %0.2f \n',count,len,count*100/len);


clear 

% %==========================================================================

