contaInteiros( [], 0 ).
contaInteiros( [X|T], N ):- integer(X), !, contaInteiros( T, N1 ), N is N1 + 1.
contaInteiros( [_|T], N ):- contaInteiros( T, N ).

not2(G):- G, !, fail.
not2(_).