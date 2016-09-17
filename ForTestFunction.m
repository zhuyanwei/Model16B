%ForTestFunction
function [w,b,cost] = ForTestFunction(x,y,tol,max_iter)
fprintf('training started...\n');
n = size(x,1);
N = size(x,2);
w = ones(n,1)/n;
b = 1;
cost = [];
count = 1;
while 1
    %find gradient
    partial_w = zeros(n,1);
    partial_b = 0;
    for i=1:N
        a = exp(w'*x(:,i)+b);
        partial_w = partial_w + (1/(a+1)-y(i))*(-1)/((1+a)*(1+a))*a*x(:,i);
        partial_b = partial_b + (1/(a+1)-y(i))*(-1)/((1+a)*(1+a))*a;
    end

     %find step size
    old_cost = logistic_cost(x,y,w,b);
    step = 1;
    while step > 1e-12
        w1 = w - step*partial_w;
        b1 = b - step*partial_b;
        new_cost = logistic_cost(x,y,w1,b1);
        if new_cost < old_cost
            break;
        end
        step = step * 0.1;
       
    end
    
    if step <= 1e-12
            fprintf('finished seraching the step size\n');
            break;
    end
    
    w = w1;
    b = b1;
    
    cost = [cost,new_cost];  
    
    if new_cost < tol
        fprintf('converged after %d iterates!',count);
        break;
    end
    if  count > max_iter
       fprintf('training stoped after %d iterates, not converged to desired precision!',count);
        break;
    end
    count = count + 1;
               
end
