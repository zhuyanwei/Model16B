

svm = 'RBF';  % 'RBF', 'Poly' or 'Linear'


[Weights,Bias,SVs,Weights_sizepre,Bias_sizepre,svm_used,iteration]=RankSVM_train(train_data,train_target,svm,cost,lambda_tol,norm_tol,max_iter);

[HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Threshold,Pre_Labels]=RankSVM_test(test_data,test_target,svm,Weights,Bias,SVs,Weights_sizepre,Bias_sizepre);