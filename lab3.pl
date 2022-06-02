prog1:- write('Digite um numero: '), read( X ), pnz( X ).

pnz( X ):- X > 0, write( 'positivo' ), !.
pnz( X ):- X < 0, write( 'negativo' ), !.
pnz( 0 ):- write( 'zero' ).


imprime( _, 0 ):- !.
imprime( X, N ):- N1 is N - 1, imprime( X, N1 ), write( X ).

linha( -1, _ ):- !.
linha( B, A ):- tab( B ), imprime( '*', A ), nl, B1 is B - 1, A1 is A + 2, linha( B1, A1 ).

arvore(N):- N1 is N - 1, linha( N1, 1 ).
