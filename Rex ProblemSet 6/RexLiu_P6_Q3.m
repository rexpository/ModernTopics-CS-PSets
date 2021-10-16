%Rex Liu PSet Q3
X = com_matrix('communities.data');
theta = [2;1];
alpha = 0.0001; %learning rate
[J,G] = lin(X, theta);

d_theta = 0.02;
x_val = zeros(1, 16);
y_val = zeros(1, 16);
iterations = 1;
c = 1; %index of vector

while abs(d_theta) > 0.01
    
d_theta = G*alpha;
theta = theta-d_theta;
[J,G] = lin(X, theta);

y_val(1, c) = J;
x_val(1, c) = sqrt(sum(d_theta.*d_theta));
c = c+1;
end

y = X(:, 2);
x_raw = X(:, 1);
x_mean = mean(x_raw);
x_shifted = x_raw-x_mean;
X_norm = x_shifted/std(x_shifted);
%plot new thetas against normalized x
plot(x_val, y_val);
xlabel('Gradient')
ylabel('Cost')
