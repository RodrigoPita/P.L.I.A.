contaInteiros( [], 0 ).
contaInteiros( [X|T], N ):- integer(X), !, contaInteiros( T, N1 ), N is N1 + 1.
contaInteiros( [_|T], N ):- contaInteiros( T, N ).

not2(G):- G, !, fail.
not2(_).

troca( [X], [X] ).
troca( [X, Y|T1], [X|T2] ):- X =< Y, troca( [Y|T1], T2 ).
troca( [X, Y|T1], [Y|T2] ):- X > Y, troca( [X|T1], T2 ).

bsort( L, L ):- troca( L, L ).
bsort( L1, L2 ):- troca( L1, L3 ), bsort( L3, L2 ), !.

insere( X, [], [X] ).
insere( X, [Y|T], [X, Y|T] ):- X =< Y.
insere( X, [Y|T], [Y|T] ):- X > Y, insere( X, T1, T2 ).

isort( [], [] ).
isort( [X|T], S ):- isort( T, T1 ), insere( X, T1, S ).