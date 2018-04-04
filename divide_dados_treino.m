function [ parte1 parte2 parte3 parte4 parte5 ] = divide_dados_treino( dados_treino )
    
    tamBloco = size(dados_treino)/5;
    parte1 = dados_treino(1:tamBloco,:);
    parte2 = dados_treino(tamBloco+1:tamBloco*2,:);
    parte3 = dados_treino(tamBloco*2+1:tamBloco*3,:);
    parte4 = dados_treino(tamBloco*3+1:tamBloco*4,:);
    parte5 = dados_treino(tamBloco*4+1:size(dados_treino,1),:);
end

