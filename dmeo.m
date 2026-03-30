clear
clc
close all
% rng('default')
dataname = 'scene';
avg_cls = 3;% The amount of noise added
params = 10;
%main_integration('dataname',avg_cls,params);
%%
% 1.mirflickr(5.29)      % 2.music_emotion(6.04)  % 3.music_style(3.35)   % 4.YeastBP(18.84)
% 5.emotions(3)          % 6.emotions(4,5)        % 7.birds(3,4,5)        % 8.flags(4,5,6)        
% 9.image(2,3,4)         % 10.scene(3,4,5)        % 11.health(5,7,9)      % 12.recreation(7,9,11)
% 13.science(5,7,9)      % 14.education(5,7,9)    % 15.arts(5,7,9,11)     % 16.yeast(5,7,9,11)
% 17.reference(5,7,9,11) % 18.foodtruck(5,7,9)    % 19.corel5k(5,7,9,11)  % 20.enron(3,5,7,9) 
% 21.medical(3,5,7,9)

% %% 1 2 3 4
% [~] = main_integration('mirflickr',5.29,1);
% [~] = main_integration('music_emotion',6.04,2);
% [~] = main_integration('music_style',3.35,3);
% [~] = main_integration('YeastBP',18.84,4);
% %% 5 6
% [~] = main_integration('emotions',3,5);
% [~] = main_integration('emotions',4,6);
% [~] = main_integration('emotions',5,6);
% %% 7
[~] = main_integration('birds',3,7);
[~] = main_integration('birds',4,7);
[~] = main_integration('birds',5,7);
% %% 8
% [~] = main_integration('flags',4,8);
% [~] = main_integration('flags',5,8);
% [~] = main_integration('flags',6,8);
% %% 9
% [~] = main_integration('image',2,9);
% [~] = main_integration('image',3,9);
% [~] = main_integration('image',4,9);
% %% 10 
% [~] = main_integration('scene',3,10);
% [~] = main_integration('scene',4,10);
% [~] = main_integration('scene',5,10);
% %% 11 
% [~] = main_integration('health',5,11);
% [~] = main_integration('health',7,11);
% [~] = main_integration('health',9,11);
% % %% 12
% [~] = main_integration('recreation',7,12);
% [~] = main_integration('recreation',9,12);
% [~] = main_integration('recreation',11,12);
% %% 13
% [~] = main_integration('science',5,13);
% [~] = main_integration('science',7,13);
% [~] = main_integration('science',9,13);
% %% 14
% [~] = main_integration('education',5,14);
% [~] = main_integration('education',7,14);
% [~] = main_integration('education',9,14);
% %% 15
% [~] = main_integration('arts',5,15);
% [~] = main_integration('arts',7,15);
% [~] = main_integration('arts',9,15);
% [~] = main_integration('arts',11,15);
% %% 16
% [~] = main_integration('yeast',5,16);
% [~] = main_integration('yeast',7,16);
% [~] = main_integration('yeast',9,16);
% [~] = main_integration('yeast',11,16);
% %% 17
% [~] = main_integration('reference',5,17);
% [~] = main_integration('reference',7,17);
% [~] = main_integration('reference',9,17);
% [~] = main_integration('reference',11,17);
% % 18
% [~] = main_integration('foodtruck',5,18);
% [~] = main_integration('foodtruck',7,18);
% [~] = main_integration('foodtruck',9,18);
% %% 19
% [~] = main_integration('corel5k',5,19);
% [~] = main_integration('corel5k',7,19);
% [~] = main_integration('corel5k',9,19);
% [~] = main_integration('corel5k',11,19);
% %% 20
% [~] = main_integration('enron',3,20);
% [~] = main_integration('enron',5,20);
% [~] = main_integration('enron',7,20);
% [~] = main_integration('enron',9,20);
% %% 21
% [~] = main_integration('medical',3,21);
% [~] = main_integration('medical',5,21);
% [~] = main_integration('medical',7,21);
% [~] = main_integration('medical',9,21);

clear 