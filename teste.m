function [acc_mse] = teste(W, X, D, ro, C, esc)

    m = size(X,1); 
    n = size(C,1); 
    cont = 0;
    
    for i=1:m
        x = X(i,:);
        for j=1:n
            y(i,j) = funcGauss(x, C(j,:), ro);
        end
        
        h = [1 y(i,:)];
        y = h*W;
        
        if (esc == 1)
            y = binariza(y);
            if isequal(y, D(i,:))
                cont = cont + 1; 
            end
        else
           SE(i) = (y - D(i))^2; 
        end
    
    end

    if (esc == 1)
        acc_mse = 100*(cont/m);
    else
        acc_mse = mean(SE);

end