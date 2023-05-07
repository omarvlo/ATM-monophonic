function Fo = tono_fundamental (fs,s,f_superior,f_inferior)

s1 = s; %Este es el segmento que se analiza y varía dependiendo de la existencia del tono fundamental
a=0;

x1 = 1;
x2 = length(s1);

%energia_silencio = 1;
% w=hamming(length(s1));
% s1=w.*s1;

% figure(1)
% subplot(2,1,1),plot(s1)
% subplot(2,1,2),plot(energia)

corr=autocorr(s1,length(s1)-1); %Se le aplica la autocorrelación al segmento


%  figure(2);
%  plot(corr);
% Calculo de coeficientes n_80 y n_300

n_inferior = fs/f_inferior;
n_superior = fs/f_superior;

% Se crea un vector llamado b acotado de n_80 a n_300 para cumplir la primera
% condición del valor máximo de energía dentro de ese intervalo

n=round(n_superior);
m=1;
b=0;

for i=1:1:( n_inferior - n_superior + 1 );
    a = corr(1,n);
    b(m,1) = a;
    n = n+1;
    m = m+1;   
end

%Se obtiene el valor máximo en ese intervalo

compara = max(b);

% Si el valor del valor máximo supera el 60% de la energía se le asigna a
% la variable Valor_max para cumplir con la segunda condición.

if (compara > 0.45) %&& (energia>energia_silencio)
    Valor_max = compara;
else 
    Fo = 0;
    return
end

No=0;
d=1;

% Se itera el vector b acotado hasta llegar a la n subindice 0

for i = 1:1:(length(corr))
    c = corr(1,i);
    if c == Valor_max
        No = d; %Se asigna el valor de n subindice 0.
        Fo = fs/No;
        return
    end
    d = d+1;
end


end