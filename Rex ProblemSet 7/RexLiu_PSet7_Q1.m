%Rex Liu PSet Q1

% load data file
M = importdata('EnergyEfficiency2012.txt','\t',1);

x = M.data(:,9);    
y = M.data(:,5);
x  = (x-mean(x))/std(x);
y  = (y-min(y))/(max(y)-min(y));      
px = linspace(min(x),max(x),100)';    

py = [];

for Np = [1,2]                        
    X     = AugX(x,Np);               
    Theta = fminunc(@(Theta) CostJ(Theta,X,y), zeros(Np+1,1));
    py = [py 1./(1+exp(-AugX(px,Np)*Theta))];
end

figure;
plot(x,y,'bo',px,py,'-','LineWidth',2);
xlabel('Inputs');
ylabel('Probability');
legend('Data','Linear Model','Quadratic Model','Location','Best');
grid;
axis tight;

function J = CostJ(theta,X,y)
    m = length(y);                    
    p = 1./(1+exp(-X*theta));         
    J = y'*log(p) + (1-y')*log(1-p);  
    J = -J/m;
end

function X = AugX(x,Np)
    X = [ones(length(x),1) x(:)];
    if Np>1
        for i = 1:Np-1
           X = [X X(:,end).*x(:)];
        end
    end
end