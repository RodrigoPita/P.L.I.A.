%Defina a relacao mdc(A, B, D)
mdc(A, 0, A).
mdc(A, B, D):- R is A mod B, mdc(B, R, D).

%Defina a relacao mmc(A, B, M)
mmc(A, B, M):- Num is A*B, mdc(A, B, Den), M is Num/Den.


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
%f) irmaos(X, Y) se X e Y forem irmaos
%g) descendente(X, Y) se Y for descendente de X
avo(X, Y):- pai(X, Z), pai(Z, Y).
irmaos(X, Y):- pai(Z, X), pai(Z, Y), X \= Y.
descendente(X, Y):- pai(X, Y); avo(X, Y).
