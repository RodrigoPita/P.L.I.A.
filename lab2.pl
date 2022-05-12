%min(X, Y, M)
%min(X, Y, X):- X =< Y, !.
%min(X, Y, Y).

%A) Exemplo em que o Prolog não fornece uma resposta correta
%min(2, 3, 3) --> True

%B) Corrija o programa
min(X, Y, M):- X =< Y, !, M is X.
min(X, Y, Y).
