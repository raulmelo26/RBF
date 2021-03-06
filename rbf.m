clc; clear;

% fprintf('+------------------------------------------------------------------------+\n');
% fprintf('|                              PERCEPTRON SIMPLES                        |\n');
% fprintf('|                     Acad�mico: Raul Gabriel Carvalho de Melo           |\n');
% fprintf('|                                IFCE - Maracana�                        |\n');
% fprintf('+------------------------------------------------------------------------+\n');


dados = load('C:\Users\Raul Melo\Documents\RBF - kfolds\dataIris.dat');
% dados = load('C:\Users\Raul Melo\Documents\RBF - kfolds\coluna_vertebral.dat');
% dados = load('C:\Users\Raul Melo\Documents\RBF - kfolds\dermatologia.dat');

% x = load('X.dat');
% y = load('Y.dat');
% 
% dados = [x y];

numRealizacoes = 2;
esc = 1;
abertura = 0.3;
numAtributos = 4;                   % Iris 4, coluna 6, derm 34, 2
numNeuroniosOcultos = 10;
numNeuronioSaida = 3;                % Iris 3, coluna 3, derm 6, 1
offset = 0.5;
numPadroes = size(dados,1);

numAberturaInicial = 0.1;
numAberturaFinal = 1;
incAbertura = 0.1;
deltaAbertura = numAberturaInicial:incAbertura:numAberturaFinal;

dados = [normaliza(dados(:,1:numAtributos)) dados(:,numAtributos+1:numAtributos+numNeuronioSaida)];

for i = 1:numRealizacoes
    dados = dados(randperm(numPadroes),:);
    
    [X_treino, Y_treino, X_teste, Y_teste] = separaDados(dados, numAtributos, numNeuronioSaida, 0.8);
    dadosTreino = [X_treino Y_treino];
    
    a = 1;
    b = size(X_treino,1);
    c = floor(0.2*size(X_treino,1));
    r = a + (b-a).*rand(b,1);
    r = floor(r(1:c,:));
    centros = X_treino(r, :);
    
    [abertura, grade] = melhoresParametros(deltaAbertura, dadosTreino, numAtributos, numNeuronioSaida, centros, esc);
    
    [W] = treino(X_treino, Y_treino, abertura, centros);

    acc(i) = teste(W, X_teste, Y_teste, abertura, centros, esc);
    clc;
end

grade
media_acc = mean(acc)
desvio_padrao = std(acc)




