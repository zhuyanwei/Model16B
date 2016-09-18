%@main.m
%............................main script

%get the training(testing) data and training(testing) result
XTrain = xyTrain(:,2:1:end);
YTrain = xyTrain(:,1);
XTest = xyTest(:,2:1:end);
YTest = xyTest(:,1);
%training the model
model = svmtrain(YTrain,XTrain, '-c 1 -g 0.07');
%testing
[predict_label, accuracy, dec_values] = svmpredict(YTest, XTest, model);

%..............................clear
clear XTrain YTrain XTest YTest;