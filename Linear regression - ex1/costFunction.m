function J = costFunction(X,y,theta)

h = theta*X';
n = length(h);
a = (h-y').^2;
s = sum(a);
J = (1/(2*n))*sum(s);

% =========================================================================

end