pai(abraao, ismael).
pai(abraao, isaac).
pai(isaac, esau).
pai(isaac, jaco).

%Responda as perguntas abaixo
%a) Quais sao os filhos de Abraao? pai(abraao, X).

%b) Abraao tem filhos? pai(abraao, _).

%c) Quem eh o pai de Esau? pai(X, esau).

%d) Abraao eh avo? pai(abraao, X), pai(X, Y).

%e) avo(X, Y), se X for avo de Y
avo(X, Y):- pai(X, Z), pai(Z, Y).

%f) irmaos(X, Y) se X e Y forem irmaos
irmaos(X, Y):- pai(Z, X), pai(Z, Y), X \= Y.

%g) descendente(X, Y) se Y for descendente de X
pai(pai, filho1).
pai(filho1, filho2).
pai(filho2, filho3).
pai(filho3, filho4).
pai(filho4, filho5).
pai(filho5, filho6).
pai(filho6, filho7).

descendente(X, Y):- pai(X, Y).
descendente(X, Y):- pai(X, F), descendente(F, Y).
