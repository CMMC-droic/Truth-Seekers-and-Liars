% schema dice(diceID, side, value)
% schema comp(Dice1, Dice2, Side1, Side2, Winner)

dice(3, 1, 3). dice(3, 2, 5). dice(3, 3, 7). 
dice(2, 1, 1). dice(2, 2, 6). dice(2, 3, 8). 
dice(1, 1, 2). dice(1, 2, 4). dice(1, 3, 9).    % 3 dice instance

comp(D1,D2,S1,S2,D1) :- dice(D1,S1,R1), dice(D2,S2,R2), D1 < D2, R1 > R2.
% comp(D1,D2,S1,S2,D2) :- dice(D1,S1,R1), dice(D2,S2,R2), D1 < D2, R1< R2.

subgame(D1, D2, N) :- N = #count { D1, D2, S1, S2 :comp(D1, D2, S1, S2, D1)}, comp(D1, D2, S11, S22, R).

:- subgame(D1, D2, N1), subgame(D2, D3, N2), subgame(D1, D3, N3), N1 > N2, N2 < N3.

% win_1(N) :- N = #count { D2, S1, S2 :comp(1, D2, S1, S2, 1)}.
% win_2(N) :- N = #count { D2, S1, S2 :comp(2, D2, S1, S2, 2)}.
% win_3(N) :- N = #count { D2, S1, S2 :comp(3, D2, S1, S2, 3)}.