function [ W ] = treino( X, Y, ro, C )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    m = size(X,1); %qtd padroes treino
    n = size(C,1); %qtd centroides

    for i=1:m
        x = X(i,:);
        for j=1:n
            X_h(i,j) = funcGauss(x, C(j,:), ro);
        end
    end
        
    X_h = [ones(m, 1), X_h];
    
    % Aprender os pesos      
    W = X_h\Y; %OLAM


end

