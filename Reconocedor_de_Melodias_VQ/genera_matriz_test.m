
function matriz_mfcc = genera_matriz_test(s,fs)

        cont_vec=1;
        Fo = tono_fundamental_2 (fs, s, 1000,60);

        orden=12; %%%% ANALIZAR EL NUM DE COEFICIENTES MFCC
        
        matriz_s = melcepst(s,fs);

    for i=1:1:length(matriz_s)
        matriz_s(i,orden+1) = Fo;
    end
 
    j = 1;

%     for i=cont_vec:1:cont_vec + length(matriz_s) - 1
% 
%         matriz_mfcc(i,:) = matriz_s(j,:);
%         
%         if j<orden
%         j=j+1;
%         end  
%     end
%     
%     cont_vec = length(matriz_mfcc)+1;

    matriz_mfcc = matriz_s';
    a = 1;
    
    return