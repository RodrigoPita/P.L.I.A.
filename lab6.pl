% 1) Crie um predicado range( X, Y, L ) p/ gerar uma lista L com todos os inteiros no intervalo entre X e Y
% Exemplo: 
% ?_ range( 3, 8, L ).
% L = [ 3, 4, 5, 6, 7, 8 ]

range( X, X, [X] ):- !.
range( X, Y, [X|T] ):- X1 is X + 1, range( X1, Y, T ).

% 2) Crie um predicado dup( L1, N, L2 ) que duplica N vezes cada elemento da lista L1, produzindo a lista L2
% Exemplo:
% ?_ dup( [ a, c, d ], 3, L ).
% L = [ a, a, a, c, c, c, d, d, d ]
