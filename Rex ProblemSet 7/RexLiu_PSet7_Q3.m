%Rex Liu PSet Q3

% load the data file
M = importdata('EnergyEfficiency2012.txt','\t',1);

x1 = M.data(:,9);
x2 = M.data(:,10);
y  = M.data(:,5);
x1 = (x1-mean(x1))/std(x1); %X axis
x2 = (x2-mean(x2))/std(x2); %Y axis
y  = (y-min(y))/(max(y)-min(y));         

X     = [ones(length(y),1) x1 x2 x1.*x2 x1.*x1];  
Theta = fminunc(@(Theta) CostJ(Theta,X,y), zeros(size(X,2),1));

px = linspace(min(x1),max(x1),50)';
py = -(Theta(2)*px + Theta(1) + Theta(5)*px.*px)./(Theta(3)+Theta(4)*px);

figure;
i = find(y>0.5);                      
j = find(y<0.5);                      
plot(px,py,'r-',x1(i),x2(i),'bX',x1(j),x2(j),'k*','LineWidth',2);
xlabel('X1 Feature');
ylabel('X2 Feature');
title('Binary Logistic Regression with Quadratic Terms');
legend('Decision Boundary 50%','Location','Best');
grid;
axis tight;

function J = CostJ(theta,X,y)
    m = length(y);                   
    p = 1./(1+exp(-X*theta));         
    J = y'*log(p) + (1-y')*log(1-p);  
    J = -J/m;
end