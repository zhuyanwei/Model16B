%
% output: transMat3(9445, 300) 
% calculate the transformMatric for problem 3
%
transMat3 = zeros(9445, 300);
load SNPsNum.txt;  
load SqSNPsOrderW.mat;
gene_info = zeros(9445, 300);

start = 1;
for i=1:1:300
    next = start + SNPsNum(i, 1) - 1;
    for j=start:1:next
         gene_info(j, i) = 1;
    end
    start = next+1;
end

for i=1:1:300
    transMat3(1:1:9445, i) = SqSNPsOrderW .* gene_info(1:1:9445, i);
end
total_nonzero = 0;
for i=1:1:300
    for j=1:1:9445
        if transMat3(j, i) ~= 0
            total_nonzero = total_nonzero + 1;
        end
    end
end
disp(total_nonzero);

clear i j start next;