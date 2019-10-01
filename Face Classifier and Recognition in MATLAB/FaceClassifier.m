clc;
clear all;
close all;
[fname path]=uigetfile('.png','Open a face for testing');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);
title('Input Face');

Ftest=FeatureStatistical(im);

%Comparing with database
load db.mat;
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for i=1:size(Ftrain,1)
    dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(dist);
if(Min<3)
    m=find(dist==Min,1);
    det_class=Ctrain(m);
    msgbox(strcat('Detected Class=',num2str(det_class)));
else
    msgbox('This person is not recognized');
end
