prog1:- write('Digite um numero: '), read( X ), pnz( X ).

pnz( X ):- X > 0, write( 'positivo' ), !.
pnz( X ):- X < 0, write( 'negativo' ), !.
pnz( 0 ):- write( 'zero' ).
