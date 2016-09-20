

predict = res;
real  = YTest;
TP =0;
TN =0;
FP =0;
FN =0;
for i=1:1:200
    if real(i, 1)==1 && predict(i, 1)==1
        TP = TP + 1;
    elseif real(i, 1)==0 && predict(i, 1)==0
        TN = TN + 1;
    elseif real(i, 1)==0 && predict(i, 1)==1
        FP = FP + 1;
    else real(i, 1)==1 && predict(i, 1)==0
        FN = FN + 1;
    end
end

Se = TP*1.0 /(TP + FN);
Sp = TN*1.0 /(TN + FP);