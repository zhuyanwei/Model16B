%main script
% clear all; close all; clc;
% 
% load('XTrainWBC.mat');
% load('yTrainWBC.mat');
% load('XTestWBC.mat');
% load('yTestWBC.mat');

%total 1000 samples,use k(k=0~100)percet for testing and (100-k) for training
K = 10;

xData = presetGenotype;
yData = load('phenotype.txt');
xyData = [yData,xData];
n = (100 - K) * 1000;

XTrain = presetGenotype;
yTrain = load('phenotype.txt');

[nsamples, nfeatures] = size(XTrain)
w0 = rand(nfeatures + 1, 1);
weight = logisticW( XTrain, yTrain, w0, 2000, 0.1);
res = logisticRegressionClassify( XTest, weight );

errors = abs(yTest - res);
err = sum(errors)
percentage = 1 - err / size(XTest, 1)