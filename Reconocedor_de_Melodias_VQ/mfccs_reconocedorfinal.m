 

clc;cla;clear all;close all;

%name = input ('Enter the name that must be recognized -- >','s'); 

num_centroides_total=16;

matriz_datos=0;
fs = 44100;
octavas = 5;

num_archivos = 12;


periodo = round(fs*0.035);
   
cont = 1;


for i=2:1:octavas
    
                    
    name = sprintf('C%d',i);                   
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);    
    cont = cont + 1;   
    name = sprintf('C%d#',i);  
    matriz_datos = genera_matriz(name,periodo,num_archivos); 
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('D%d',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('D%d#',i);                  
    matriz_datos = genera_matriz(name,periodo,num_archivos); 
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('E%d',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('F%d',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('F%d#',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('G%d',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('G%d#',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('A%d',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('A%d#',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
    name = sprintf('B%d',i);
    matriz_datos = genera_matriz(name,periodo,num_archivos);
    libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total);
    cont = cont + 1;
end

%     name = sprintf('C6');                   
%     matriz_datos = genera_matriz(name,periodo,num_archivos);
%     libro_codigo{cont} = vqlbg(matriz_datos,num_centroides_total); 



     save('libro_codigo_notas_03may', 'libro_codigo')
     
     size(libro_codigo)
     
     a = 0;
     a = 1;
    % h5create('myfile.h5','/DS1',[10 20])
     
    % h5write('myfile.h5', '/DS1', mydata)













