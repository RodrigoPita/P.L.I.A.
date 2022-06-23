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

%  Q11.
media( A, B , M ):- M is ( A + B )/2.