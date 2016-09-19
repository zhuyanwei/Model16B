%output1: the hist map of all 9445 sumDist
%output2: presetGenotype(1000, presetNum)
close all;
clear all;
clc;
%define the threshold and get the pre-set number of SNPs
%and get 1000 x presetNum data
THRESHOLD = 2000;
presetNum = 0;
%define the hist group number
histGroups = 2000;

% load the coded numerical SNPs
% first, need load this file to generate genotype.mat 
% then run changeCodeNum.m to generate trans.mat and save it. 
% load genotype.txt;  

% we had generate the trans data ,and substitute the orig genotype.dat
load trans.mat
genotype = trans;

notID = zeros(15, 9445);
isID = zeros(15,9445);

for i=1:1:9445
    [N,X] = hist( genotype([1:1:500], i), 15);
    notID(:, i) = N;
    [M,Y] = hist( genotype([501:1:1000], i), 15);
    isID(:, i) = M;
end

dist = zeros(15, 9445);
for i=1:1:9445
    for j=1:1:15
        dist(j, i) = (notID(j, i) - isID(j, i))*(notID(j, i) - isID(j, i));
    end
end

sumDist = zeros(1,9445);
for i=1:1:9445
    sumDist(1,i) = sum(dist(:,i));
    if sumDist(1, i) > THRESHOLD
        presetNum = presetNum + 1;
    end
end

% plot hist 
% hist(sumDist, histGroups);

SNPsSum = zeros(2, 9445);
for i=1:1:9445
    SNPsSum(1,i) = i;
    SNPsSum(2,i) = sumDist(1, i); 
end

sortedSNPsSum = zeros(2, 9445);
[sortedSNPsSum(2,1:1:9445), sortedSNPsSum(1,1:1:9445)] = sort(sumDist(1,1:1:9445), 'descend');

presetSums = sortedSNPsSum(1:1:2, 1:1:presetNum);
presetGenotype = zeros(1000, presetNum);

for i=1:1:presetNum
    j=sortedSNPsSum(1,i);
    presetGenotype(1:1:1000, i) = genotype(1:1:1000, j);
end

%......................clean workspace
clear M N X Y i j SNPsSum dist  histGroups isID notID;