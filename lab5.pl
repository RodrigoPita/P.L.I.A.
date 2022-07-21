% t( Esq, X, Dir )

% membro de uma arvore binaria
membro( X, t( _, X, _ ) ):- !.
membro( X, t( Esq, _, _ ) ):- membro( X, Esq ), !.
membro( X, t( _, _, Dir ) ):- membro( X, Dir ).

% membro de um dicionario binario
membro2( X, t(_, X, _ ) ):- !.
membro2( X, t( Esq, Y, _ ) ):- X < Y, membro2( X, Esq ), !.
membro2( X, t( _, Y, Dir ) ):- X > Y, membro2( X, Dir ).

% checa se eh uma arvore binaria
arvbin( nil ).
arvbin( t( Esq, X, Dir ) ):- X \= nil, !, arvbin( Esq ), arvbin( Dir ).

% checa se eh um dicionario binario
dicbin( nil ).
dicbin( t( nil, X, nil ) ):- X \= nil, !.
dicbin( t( Esq, X, nil ) ):- X \= nil, Esq = t( _, Y, _ ), Y < X, dicbin( Esq ), !.
dicbin( t( nil, X, Dir ) ):- X \= nil, Dir = t( _, Z, _ ), Z > X, dicbin( Dir ), !.
dicbin( t( Esq, X, Dir ) ):- X \= nil, Esq = t( _, Y, _ ), Y < X, dicbin( Esq ), Dir = t( _, Z, _ ), Z > X, dicbin( Dir ).

% calcula a altura de uma arvore binaria
altura( nil, 0 ).
altura( t( Esq, _, Dir ), N ):- altura( Esq, N1 ), altura( Dir, N2 ), N is 1 + max( N1, N2 ).

