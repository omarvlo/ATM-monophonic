close all;clc;

matriz_datos=0;
fs = 44100;
num_notas = 32;
num=0;

resultado={'string1','string2','string3','string4','string5','string6','string7','string8','string9','string10','string11','string12','string13'}; 
nota=0;

fileID = fopen('notas.txt','w');
 %             plot(s);
    %             hold on;

    periodo = round(fs*0.047);
    muestras_nota=tiempo_nota*fs;
    
name = input('Archivo a reconocer: ','s'); 


disp ('NOTAS RECONOCIDAS');
for i=1:1:num_notas

file = sprintf('%s_%d',name,i);
matriz_datos = genera_matriz(file,periodo,1);
nota = test(matriz_datos,libro_codigo);
fprintf(fileID,'%s ',nota);


end 

fclose(fileID);
% figure(2)
% plot(seg);

%v = mfcc(s, fs);

