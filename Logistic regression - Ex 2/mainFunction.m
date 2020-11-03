clc; clear all; close all;

data = load('ex2data1.txt');

pos = data(data(:,end) == 1,:);
neg = data(data(:,end) == 0,:);

figure; plot(pos(:,1),pos(:,2),'b+',neg(:,1),neg(:,2),'r+');
xlabel('result exam 1'); ylabel('result exam 2');
legend('Pass','Fail');

[n,m] = size(data);

x = data(:,1:m-1);

[x_norm,mu,sigma] = normalize(x);

y = data(:,end);
X = [ones(n,1),x_norm];

theta = zeros(1,m);
%theta = [-24 0.2 0.2];

alpha = 0.5;
num_iters = 2000;

[J,grad] = feval('costFunction',X,y,theta);

[theta,J_history] = feval('gradientDescent',X,y,theta,alpha,num_iters);

[p,accuracy] = predict(theta,X,y);

figure; plot(linspace(1,num_iters,num_iters),J_history);
xlabel('number of iterations'); ylabel('costJ');

case1 = [1,(80-mu(1))/sigma(1),(80-mu(2))/sigma(2)]';
prob = 1/(1+exp(-theta*case1));


