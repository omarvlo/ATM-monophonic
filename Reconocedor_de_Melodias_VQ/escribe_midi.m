function escribe_midi(tempo,rec_nota,rec_tiempo_simbolo,nombre_archivo)% initialize matrix:
tempo_calculado = round((60/tempo)*1000000);
negra = 60/tempo;
acum = 0;
acum2 = 0;
% tempo=1000000;
N = length(rec_nota);  % number of notes
M = zeros(N,6);

M(:,1) = 1;         % all in track 1
M(:,2) = 1;         % all in channel 1
M(:,4) = round(linspace(80,120,N))';  % lets have volume ramp up 80->120

for i=1:1:N
M(i,3) = rec_nota(i);
if i>1
M(i,5) = M(i-1,6);
else
    M(i,5) = 0;
end
M(i,6) = acum + (rec_tiempo_simbolo(i)*negra);
acum = M(i,6);
end

midi_new = matrix2midi(M,tempo_calculado);
writemidi(midi_new, nombre_archivo);