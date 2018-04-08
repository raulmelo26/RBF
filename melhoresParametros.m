function [numAbertura, grade] = melhoresParametros(deltaAbertura, dadosTreino,numNeuroniosEntrada,numNeuroniosSaida,C,esc)
    [k1 k2 k3 k4 k5] = divide_dados_treino(dadosTreino);
    acuracia = 0 ;
    media_acc_mse = 0;
    numAbertura = 0;
    grade = 0;
    for i=1 : size(deltaAbertura,2)
        taxa_acumulada=0;
        for parte=1:5
            
            if parte == 1
                kValidacao = k1;
                dadosTreino = [k2;k3;k4;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                [W] = treino(atributosTreino, rotulosTreino, deltaAbertura(i),C);
                
                if(esc == 1)
                    acc(parte) = teste(W, atributosValidacao, rotulosValidacao, deltaAbertura(i), C, esc);
                else
                    acc(parte) = teste(W,atributosValidacao,rotulosValidacao,deltaAbertura(i),C,esc);
                end
               
            end
            if parte == 2
                kValidacao = k2;
                dadosTreino = [k1;k3;k4;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                [W] = treino(atributosTreino, rotulosTreino, deltaAbertura(i),C);
                
                if(esc == 1)
                    acc(parte) = teste(W, atributosValidacao, rotulosValidacao, deltaAbertura(i), C, esc);
                else
                    acc(parte) = teste(W,atributosValidacao,rotulosValidacao,deltaAbertura(i),C,esc);
                end
                
            end
            if parte == 3
                kValidacao = k3;
                dadosTreino = [k1;k2;k4;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                [W] = treino(atributosTreino, rotulosTreino, deltaAbertura(i),C);
                
                if(esc == 1)
                    acc(parte) = teste(W, atributosValidacao, rotulosValidacao, deltaAbertura(i), C, esc);
                else
                    acc(parte) = teste(W,atributosValidacao,rotulosValidacao,deltaAbertura(i),C,esc);
                end
                
            end
            if parte == 4
                kValidacao = k4;
                dadosTreino = [k1;k2;k3;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                [W] = treino(atributosTreino, rotulosTreino, deltaAbertura(i),C);
                
                if(esc == 1)
                    acc(parte) = teste(W, atributosValidacao, rotulosValidacao, deltaAbertura(i), C, esc);
                else
                     acc(parte) = teste(W,atributosValidacao,rotulosValidacao,deltaAbertura(i),C,esc);
                end
               
                
            end
            if parte == 5
                kValidacao = k5;
                dadosTreino = [k1;k2;k3;k4];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
               [W] = treino(atributosTreino, rotulosTreino, deltaAbertura(i),C);
                
                if(esc == 1)
                    acc(parte) = teste(W, atributosValidacao, rotulosValidacao, deltaAbertura(i), C, esc);
                else
                    acc(parte) = teste(W,atributosValidacao,rotulosValidacao,deltaAbertura(i),C,esc);
                end
                
            end
        end
        media_acc_mse(i) = sum(acc)/5;
        deltaAbertura(i);
    end
    if(esc == 1)
          [~,k] = max(media_acc_mse);
          grade = [deltaAbertura' media_acc_mse'];
          numAbertura = grade(k,1);
    else
          [~,k] = min(media_acc_mse);
          grade = [deltaAbertura' media_acc_mse']
          numAbertura = grade(k,1);
    end
    
end



