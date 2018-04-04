function [acc] = teste(W, X, D, ro, C)

    m = size(X,1); %qtd padroes treino
    n = size(C,1); %qtd centroides
    cont = 0;
    
    for i=1:m
        x = X(i,:);
        for j=1:n
            y(i,j) = funcGauss(x, C(j,:), ro);
        end
        
        h = [1 y(i,:)];
        y = h*W;
        y = binariza(y);

        if isequal(y, D(i,:))
           cont = cont + 1; 
        end
    
    end

acc = 100*(cont/m);

end