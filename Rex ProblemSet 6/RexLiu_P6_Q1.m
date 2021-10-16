%Rex Liu PSet Q1
X = com_matrix('communities.data');
theta = [1; 2];
iterations = 10; 
alpha = 0.0001; %learning rate
[J,G] = lin(X, theta); % cost function
disp(J);
%determine the descent of cost J
x_val = zeros(1, iterations);
y_val = zeros(1, iterations);

for a = 1:iterations
    x_val(1, a) = a;
end

for c = 1:iterations
d_theta = G*alpha;
theta = theta-d_theta;
[J,G] = lin(X, theta);
y_val(1, c) = J;
end

scatter(x_val, y_val);

x_raw = X(:, 1);
y = X(:, 2);
x_mean = mean(xraw);
x_shifted = x_raw-x_mean;
x_norm = x_shifted/std(x_shifted);

%plot new thetas against normalized x
scatter(x_norm, y);
xlabel('normalized x values')
ylabel('y values')
hold on;
plot(x_norm, theta(1,1)+theta(2,1)*x_norm);

figure;
plot(x_val, y_val);
xlabel('Iterations')
ylabel('Cost')
