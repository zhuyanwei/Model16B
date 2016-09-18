%main script
% clear all; close all; clc;
% 
% load('XTrainWBC.mat');
% load('yTrainWBC.mat');
% load('XTestWBC.mat');
% load('yTestWBC.mat');
%....................................
% first run getHist %
% second run init_data
% third main
%....................................
%get the training(testing) data and training result
XTrain = xTrain(:,2:1:end);
YTrain = xTrain(:,1);
XTest = xTest(:,2:1:end);
YTest = xTest(:,1);

[nsamples, nfeatures] = size(XTrain);
w0 = rand(nfeatures + 1, 1);
w = logisticW( XTrain, YTrain, w0, 500, 0.01);
%output w
disp(w);
res = logisticClassify( XTest, w );

errors = abs(YTest - res);
err = sum(errors);
percentage = 1 - err / size(XTest, 1)