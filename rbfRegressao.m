clc; clear;

% fprintf('+------------------------------------------------------------------------+\n');
% fprintf('|                              PERCEPTRON SIMPLES                        |\n');
% fprintf('|                     Acadêmico: Raul Gabriel Carvalho de Melo           |\n');
% fprintf('|                                IFCE - Maracanaú                        |\n');
% fprintf('+------------------------------------------------------------------------+\n');

% VARIAVEIS INICIAIS
numRealizacoes = 2;
esc = 2;
abertura = 0.3;
numAtributos = 1;                   % Iris 4, coluna 6, derm 34, 2
numNeuroniosOcultos = 10;
numNeuronioSaida = 1;                % Iris 3, coluna 3, derm 6, 1
offset = 0.5;

numAberturaInicial = 0.1;
numAberturaFinal = 1;
incAbertura = 0.1;
deltaAbertura = numAberturaInicial:incAbertura:numAberturaFinal;

% GERA DADOS 2D

x = linspace(0,10,200);
y = sin(x) + rand(size(x))-offset;
    
dados = [x' y' sin(x)'];
dados = [normaliza(dados)];
    
    
figure(1);
scatter(dados(:,1), dados(:,3),'.b');
hold on;
scatter(dados(:,1), (dados(:,2)), '.r');
hold on;
dados = dados(:,1:2);

numPadroes = size(dados,1);

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
    
    MSE(i) = teste(W,X_teste,Y_teste,abertura,centros,esc);
    
    y_atual = saida_atual(W,dados(:,1), abertura, centros);
    scatter(dados(:,1), y_atual, '.black')
    title('Regressão RBF');
    legend('f(x)','ruido','g(x)')
    clc;
end

grade
MSE_medio = mean(MSE)
RMSE = sqrt(MSE)
% dados = [normaliza(dados(:,1:numAtributos)) dados(:,numAtributos+1:numAtributos+numNeuronioSaida)]






