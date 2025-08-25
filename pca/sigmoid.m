function y = sigmoid(x)

% Y = sigmoid(X)  Logistic or "sigmoid" function.

y = 1.0 ./ (1 + exp(-x));
