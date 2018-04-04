% Raul Melo
% Separa os dados de treinamento e teste
% 
function [X_treino, Y_treino, X_teste, Y_teste] = separaDados(dados, qtdAtributos, qtdRotulos, perc)
i=1;  
ultima_linha_treino = round(perc*size(dados,1));
  while(mod(ultima_linha_treino,5)~= 0)
%       i = i+1;
      ultima_linha_treino = ultima_linha_treino - i;
  end   
  dados_treino = dados(1:ultima_linha_treino,:);
  dados_teste = dados(ultima_linha_treino + 1:end,:);
  
  X_treino = dados_treino(:,1:qtdAtributos);
  Y_treino = dados_treino(:,qtdAtributos+1:qtdAtributos+qtdRotulos);
  X_teste  = dados_teste(:,1:qtdAtributos);
  Y_teste  = dados_teste(:,qtdAtributos+1:qtdAtributos+qtdRotulos);
  
end
  