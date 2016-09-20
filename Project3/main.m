%@main.m
%............................main script

%get the training(testing) data and training(testing) result
XTrain = xyTrain(:,2:1:end);
YTrain = xyTrain(:,1);
XTest = xyTest(:,2:1:end);
YTest = xyTest(:,1);
%training the model
model = svmtrain(YTrain,XTrain, '-s 0 -t 1  -g 0.0033');
%testing
[predict_label, accuracy, dec_values] = svmpredict(YTest, XTest, model);
%compute mySVMw:mat(300,1)
mySVMw = model.SVs' * model.sv_coef;
%compute the max of each coloum in presetGenoInfo==>>coloumWeight:mat(300,1)
coloumWeight = zeros(300,1);
for i = 1:1:300
  coloumWeight(i,1) = max(presetGenoInfo(:,i));
end
%compute w' * x:mat(300,1)
myWX = mySVMw .* coloumWeight;
%compute square of each WX==>>myWX2:mat(300,1)
myWX2 = myWX .* myWX;
%do the sort
sortMyWX2 = sort(myWX2(1:1:300, 1), 'descend');

%..............................clear
clear XTrain YTrain XTest YTest i ;