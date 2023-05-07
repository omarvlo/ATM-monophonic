function d = disteu(x, y)

    [M, N] = size(x);
    [M2, P] = size(y);

    if (M ~= M2)
    error('Matrix dimensions do not match.')
    end
    
    d = zeros(N, P);    %Se crea una matriz con NxP dimensiones para almacenar
                        %En ella se almacenan las distancias entre cada
                        %vector de cada matriz
    if (N < P)

        copies = zeros(1,P);

        for n = 1:N

            d(n,:) = sum((x(:, n+copies) - y) .^2, 1);

        end
        
    else
        
        copies = zeros(1,N);

        for p = 1:P

            d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';

        end
        
    end
    
    d = d.^0.5;     %Debido a que la distancia calculada en cada ciclo está elevada
                    %se realiza la raíz cuadrada de toda la matriz que
                    %contiene las distancias

return