function escribe_midi(rec_nota,rec_tiempo_simbolo)% initialize matrix:
tempo=857142;
% tempo=1000000;
N = 2;  % number of notes
M = zeros(2,6);

M(:,1) = 1;         % all in track 1
M(:,2) = 1;         % all in channel 1
M(:,3) = [60,62]';      % note numbers: one ocatave starting at middle C (60)
M(:,4) = round(linspace(80,120,N))';  % lets have volume ramp up 80->120
M(1,5) = 0.5; 
M(1,6) = 1;  % note on:  notes start every .5 seconds
M(2,5) = 1; 
M(2,6) = 2;  % note on:  notes start every .5 seconds

midi_new = matrix2midi(M,tempo);
writemidi(midi_new, 'testout999.mid');