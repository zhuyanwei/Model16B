function PlotFunc( xstart,xend )  
%PLOTFUNC Summary of this function goes here  
%   draw original data and the fitted   
  
%===================cost function 3=====logistic regression  
  
%original data  
x=[-3;      -2;     -1;     0;      1;      2;     3];  
y=[0.01;    0.05;   0.3;    0.45;   0.8;    1.1;    0.99];  
plot(x,y,'rx','MarkerSize',10);  
hold on  
  
%fitted line  
x_co=xstart:0.1:xend;  
theta = [0.3526,1.7573];  
y_co=h_func(x_co,theta);  
plot(x_co,y_co);  
hold off  
  
end  