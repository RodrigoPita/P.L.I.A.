%MDC
mdc(A, 0, A).
mdc(A, B, D):- R is A mod B, mdc(B, R, D).

%MMC
mmc(A, B, M):- Num is A*B, mdc(A, B, Den), M is Num/Den.
