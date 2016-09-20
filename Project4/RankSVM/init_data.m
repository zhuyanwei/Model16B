%
% output: train_data, train_multiPh, test_data, test_multiPh
%

load multi_phenos.txt
multiPh = multi_phenos';
% set K% for test, remaining (1 - K%) for train
K = 30;
trainNum = (1 - K*1.0/100) * 1000;
testNum = 1000 - trainNum;
% randIndexTr = randperm(1000);    
randIdexTr0 = randperm(500);
randIdexTr1 = randperm(500) + ones(1, 500) * 500;

[m,n] = size(presetGenotype);
% [m, n] = size(trans);
[x,y] = size(multiPh);
mulltiPhTrans = zeros(x, y);
for i=1:1:y
    for j=1:1:x
        if multiPh(j, i) == 0
            mulltiPhTrans(j, i)  = -1;
        else
            mulltiPhTrans(j, i)  = multiPh(j, i) ;
        end
    end
end
train_data = zeros(trainNum, n);
train_multiPh = zeros(x, trainNum);
test_data  = zeros(testNum, n);
test_multiPh = zeros(x, testNum);

for i=1:1:trainNum
    if i < trainNum/2 + 1
        train_data(i, 1:1:n) = presetGenotype(randIdexTr0(1,i), 1:1:n);
%         train_data(i, 1:1:n) = trans(randIdexTr0(1,i), 1:1:n);
        train_multiPh(1:1:x, i) = mulltiPhTrans(1:1:x, randIdexTr0(1,i));
    else
        train_data(i, 1:1:n) = presetGenotype(randIdexTr1(1,i - trainNum/2), 1:1:n);
%         train_data(i, 1:1:n) = trans(randIdexTr1(1,i - trainNum/2), 1:1:n);
        train_multiPh(1:1:x, i) = mulltiPhTrans(1:1:x, randIdexTr1(1,i - trainNum/2));
    end
end

for i=1:1:testNum
    if i < testNum/2 + 1
        test_data(i, 1:1:n) = presetGenotype(randIdexTr0(1, trainNum/2 + i), 1:1:n);
%         test_data(i, 1:1:n) = trans(randIdexTr0(1, trainNum/2 + i), 1:1:n);
        test_multiPh(1:1:x, i) = mulltiPhTrans(1:1:x, randIdexTr0(1, trainNum/2 + i));
    else
        test_data(i, 1:1:n) = presetGenotype(randIdexTr1(1, trainNum/2 + i - testNum/2 ), 1:1:n);
%         test_data(i, 1:1:n) = trans(randIdexTr1(1, trainNum/2 + i - testNum/2 ), 1:1:n);
        test_multiPh(1:1:x, i) = mulltiPhTrans(1:1:x, randIdexTr1(1, trainNum/2 + i - testNum/2 ));
    end
end

clear m n x y i j;
clear K trainNum testNum randIdexTr0 randIdexTr1;