
function matriz_mfcc = genera_matriz(name,periodo,num_archivos)

%Cada archivo es un compás de 4/4 a un tempo de 80
        cont_vec=1;

    for e=1:1:num_archivos
       %direccion='C:\Users\Jr\Documents\MATLAB\Programas PITCH Diciembre 2016\Naotoshi Seo\';
        direccion='D:\0. MATLAB (Programas)\0ExamenIAPDS1\VQ con MFCCs\';
        nombre = sprintf('%s_%d.wav',name,e);
        file = sprintf('%s%s',direccion,nombre);
%         [s fs] = wavread(file);
%         s = s';


[z fs] = audioread(file);
        
        for i=1:length(z)
            s(i)=z(i,1);
        end
        
        Fo = tono_fundamental_2 (fs, s, 1000,60);

        orden=12; %%%% ANALIZAR EL NUM DE COEFICIENTES MFCC
        
        matriz_s = melcepst(s,fs);

    for i=1:1:length(matriz_s)

        matriz_s(i,orden+1) = Fo;
        
    end
 
    
    j = 1;
 
    for i=cont_vec:1:cont_vec + length(matriz_s) - 1
        
        matriz_mfcc(i,:) = matriz_s(j,:);
        j=j+1;
        
    end
    
    cont_vec = length(matriz_mfcc)+1;
    
    end

    matriz_mfcc = matriz_mfcc';
    
    return