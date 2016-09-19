%@initData
%output:xyTrain,xyTest,trainNum
%K--K percent for testing(K/100)
K = 20;

%presetGenoInfo--mat(1000,300)
xData = presetGenoInfo;
yData = load('phenotype.txt');
for i=1:1:1000
	if yData(i, 1) == 0
		yData(i, 1) = -1;
	end
end
xyData = [yData,xData];
trainNum = (1.0 - K*1.0/100) * 1000;
testNum  = 1000 - trainNum;
randIndexTr = randperm(1000);

[m,n] = size(xyData);
xyTrain = zeros(trainNum, n);
xyTest  = zeros(testNum, n);
% xTest = xyData;

for i=1:1:trainNum
     xyTrain(i, 1:1:n) = xyData(randIndexTr(1,i), 1:1:n);
end

for i=1:1:testNum
     xyTest(i, 1:1:n) = xyData(randIndexTr(1,trainNum + i), 1:1:n);
end
%..............................clear
% clear i j m n xData yData xyData testNum randIndexTr;