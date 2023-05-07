function nota = reconoce_prueba(matriz_datos)

    load libro_codigo_notas

        v = matriz_datos;
        code = libro_codigo;
        distmin = inf;
        k1 = 0;

        for l = 1:length(code)			% each trained codebook, compute distortion  

            d = disteu(v, code{l});
            dist = sum(min(d,[],2)) / size(d,1);

            if dist < distmin

                distmin = dist;
                k1 = l;

            end
            
        end

        switch k1
            
            case 1
                nota = 37;
                name = 'C2';   
                msg = sprintf('%s', name);disp(msg);
            case 2           
                nota = 38; 
                name = 'C2#';
                msg = sprintf('%s', name);disp(msg);                
            case 3           
                nota = 39;
                name = 'D2';
                msg = sprintf('%s', name);disp(msg);                
            case 4        
                nota = 40;  
                name = 'D2#';
                msg = sprintf('%s', name);disp(msg);                
            case 5            
                nota = 41; 
                name = 'E2';
                msg = sprintf('%s', name);disp(msg);                
            case 6          
                nota = 42;
                name = 'F2'; 
                msg = sprintf('%s', name);disp(msg);                
            case 7          
                nota = 43;
                name = 'F2#';
                msg = sprintf('%s', name);disp(msg);                
            case 8           
                nota = 44;
                name = 'G2';
                msg = sprintf('%s', name);disp(msg);                
            case 9         
                nota = 45;
                name = 'G2#'; 
                msg = sprintf('%s', name);disp(msg);                
            case 10            
                nota = 46;
                name = 'A2';
                msg = sprintf('%s', name);disp(msg);                
            case 11      
                nota = 47;
                name = 'A2#';
                msg = sprintf('%s', name);disp(msg);                
            case 12           
                nota = 48;
                name = 'B2';
                msg = sprintf('%s', name);disp(msg);                
            case 13           
                nota = 49; 
                name = 'C3';
                msg = sprintf('%s', name);disp(msg);
            case 14          
                nota = 50;
                name = 'C3#';
                msg = sprintf('%s', name);disp(msg);                
            case 15      
                nota = 51; 
                name = 'D3';
                msg = sprintf('%s', name);disp(msg);                
            case 16         
                nota = 52;
                name = 'D3#';
                msg = sprintf('%s', name);disp(msg);                
            case 17         
                nota = 53;
                name = 'E3';
                msg = sprintf('%s', name);disp(msg);                
            case 18    
                nota = 54;
                name = 'F3';
                msg = sprintf('%s', name);disp(msg);                
            case 19         
                nota = 55;
                name = 'F3#';
                msg = sprintf('%s', name);disp(msg);                
            case 20           
                nota = 56;
                name = 'G3';
                msg = sprintf('%s', name);disp(msg);                
            case 21    
                nota = 57;
                name = 'G3#';
                msg = sprintf('%s', name);disp(msg);                
            case 22      
                nota = 58;
                name = 'A3';
                msg = sprintf('%s', name);disp(msg);                
            case 23       
                nota = 59;
                name = 'A3#';
                msg = sprintf('%s', name);disp(msg);                
            case 24         
                nota = 60;
                name = 'B3';
                msg = sprintf('%s', name);disp(msg);   
            case 25    
                nota = 61;
                name = 'C4';
                msg = sprintf('%s', name);disp(msg);                
            case 26        
                nota = 62;
                name = 'C4#';
                msg = sprintf('%s', name);disp(msg);                
            case 27     
                nota = 63;
                name = 'D4';
                msg = sprintf('%s', name);disp(msg);                
            case 28       
                nota = 64;
                name = 'D4#';
                msg = sprintf('%s', name);disp(msg);                
            case 29           
                nota = 65;
                name = 'E4';
                msg = sprintf('%s', name);disp(msg);                
            case 30        
                nota = 66;
                name = 'F4';
                msg = sprintf('%s', name);disp(msg);                
            case 31      
                nota = 67;
                name = 'F4#';
                msg = sprintf('%s', name);disp(msg);                
            case 32         
                nota = 68;
                name = 'G4';
                msg = sprintf('%s', name);disp(msg);   
            case 33         
                nota = 69; 
                name = 'G4#'; 
                msg = sprintf('%s', name);disp(msg);                
            case 34             
                nota = 70;
                name = 'A4';
                msg = sprintf('%s', name);disp(msg);                
            case 35       
                nota = 71;
                name = 'A4#';
                msg = sprintf('%s', name);disp(msg);                
            case 36   
                nota = 72;
                name = 'B4'; 
                msg = sprintf('%s', name);disp(msg);                
            case 37      
                nota = 73;
                name = 'C5';
                msg = sprintf('%s', name);disp(msg);                
            case 38       
                nota = 74;
                name = 'C5#';
                msg = sprintf('%s', name);disp(msg);                
            case 39         
                nota = 75;
                name = 'D5';  
                msg = sprintf('%s', name);disp(msg);                
            case 40         
                nota = 76;  
                name = 'D5#';
                msg = sprintf('%s', name);disp(msg);                         
            case 41      
                nota = 77;
                name = 'E5';
                msg = sprintf('%s', name);disp(msg);                
            case 42             
                nota = 78; 
                name = 'F5'; 
                msg = sprintf('%s', name);disp(msg);                
            case 43         
                nota = 79;
                name = 'F5#';
                msg = sprintf('%s', name);disp(msg);   
            case 44        
                nota = 80;
                name = 'G5';
                msg = sprintf('%s', name);disp(msg);                
            case 45         
                nota = 81;
                name = 'G5#';
                msg = sprintf('%s', name);disp(msg);                
            case 46         
                nota = 82;
                name = 'A5';
                msg = sprintf('%s', name);disp(msg);                
            case 47       
                nota = 83;
                name = 'A5#';
                msg = sprintf('%s', name);disp(msg);                
            case 48       
                nota = 84;
                name = 'B5'; 
                msg = sprintf('%s', name);disp(msg);                   
                       
        end
 
return
