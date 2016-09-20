% 
% output: SNPsOrderW( 9445, 1)    
% output: SqSNPsOrderW( 9445, 1)   NOTE: need save for Pro3
% output: sortedSq_W(9445, 2)
% transfor the weighted parameter w(presetNum, 1) with sortedSNPsSum order to the rs order
% note: except the constant term w(0, 1)

SNPsOrderW = zeros(9445, 1);

sortedIdx = sortedSNPsSum(1, 1:1:9445);
[m,n] = size(w);
tmpW = zeros(1, 9445);
for i=1:1:9445
    if i < m
        tmpW(1, i) = w(i+1, 1);
    else
        tmpW(1, i) = 0;
    end
end

for i=1:1:9445
    SNPsOrderW(sortedIdx(1, i), 1) = tmpW(1, i);
end
% calculate the square of SNPsOrderW
SqSNPsOrderW = zeros(9445, 1);
for i=1:1:9445
    SqSNPsOrderW( i, 1) = SNPsOrderW(i, 1) * SNPsOrderW(i, 1);
end

% sortedSq_W is the last result of Pro2
% the first coloumn is the concerned index of SNPs
% the second coloumn is the correlation weight square of the SNPs
sortedSq_W = zeros(9445, 2);
[sortedSq_W(1:1:9445, 2), sortedSq_W(1:1:9445, 1)] = sort(SqSNPsOrderW(1:1:9445, 1), 'descend');

hist( sortedSq_W(1:1:presetNum, 2)', 10);
% clear tmp var
clear i tmpW m n sortedIdx;
