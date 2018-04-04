function [h] = funcGauss(x, c, ro)
    u = sqrt(sum( (x-c).^2));
    h = exp((u)^2/(-2*ro^2));
end

