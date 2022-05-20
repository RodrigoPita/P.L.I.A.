conc( [], L, L ).
conc( [X|T1], L2, [X|T3] ):- conc( T1, L2, T3 ).

% Q5.a)
inverte( [], [] ).
inverte( [X|T], L2 ):- inverte( T, L3 ), conc( L3, [X], L2 ).

% Q5.b)
palindromo( L ):- inverte( L, L ).

% Q6.
ultimo( X, [X] ).
ultimo( X, [_|T] ):- ultimo( X, T ).

% Q7.
prodescalar( [X], [Y], X*Y ).
prodescalar( [X|T1], [Y|T2], P ):- prodescalar( T1, T2, P1 ), P is ( X * Y)  + P1. 

% Q8.
par( [] ).
par( [_|T] ):- impar( T ).
impar( [_|T] ):- par( T ).

% Q9.
lshift( [X|Y], T ):- conc( Y, [X], T ).

% Q10.
rshift( L1, L2 ):- lshift( L2, L1 ).

% Q11.
tamanho( [], 0 ).
tamanho( [_|Y], N ):- tamanho( Y, N1 ), N is N1 + 1.

% Q12.
nvogais( [a], 1 ).
nvogais( [e], 1 ).
nvogais( [i], 1 ).
nvogais( [o], 1 ).
nvogais( [u], 1 ).
nvogais( [X], 0 ).
nvogais( [X|T], N ):- nvogais( [X], N1 ), nvogais( T, N2 ), N is N1 + N2.

% Q13.
split( [X], [X], [] ):- X >= 0.
split( [X], [], [X] ).
split( [X|T], P, N ):- split( [X], P1, N1 ), split( T, P2, N2 ), conc( P1, P2, P ), conc( N1, N2, N ).

% Q14.
removedup( [X|T], T1 ):- membro( X, T ), removedup( T, T1 ).
removedup( L, L ).

% Q15.
replace( X, Y, [X], [Y] ).
replace( _, _, [Z], [Z] ).
replace( X, Y, [A|T], L ):- replace( X, Y, [A], L1 ), replace( X, Y, T, L2 ), conc( L1, L2, L ).

% Q16.
membro( X, L ):- conc( _, [X|_], L ).

% Q17.
insere2( X, L, L ):- membro( X, L ), !.
insere2( X, L, [X|L] ).