function [J,gradient] = lin(X, theta)
m = size(X, 1);
y = X(:, 2);
%minimize X
x_raw = X(:, 1);
x_mean = mean(x_raw);
x_shifted = x_raw-x_mean;
X_norm = x_shifted/std(x_shifted);
X_aug = [ones(m, 1) X_norm];

y_Predicted = X_aug*theta;
deltaY = y_Predicted - y;
J = (1/(2*m))*deltaY'*deltaY;
gradient = X_aug'*deltaY;

end