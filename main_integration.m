function [result] = main_integration(dataname,avg_cls,ttt)
    % Initialization
    % Fixed seed
    rng('default')
    addpath(genpath('datasets')); % Add path
    addpath(genpath('functions'));
    addpath(genpath('metrics'));

    disp(dataname);
    % Import data set
    [pLabels,data,target] = addnoise(dataname,avg_cls);
    %%
    par = params_settings(ttt);
    opt.lambda = par(1);
    opt.alpha = par(2);
    opt.beta = par(3);
    opt.gamma = par(4);
    opt.max_iter = 50;
    %%
    [N,~] = size(data);
    indices = crossvalind('Kfold', 1:N ,10);  % Dividing the data set
    result = {};
    %% Ten fold cross verification
    for round = 1:10
        ht = round*10;
        fprintf('%.1f%%\n',ht)
        test_idxs = (indices == round);                       
        train_idxs = ~test_idxs;                       
        train_data = data(train_idxs,:);                                           
        train_target = pLabels(train_idxs,:);                                          
                                       
        test_data = data(test_idxs,:);                                          
        test_target = target(test_idxs,:);
                        
                          
        % pre-processing                                      
        [train_data, settings]=mapminmax(train_data');                                        
        test_data=mapminmax('apply',test_data',settings);                                          
        train_data(isnan(train_data))=0;                                           
        test_data(isnan(test_data))=0;                                           
        train_data=train_data';                                           
        test_data=test_data';                                             
        X = train_data;
        Xt = test_data;
        Y = train_target;
        Yt = test_target;

        [S,Ds]= knn_S(train_data, 5);
        opt.S = S;
        opt.Ds = Ds;

        % High dimensional kernel mapping   
        
        [X,Xt] = Kernel_mapping(X',Xt');                       
  
       
        %% training
        model = PML_MA(X,Y,opt);
        time(round) = model.time;
        %% testing
        Y_pred = Xt*model.W;
        % Y_pred = H_Xt'*model.W;

        threshold = 0.5;
        Pre_Labels = zeros(size(Yt,1),size(Yt,2));
        Pre_Labels(Y_pred>=threshold)=1;
        Pre_Labels(Y_pred<threshold)=0;

        HammingLoss(round) = Hamming_loss(Pre_Labels',Yt');
        RankingLoss(round) = Ranking_loss(Y_pred',Yt');
        OneError(round) = One_error(Y_pred',Yt');
        Coverage(round) = coverage(Y_pred',Yt');
        AveragePrecision(round) = Average_precision(Y_pred',Yt');
    end
    fprintf('%s,avg_cls=%.2f,lamba=%.5f,alpha=%.5f,beta=%.5f,gamma=%.5f\n HammingLoss=%.3f±%.3f\n RankingLoss=%.3f±%.3f\n OneError=%.3f±%.3f\n Coverage=%.3f±%.3f\n AveragePrecision=%.3f±%.3f\n', ...
        dataname,avg_cls,opt.lambda,opt.alpha,opt.beta,opt.gamma,mean(HammingLoss),std(HammingLoss),mean(RankingLoss),std(RankingLoss),mean(OneError),std(OneError),mean(Coverage),std(Coverage),mean(AveragePrecision),std(AveragePrecision));
    fprintf('oral_time=%.2f秒\n',sum(time));
    clear X Y Xt Yt K Kt Ls N data target train_data test_data train_target test_target ht Ds S ttt indices opt round settings train_idxs test_idxs
    filename = strcat('results/',dataname,'_avg_',num2str(avg_cls),'_predict.mat');
    save(filename);
    result = {HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision};
end