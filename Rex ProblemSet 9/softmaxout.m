function [y,yp] = softmaxout(z)
    y = exp(z)/sum(exp(z));
    yp = y.*(sum(exp(z))-exp(z))/sum(exp(z));
end