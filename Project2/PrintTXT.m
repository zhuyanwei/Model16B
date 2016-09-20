


fid = fopen('sorted_W.txt','w');
for j=1:1:9445
    for i=1:1:2
        if sortedSq_W(j, 2) > 0
            fprintf(fid, '%g\t%g\n',sortedSq_W(j, 1), sortedSq_W(j,2));
        end
    end
end
fclose(fid);