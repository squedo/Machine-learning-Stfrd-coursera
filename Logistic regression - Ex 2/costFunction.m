function [J,grad] = costFunction(X,y,theta)

[n,~] = size(X);

h = sigmoid(X,theta);
h1 = log(h); h1 = h1';
h0 = log(1-h); h0 = h0';
a = y.*h1+(1-y).*h0;

J = -(1/n)*sum(a);

grad = X'*(h'-y)/n;

end