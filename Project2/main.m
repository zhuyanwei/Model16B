%main script
% output:  get the weighted martic w(presetNum, 1)
%....................................%
% first,    run getHist.m --->may be set the Threshold to get the preset SNPs num for train or test, less than train num 
% second,   run init_data.m --->get the xTrain and xTest data for logisticW
% third,    main.m
%....................................%
%get the training(testing) data and training result
XTrain = xTrain(:,2:1:end);
YTrain = xTrain(:,1);
XTest = xTest(:,2:1:end);
YTest = xTest(:,1);

[nsamples, nfeatures] = size(XTrain);
w0 = rand(nfeatures + 1, 1);
w = logisticW( XTrain, YTrain, w0, 10000, 0.01);
%output w
disp(w);
res = logisticClassify( XTest, w );

errors = abs(YTest - res);
err = sum(errors);
percentage = 1 - err / size(XTest, 1)