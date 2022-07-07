conc( [], L, L ).
conc( [X|T1], L2, [X|T3] ):- conc( T1, L2, T3 ).

delex( [_|T], L ):- conc( L, [_], T ).

tamanho( [], 0 ).
tamanho( [_|Y], N ):- tamanho( Y, N1 ), N is N1 + 1.

delm( R, S ): conc( L1, [M|L2], R ), tamanho( L1, N ), tamanho( L2, N ), conc( L1, L2, S ).

imprime( _, 0 ).
imprime( T, N ):- write( T ), N1 is N - 1, imprime( T, N1 ).

linha( _, -1 ).
linha( B, A ):- tab( B ), imprime( '*', A ), nl, B1 is B + 1, A1 is A - 2, linha( B1, A1 ).

triang( N ):- A is 2 * N - 1, linha( 0, A ).