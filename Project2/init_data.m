%total 1000 samples,use k(k=0~100)percet for testing and (100-k) for training
K = 20;

xData = presetGenotype;
yData = load('phenotype.txt');
xyData = [yData,xData];
trainNum = (1.0 - K*1.0/100) * 1000;
testNum  = 1000 - trainNum;
randIndexTr = randperm(1000);

[m,n] = size(xyData);
xTrain = zeros(trainNum, n);
xTest  = zeros(testNum, n);
% xTest = xyData;

for i=1:1:trainNum
     xTrain(i, 1:1:n) = xyData(randIndexTr(1,i), 1:1:n);
end

for i=1:1:testNum
     xTest(i, 1:1:n) = xyData(randIndexTr(1,trainNum + i), 1:1:n);
end
clear i j m n xData yData xyData;