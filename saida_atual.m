function [ saidaAtual ] = saida_atual( W, dados, abertura, centros )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    m = size(dados,1); 
    n = size(centros,1); 
    for i=1:m
        x = dados(i,:);
        for j=1:n
            X_h(i,j) = funcGauss(x, centros(j,:), abertura);
        end
        h = [1 X_h(i,:)];
        output(i) = h*W;
    end
    saidaAtual = output';
end

