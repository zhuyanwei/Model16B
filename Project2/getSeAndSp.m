%
% draw ROC 
%
Threshold_set = 1000;
SeAll = zeros(1, 200);
SpAll = zeros(1, 200);
for k = 1 : 1 : 200
    
    Threshold_set = Threshold_set + k * 100;
    
    getHist
    init_data
 
    %get the training(testing) data and training result
    XTrain = xTrain(:,2:1:end);
    YTrain = xTrain(:,1);
    XTest = xTest(:,2:1:end);
    YTest = xTest(:,1);
    
    [nsamples, nfeatures] = size(XTrain);
    w0 = rand(nfeatures + 1, 1);
    w = logisticW( XTrain, YTrain, w0, 100, 0.01);
    %output w
    disp(w);
    res = logisticClassify( XTest, w );
    
    errors = abs(YTest - res);
    err = sum(errors);
    percentage = 1 - err / size(XTest, 1)
    
    getSNPsOrderWeight
    predict = res;
    real  = YTest;
    TP =0;
    TN =0;
    FP =0;
    FN =0;
    for i=1:1:200
        if real(i, 1)==1 && predict(i, 1)==1
            TP = TP + 1;
        elseif real(i, 1)==0 && predict(i, 1)==0
            TN = TN + 1;
        elseif real(i, 1)==0 && predict(i, 1)==1
            FP = FP + 1;
        else real(i, 1)==1 && predict(i, 1)==0
            FN = FN + 1;
        end
    end
    
    Se(1, k) = TP*1.0 /(TP + FN);
    Sp(1, k) = TN*1.0 /(TN + FP);
end