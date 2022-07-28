% 1) Crie um predicado range( X, Y, L ) p/ gerar uma lista L com todos os inteiros no intervalo entre X e Y
% Exemplo: 
% ?_ range( 3, 8, L ).
% L = [ 3, 4, 5, 6, 7, 8 ]

range( X, X, [X] ):- !.
range( X, Y, [X|T] ):- X < Y, !, X1 is X + 1, range( X1, Y, T ).
range( X, Y, [X|T] ):- X1 is X - 1, range( X1, Y, T ).

% 2) Crie um predicado dup( L1, N, L2 ) que duplica N vezes cada elemento da lista L1, produzindo a lista L2
% Exemplo:
% ?_ dup( [ a, c, d ], 3, L ).
% L = [ a, a, a, c, c, c, d, d, d ]

conc( [], L, L ).
conc( [X|T1], L2, [X|T3] ):- conc( T1, L2, T3 ).

multi( _, 0, [] ):- !.
multi( X, N, [X|T] ):- N1 is N - 1, multi( X, N1, T ).
 
dup([], _, [] ):- !.
dup( [X|T], N, L ):- multi( X, N, Lx ), dup( T, N, L1 ), conc( Lx, L1, L ).

% 3) Crie um predicado primo( N ) que eh verdade se N eh um numero primo
% Exemplo:
% ?_ primo( 13 ).
% True

composto( N ):- N1 is ceil( sqrt( N ) ), range( 2, N1, L ), member( X, L ), 0 is N mod X.
primo( N ):- not( composto( N ) ).