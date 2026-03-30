fprintf('%s,avg_cls=%.1f,lambda=%.5f,alpha=%.5f,beta=%.5f,gamma=%.5f\n HammingLoss=%.3f±%.3f\n RankingLoss=%.3f±%.3f\n OneError=%.3f±%.3f\n Coverage=%.3f±%.3f\n AveragePrecision=%.3f±%.3f\n', ...
                        dataname,avg_cls,opt.lambda,opt.alpha,opt.beta,opt.gamma,mean(HammingLoss),std(HammingLoss),mean(RankingLoss),std(RankingLoss),mean(OneError),std(OneError),mean(Coverage),std(Coverage),mean(AveragePrecision),std(AveragePrecision));

% 1.mirflickr(5.29)      % 2.music_emotion(6.04)  % 3.music_style(3.35)   % 4.YeastBP(18.84)
% 5.emotions(3)          % 6.emotions(4,5)        % 7.birds(3,4,5)        % 8.flags(4,5,6)        
% 9.image(2,3,4)         % 10.scene(3,4,5)        % 11.health(5,7,9)      % 12.recreation(7,9,11)
% 13.science(5,7,9)      % 14.education(5,7,9)    % 15.arts(5,7,9,11)     % 16.yeast(5,7,9,11)
% 17.reference(5,7,9,11) % 18.foodtruck(5,7,9)    % 19.corel5k(5,7,9,11)  % 20.enron(3,5,7,9) 
% 21.medical(3,5,7,9)
