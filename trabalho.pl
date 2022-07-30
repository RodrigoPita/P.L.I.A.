% Q1.
q( 1, 1 ):- !.
q( N, X ):- N1 is N - 1, X1 is 2 * N - 1, q( N1, X2 ), X is X1 + X2.

% Q2.a)
iRenda( S, I ):- S > 2115, !, A is S * 0.275, I is A - 423.08.
iRenda( S, I ):- S >= 1058, !, A is S * 0.15, I is A - 158.7.
iRenda( _, 0 ).

% Q2.b)
salario( B, L ):- iRenda( B, I ), L is B - I.

