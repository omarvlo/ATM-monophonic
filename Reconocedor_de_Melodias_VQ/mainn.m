clc;clear;
[z, fs] = audioread('minuet.wav');
archivo_escribir = 'minuet_MFCC_09_08_20.mid';
tempo = 90;
for i=1:length(z)
    s(i)=z(i,1);
end

subplot(2,1,1)
plot(s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
periodo_seg = 0.035;
periodo = round(fs*periodo_seg);
no_total = length(s)/periodo;
x1 = 1;
x2 = x1 + periodo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
determina_nota=0;
no_segmentos_analizar=5;
rep=[0 0 0 0 0];
contador_segmentos_iniciales=0;
no_segmentos_sinnota=0;
inicio_segmento_sinnota=0;
energia_anterior=0.01;
segmento=1;
inicio_final=0;
cont=1;
sin_fo=0;
silencio=0;
final=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
while(x2<length(s))

    seg=s(x1:x2);
    seg=seg';
    energia = calcula_energia(seg);
    vector_energia(x1)=energia;
    delta_energia = (energia - energia_anterior)%/energia_anterior;
    energia_anterior = energia;
    
    if inicio_final == 1
        seg=s(x1:x2);
        nota = reconoce_libro(seg,fs);
        arreglo_musical(segmento) = nota;
        segmento = segmento+1;
    end
    
    if (delta_energia >=0.05)     
        
        if inicio_final==0    
        display('INICIO')
            vector_inicio(cont)=segmento;
            if cont>1
            vector_final(cont-1)=vector_inicio(cont)-1;
            tam=length(vector_final);
            end      
            cont = cont + 1;
            
            segmento = segmento+1;
        end
        inicio_final=1;
        silencio=0;
    else
        inicio_final=0;
        display('final')
        seg=s(x1:x2);
        Fo = tono_fundamental_2 (fs,seg,1000,60);
        octava = selecciona_octava(Fo);
        if octava ~=0
        nota = reconoce_libro(seg,fs);
        arreglo_musical(segmento) = nota;
        end
        segmento = segmento+1;
        if (octava==0 && delta_energia < .008) %0.008
            sin_fo=sin_fo+1;
        end
        if sin_fo>2
            %display('silencio')
            silencio=silencio+1;
        end
        if silencio>=2
            display('final')
            final=final+1;
            if final<=1
            vector_final(tam+1)=segmento;
            end
        end
        
    end

    x1 = x2+1   ;    
    x2 = x1 + periodo;
    
end
subplot(2,1,2)
plot(vector_energia)

for i=1:1:length(vector_final)
% tiempo(i) = (vector_final(i) - vector_inicio(i))/44100;
% vector_senal = s(vector_inicio(i):vector_final(i));
% senal{i}=vector_senal; 
    nota_simbolos = arreglo_musical(vector_inicio(i):vector_final(i));
    arreglos_musicales{i}=nota_simbolos;
end

for k=1:1:length(arreglos_musicales)
    
    for ok=1:1:100
        rep(ok)=0;
    end

    for i=1:1:length(arreglos_musicales{k})        
        for j=1:1:length(arreglos_musicales{k})   
            if arreglos_musicales{k}(i)==arreglos_musicales{k}(j)  
                rep(i)=rep(i)+1; 
            end
        end
    end
    
    [maxim ind] = max(rep);
    nota_reconocida=arreglos_musicales{k}(ind);
    muestra_nota(nota_reconocida);
    rec_nota(k)=nota_reconocida;
    rec_tiempo_segundos(k)=length(arreglos_musicales{k});
end

for i=1:1:length(rec_nota)
   rec_nota(i) = rec_nota(i) + 12; 
end

%simbolo_nota = calcula_simbolo(rec_tiempo_segundos,tempo);

rec_tiempo_simbolo = calcula_tiempos(rec_tiempo_segundos,tempo,periodo_seg);

escribe_midi(tempo,rec_nota,rec_tiempo_simbolo,archivo_escribir)

display('TERMINADO')

