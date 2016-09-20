

weight = coloumWeight;
[m, n] = size(weight);

[sortedW, sortedIdx] = sort(weight,'descend');

fid = fopen('GeneResult.txt','w');
for i=1:5:m
    fprintf(fid, '\ngene\t');
    for j=1:1:5
        fprintf(fid, 'gene_%g\t', sortedIdx(i+j-1,1));
    end
    fprintf(fid, '\nweights\t');
    for j=1:1:5
        fprintf(fid, '%g\t', sortedW(i+j-1,1));
    end
end