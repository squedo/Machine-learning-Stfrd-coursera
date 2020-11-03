function [x_norm,mu,sigma] = normalize(x)

[n,m] = size(x);
for i = 1:m
    mu(i) = mean(x(:,i));
    sigma(i) = std(x(:,i));
end

for i = 1:n
    for j = 1:m
        x_norm(i,j) = (x(i,j)- mu(j))/sigma(j);
    end
end

end