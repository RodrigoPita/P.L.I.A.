% Q1.
q( 1, 1 ):- !.
q( N, X ):- N1 is N - 1, X1 is 2 * N - 1, q( N1, X2 ), X is X1 + X2.