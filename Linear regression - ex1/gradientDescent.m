function [theta,J_history] = gradientDescentReg(X,y,theta,alpha,num_iters)

[n,m] = size(X);

for iter = 1:num_iters
     
    h = theta*X';
    b = (h-y')*X;
    
    for j = 1:m
    theta(j) = theta(j) - (alpha/n)*b(j);
    end
    
    J_history(iter) = feval('costFunctionReg',X,y,theta);

end

end