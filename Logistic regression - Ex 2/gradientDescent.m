function [theta,J_history] = gradientDescent(X,y,theta,alpha,num_iters)

%%% NOTE: before applying gradientDescent data have to be scaled using
%%% @normalize function to get convergence and adequates theta values

%%% NOTE: the use of gradient descent implies varying alpha value and
%%% iterations until finding the good theta parameters

[n,m] = size(X);

for iter = 1:num_iters
   
    h = sigmoid(X,theta);
    b = (h-y')*X;

    for j = 1:m
    theta(j) = theta(j) - (alpha/n)*b(j);
    end
    
    J_history(iter) = costFunction(X,y,theta);
   
end

end