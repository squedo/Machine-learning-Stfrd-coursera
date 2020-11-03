function h = sigmoid(X,theta)

z = theta*X';
h = 1./(1+exp(-z));

end