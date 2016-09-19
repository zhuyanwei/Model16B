
%Set parameters for the MLKNN algorithm
Num=2;
Smooth=100; % Set the number of nearest neighbors considered to 10 and the smoothing parameter to 1

% Calling the main functions
[Prior,PriorN,Cond,CondN]=MLKNN_train(train_data,train_multiPh,Num,Smooth); % Invoking the training procedure

[HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=MLKNN_test(train_data,train_multiPh,test_data,test_multiPh,Num,Prior,PriorN,Cond,CondN); % Performing the test procedure