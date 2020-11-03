function [p,accuracy] = predict(theta,X,y)

threshold = 0.5;

h = sigmoid(X,theta);

for i = 1:length(h)
    if h(i) >= threshold
        p(i) = 1;
    else p(i) = 0;
    end
end

accuracy = mean(double(p' == y))*100;

end
