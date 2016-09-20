

% svm.type = 'Linear';  % 'RBF', 'Poly' or 'Linear'
% % svm.para = 0.0033;
% svm.para = [];
% cost = 1;
% lambda_tol = 1e-16;
% norm_tol = 1e-14;
% max_iter = 50;
% [Weights,Bias,SVs,Weights_sizepre,Bias_sizepre,svm_used,iteration]=RankSVM_train(train_data,train_multiPh,svm,cost,lambda_tol,norm_tol,max_iter);
% 
% [HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Threshold,Pre_Labels]=RankSVM_test(test_data,test_multiPh,svm,Weights,Bias,SVs,Weights_sizepre,Bias_sizepre);

rankSVM_W = Weights_sizepre * Weights * SVs'*1000;
[m, n] = size(presetGenotype);
AbsRankSVM_W = zeros(1, n);
for i=1:1:n
    AbsRankSVM_W(1, i) = abs(rankSVM_W(1, i));
end
