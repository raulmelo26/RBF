function [ Y ] = binariza( Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [x,y] = size(Y);
    % POSIÇÃO DO MAIOR ELEMENTO NO VETOR
    [~, i] = max(Y);
    % ZERA OS OUTROS VALORES
    Y = zeros(x, y);
    % COLOCA 1 NA POSIÇÃO DO MAIOR
    Y(i) = 1;

end

