tic
clc; clear all; close all;

%%% Loading and normalizing data

data = load('ex1data2.txt');

alpha = input('What is the learning rate alpha you want to use (i.e. 0.01)?  ');
num_iters = input('What is the number of iterations you want to use (i.e. 1000)?  ');
surface = input('What is the surface in ft2 (i.e. 1500)?  ');
rooms = input('How many rooms (i.e. 3)?  ');

x = data(:,1:end-1);

[x_norm,mu,sigma] = feval('normalize',x);

n = length(x);
X = [ones(n,1),x_norm];
[~,m] = size(X);
y = data(:,end);

%%% Calculation of cost function for a given value of theta = parameters

theta = zeros(1,m);

J = feval('costFunction',X,y,theta);

%%% Gradient descent

[theta_descent,J_history] = feval('gradientDescent',X,y,theta,alpha,num_iters);

figure; plot(linspace(1,num_iters,num_iters),J_history,'-b');
xlabel('number of iterations'); ylabel('J');

%%% normal equation

theta_normalEq = feval('normalEquation',X,y);

%%% prediction for a concrete case

case1 = [1,surface,rooms];
case1 = [1,(case1(2)-mu(1))/sigma(1),(case1(3)-mu(2))/sigma(2)];

prediction_gradDescent = case1*theta_descent'; 
display(prediction_gradDescent) % Predicted price of the house in dollars using gradient descent

prediction_normalEquation = case1*theta_normalEq';
display(prediction_normalEquation) % Predicted price of the house in dollars using normal equation

toc
