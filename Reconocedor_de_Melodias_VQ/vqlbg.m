function r = vqlbg(d,k)

    e = .00005;                  %Esta es el parámetro de alteración en cada
                                %ciclo que se duplica el libro código
    r = mean(d, 2); %en r se guarda el libro código actual
    
    dpr = 10000;    %dpr es la distancia calculada entre matriz y matriz

    for i = 1:log2(k)
        
        r = [r*(1+e), r*(1-e)]; %Este es el paso 2 del algoritmo
    
        while(1 == 1)
            
                z = disteu(d, r); %Este es el paso 3 del algoritmo
                [m,ind] = min(z, [], 2);
                t = 0;
                
            for j = 1:2^i
                
                r(:, j) = mean(d(:, find(ind == j)), 2);%Este es el paso 4
                x = disteu(d(:, find(ind == j)),r(:, j));
                
                for q = 1:length(x)
                    t = t + x(q);
                end 
                
            end 
            
            if (((dpr - t)/t) < e) %Paso 5: Verificación del umbral
                break ;
                else dpr = t;
            end 
            
        end 
        
    end
    
return
