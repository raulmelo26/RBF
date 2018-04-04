% Raul Melo
% Função para normalizar os dados entre 0 e 1.

function [dados_normalizados] = normaliza(data)
  maior = max(max(data));
  menor = min(min(data));
  
  for i = 1 : size(data,1)
    for j = 1 : size(data,2)
      dados_normalizados(i,j) = (data(i,j) - menor)/(maior - menor);
    end
  end
end