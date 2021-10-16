function [J, Jp] = cost(ypred, yact)
    m = size(ypred, 1);
    ydiff = ypred - yact;
    J = (ydiff'*ydiff)/(2*m);
    Jp = ydiff/m;
end

