%min(X, Y, M)
%min(X, Y, X):- X =< Y, !.
%min(X, Y, Y).

%A) Exemplo em que o Prolog não fornece uma resposta correta
%min(2, 3, 3) --> True

%B) Corrija o programa
min(X, Y, M):- X =< Y, !, M is X.
min(X, Y, Y).

tamanho([], 0).
tamanho([_|Y], N):- tamanho(Y, N1), N is N1 + 1.

par([]).
par([_|T]):- impar(T).
impar([_|T]):- par(T).

conc([], L, L).
conc([X|T1], L2, [X|T3]):- conc(T1, L2, T3).
lshift([X|Y], T):- conc(Y, [X], T).

rshift(L1, L2):- lshift(L2, L1).
