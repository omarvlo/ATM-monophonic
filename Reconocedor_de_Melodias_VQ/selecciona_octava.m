function octava=selecciona_octava(Fo)

    if ((Fo>60)&&(Fo<125)) 
        display('octava2')
        octava = 2;
    elseif ((Fo>129)&&(Fo<255))
        display('octava3')
        octava = 3;
    elseif ((Fo>258)&&(Fo<510)) 
        display('octava4')        
        octava = 4;
    elseif ((Fo>515)&&(Fo<1010)) 
        display('octava5')
        octava = 5;
    elseif ((Fo>1015)&&(Fo<1975)) 
        display('octava6')
        octava = 6;
    else

        octava=0;
    end
    
return