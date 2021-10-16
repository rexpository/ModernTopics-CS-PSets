%Rex Liu PSet Q2
X = com_matrix('communities.data');
theta = [1; 2];
power = 10;
iterations = 10; 
alpha = 0.0001; %learning rate
for p = 1:power
disp('The power is: ');
disp(p);
new_X = X.^power;
    
[J,G] = lin(new_X, theta);

disp('The cost is: ')

for c = 1:iterations
d_theta = G*alpha;
theta = theta-d_theta;
[J,G] = lin(new_X, theta);
disp(J);
end

end

disp('There is no reason to increase my degree fit after a degree of 3');

