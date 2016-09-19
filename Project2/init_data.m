%
%output: xTrain and xTest data for our cluster
%total 1000 samples,use k(k=0~100)percet for testing and (100-k) for training
K = 20;

xData = presetGenotype;
yData = load('phenotype.txt');
xyData = [yData,xData];
trainNum = (1.0 - K*1.0/100) * 1000;
testNum  = 1000 - trainNum;
% randIndexTr = randperm(1000);    
randIdexTr0 = randperm(500);
randIdexTr1 = randperm(500) + ones(1, 500) * 500;

[m,n] = size(xyData);
xTrain = zeros(trainNum, n);
xTest  = zeros(testNum, n);
% xTest = xyData;

for i=1:1:trainNum
    if i < trainNum/2 + 1
        xTrain(i, 1:1:n) = xyData(randIdexTr0(1,i), 1:1:n);
    else
        xTrain(i, 1:1:n) = xyData(randIdexTr1(1,i - trainNum/2), 1:1:n);
    end
end

for i=1:1:testNum
%      xTest(i, 1:1:n) = xyData(randIndexTr(1,trainNum + i), 1:1:n);
    if i < testNum/2 + 1
        xTest(i, 1:1:n) = xyData(randIdexTr0(1, trainNum/2 + i), 1:1:n);
    else
        xTest(i, 1:1:n) = xyData(randIdexTr1(1, trainNum/2 + i - testNum/2 ), 1:1:n);
    end
end

clear i j m n xData yData xyData;