function [reluans, reluderiv] = relu(z)
    m = size(z,1);
    reluans = zeros(m,1);
    reluans(z>0) = z(z>0);
    reluderiv = double(z>0);
end
