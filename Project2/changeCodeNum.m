
orig  = genotype;
trans = zeros(1000, 9445);
err = ones( 1000, 9445) * -1;
diffNum = zeros(1, 9445);

for i=1:1:9445
    for j=1:1:1000
        if orig(j,i) ~=0 && orig(j,i) ~=5 && orig(j, i) ~=10 && orig(j,i)~=15
            diffNum(1, i) = orig(j, i);
        end
    end
end

for i=1:1:9445
    for j=1:1:1000
        if diffNum(1, i)==1     % AT
            switch(orig(j, i))
                case 0               % AA
                    trans(j, i) = 1;
                case 5               % TT
                    trans(j, i) = 2;
                case 1               % AT TA
                    trans(j, i) = 3;
                otherwise
                    err(j,i)=orig(j,i);
            end
        elseif diffNum(1, i)==2  % AC
            switch(orig(j, i))
                case 0                % AA
                    trans(j, i) = 1;
                case 10               % CC
                    trans(j, i) = 2;
                case 2                % AC CA
                    trans(j, i) = 3;
                otherwise
                    err(j,i)=orig(j,i);
            end
        elseif diffNum(1, i)==3  % AG
            switch(orig(j, i))
                case 0               % AA
                    trans(j, i) = 1;
                case 15              % GG
                    trans(j, i) = 2;
                case 3               % AG GA
                    trans(j, i) = 3;
                otherwise
                    err(j,i)=orig(j,i);
            end
        elseif diffNum(1, i)==6  % TC
            switch(orig(j, i))
                case 5               % TT
                    trans(j, i) = 1;
                case 10              % CC
                    trans(j, i) = 2;
                case 6               % TC CT
                    trans(j, i) = 3;
                otherwise
                    err(j,i)=orig(j,i);
            end
        elseif diffNum(1, i)==7  % TG
            switch(orig(j, i))
                case 5               % TT
                    trans(j, i) = 1;
                case 15              % GG
                    trans(j, i) = 2;
                case 7               % TG GT
                    trans(j, i) = 3;
                otherwise
                    err(j,i)=orig(j,i);
            end
        else diffNum(1, i)==11  % CG
            switch(orig(j, i))
                case 10               % CC
                    trans(j, i) = 1;
                case 15               % GG
                    trans(j, i) = 2;
                case 11               % CG GC
                    trans(j, i) = 3;
                otherwise
                    err(j,i)=orig(j,i);
            end
        end
    end
end

sumErr = zeros(1,9445);
for i=1:1:9445
    sumErr(1,i) = sum(err(1:1:1000, i));
    if sumErr(1, i) ~= -1000
        disp('at place ');
        disp(i);
        disp('error');
    end
end