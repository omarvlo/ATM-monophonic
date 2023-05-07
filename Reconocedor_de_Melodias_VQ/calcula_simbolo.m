function simbolo_nota = calcula_simbolo(rec_tiempo,tempo)

for i=1:1:length(rec_tiempo)
    
    tiempo = rec_tiempo(i)
    
    if ((tiempo>=73)&&(tiempo<=100)) 
        simbolo = 1
    elseif ((tiempo>=37)&&(tiempo<=72))
        simbolo = 2
    elseif ((tiempo>=19)&&(tiempo<=36))       
        simbolo = 3
    elseif ((tiempo>=10)&&(tiempo<=18)) 
        simbolo = 4
    elseif ((tiempo>=5)&&(tiempo<=9)) 
        simbolo = 5   
    elseif ((tiempo>=3)&&(tiempo<=4)) 
        simbolo = 6  
    elseif ((tiempo>=1)&&(tiempo<=2)) 
        simbolo = 7
    else
        simbolo = 8
    end
    
    simbolo_nota(i) = simbolo;
    
end

return