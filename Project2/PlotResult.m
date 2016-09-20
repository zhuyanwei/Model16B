

x = ones(1,100) * 1200;
for i=1:1:100
    x(1,i) = x(1,i) + i*100;
end

plot( x(1:1:50), 1 - Sp(1:1:50));
xlabel('ãÐÖµ');
ylabel('1-Sp');

hold on

plot( x(1:1:50), Se(1:1:50));
xlabel('ãÐÖµ');
ylabel('1-Sp');
