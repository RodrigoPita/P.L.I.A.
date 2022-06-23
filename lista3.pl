% Q1. 
conc( [], L, L ).
conc( [X|T1], L2, [X|T3] ):- conc( T1, L2, T3 ).

membro( X, L ):- conc( _, [X|_], L ).

s( a, b )
s( a, c )
s( b, a )
s( b, c )
s( c, a )
s( c, b )

membro(X, [a,b,c]), membro(Y, [a,b,c]), X \= Y, assert( s(X,Y) ).

% Q4.
cubo:- write( 'Digite o numero inteiro ou stop: '), read( X ), avalia( X ).
avalia( stop ):- !.
avalia( X ):- integer( X ), X1 is X * X * X, write( 'O cubo de '), write( X ), write( ' eh '), write( X1 ), nl, cubo.
avalia( X ):- not( integer( X ) ), write( X ), write( ' nao eh inteiro '), nl, cubo.

% Q5.a)
assert( empregado( 1, 'Alexandre Maia', '2234-2387') ).
assert( empregado( 2, 'Joana Oliveira', '2759-2748') ).
assert( empregado( 3, 'Pedro Henrique', '2957-2869') ).

% Q5.b)
assert( projeto( 1, 'Auditoria de Sistema' ) ).
assert( projeto( 2, 'DataWareHouse' ) ).
assert( projeto( 3, 'Gerencia de Configuracao' ) ).
assert( projeto( 4, 'Importacao de Dados' ) ).

% Q5.c)
assert( trabalha( 1, 1 ) ).
assert( trabalha( 1, 2 ) ).
assert( trabalha( 2, 3 ) ).
assert( trabalha( 2, 4 ) ).
assert( trabalha( 3, 2 ) ).

% Q5.d)
empregado( Id, Nome, Tel )

% Q5.e)
projeto( _, Nome ).

% Q5.f)
empregado( _, Nome, Tel ), write( Nome ), write( ': ' ), write( Tel ), nl, fail.

% Q5.g)
findall( Nome, empregado( _, Nome, _ ), L ).

% Q5.h)
empregado( _, Nome, '2234-2387' ).

% Q5.i)
projeto( IdP, 'DataWareHouse' ), trabalha( IdE, IdP ), empregado( IdE, Nome, _), write( Nome ), nl, fail.

% Q5.j)
projeto( IdP, 'DataWareHouse' ), setof( IdE, trabalha( IdE, IdP ), L ), length( L, N ), write( N ), nl, fail.

% Q5.k)
retract( empregado( Id, 'Joana Oliveira', _) ), assert( empregado( Id, 'Joana Oliveira', '2275-8277') ).

% Q5.l)
retract( empregado( _, _, _ ) ).

% Q5.m)
retract( projeto( _, _ ) ), retract( projeto( _, _ ) ).

% Q5.n)
% removeTrabalha:- retract( trabalha( _, _ ) ), removeTrabalha.
retract( trabalha( _, _ ) ), fail.

% Q5.o)
% projeto( IdP, 'DataWareHouse'), retract( projeto( _, 'DataWareHouse') ), removeDWH( IdP ).
% removeDWH( IdP ):- retract( trabalha( _, IdP ) ), removeDWH.
retract( projeto( IdP, 'DataWareHouse' ) ), retract( trabalha( _, IdP ) ), fail.

% Q6.a)
soma( A, B, R ):- R is A + B.

% Q6.b)
subtracao( A, B, R ):- R is A - B.
multiplicacao( A, B, R ):- R is A * B.
divisao( A, B, R ):- R is A / B.

% Q6.c
calcula( A, B, soma, Res ):- soma( A, B, Res ).
calcula( A, B, subtracao, Res ):- subtracao( A, B, Res ).
calcula( A, B, multiplicacao, Res ):- multiplicacao( A, B, Res ).
calcula( A, B, divisao, Res ):- divisao( A, B, Res ).

% Q8.
fail.

% Q9.a)
?- X = bola, not( integer( X ) ), atom( X ).
X = bola

% Q9.b)
?- var(X), X=2, integer( X ), atom( X ).
false

% Q9.c)
?- T=..[paridade,dolar,real,3.62], arg(3,T,V).
T = paridade( dolar, real, 3.62 )
V = 3.63

% Q9.d) 
?- G=..[ adversarios| [fla,flu] ], arg(N, G, T).
G = adversarios( fla, flu )
N = 1, T = fla;
N = 2, T = flu;

% Q.e)
?- functor(T,s,3), arg(1,T,3), arg(3,T,1) , arg(2,T,2).
T = s( 3, 2, 1 ).

% Q.f) 
?- var(X), membro(X,[3,b,7]), nonvar(X) , atom(X).
X = b

%  Q11.
media( A, B, M ) :- nonvar( A ), nonvar( B ), M is ( A + B )/2.
media( A, B, M ) :- nonvar( A ), nonvar( M ), B is 2*M-A.
media( A, B, M ) :- nonvar( B ), nonvar( M ), A is 2*M-B.

% Q14.
subset( T, T ).
subset( T, L ):- del( _, L, L1 ), subset( T, L1 ).
subset2( L1, L2, L ):- setof( L1, subset( L1, L2 ), L ).

% Q15.
imprime( _, 0 ):- !.
imprime( X, N ):- N1 is N - 1, imprime( X, N1 ), write( X ).

linhaExterna( A, 1 ):- imprime( '*', A ), !.
linhaExterna( A, N ):- imprime( '*', A ), nl, N1 is N - 1, linhaInterna( A, N1 ).

linhaInterna( A, 1 ):- linhaExterna( A, 1 ), !.
linhaInterna( A, N ):- imprime( '*', 1 ), B is A - 2, tab( B ), imprime( '*', 1 ), nl, N1 is N - 1, linhaInterna( A, N1 ).

retang( N ):- linhaExterna( N, N ).