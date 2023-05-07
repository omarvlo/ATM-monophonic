function notas_por_tiempos = calcula_tiempos(rec_tiempo,tempo,periodo)

for i=1:1:length(rec_tiempo)
    

    %correspondencias
    %1% redonda = 4
    %2% blanca_p = 3
    %3% blanca = 2
    %4% negra_p = 1.5
    %5% negra = 1
    %6% corchea_p = 0.75
    %7% corchea = 0.5
    %8% semicor_p = 0.375
    %9% semicor = 0.25
    %10% fusa_p = 0.1875
    %11% fusa = 0.125
    %12% semifusa_p = 0.09375
    %13% semifusa = 0.0625
    duracion = rec_tiempo(i)*periodo;
    valor_negra_tempo = 60/tempo;
    corresp = duracion/valor_negra_tempo
    
    if ((corresp>=3.84)&&(corresp<=4.24)) 
        tiempo = 4;
    elseif ((corresp>=2.8)&&(corresp<=3.39))
        tiempo = 3;
    elseif ((corresp>=1.8)&&(corresp<=2.79))       
        tiempo = 2;
    elseif ((corresp>=1.3)&&(corresp<=1.79))
        tiempo = 1.5;
    elseif ((corresp>=.81)&&(corresp<=1.29)) 
        tiempo = 1;    
    elseif ((corresp>=0.65)&&(corresp<=0.8))
        tiempo = 0.75;
    elseif ((corresp>=0.4)&&(corresp<=0.64)) 
        tiempo = 0.5;    
    elseif ((corresp>=0.3)&&(corresp<=0.39))
        tiempo = 0.375;
    elseif ((corresp>=.2)&&(corresp<=0.29)) 
        tiempo = 0.25;
    elseif ((corresp>=1.15)&&(corresp<=1.99))
        tiempo = 0.1875;
    elseif ((corresp>=0.11)&&(corresp<=1.14)) 
        tiempo = 0.125;
    elseif ((corresp>=0.081)&&(corresp<=0.1))
        tiempo = 0.09375;
    elseif ((corresp>=0.05)&&(corresp<=0.08)) 
        tiempo = 0.0625;           
    else
        tiempo = 0;
    end
    
    notas_por_tiempos(i) = tiempo;
    
end

return