% Q1.
q( 1, 1 ):- !.
q( N, X ):- N1 is N - 1, X1 is 2 * N - 1, q( N1, X2 ), X is X1 + X2.

% Q2.a)
iRenda( S, I ):- S > 2115, !, A is S * 0.275, I is A - 423.08.
iRenda( S, I ):- S >= 1058, !, A is S * 0.15, I is A - 158.7.
iRenda( _, 0 ).

% Q2.b)
salario( B, L ):- iRenda( B, I ), L is B - I.

% Q3.
slice_end( _, 0, [] ):- !.
slice_end( [X|T], I, L2 ):- I1 is I - 1, slice_end( T, I1, L3 ), conc( [X], L3, L2 ).

slice_start( L, 1, L ):- !.
slice_start( [_|T], I, L2 ):- I1 is I - 1, slice_start( T, I1, L2 ).

slice( L1, I, K, L2 ):- slice_end( L1, K, L3 ), slice_start( L3, I, L2 ).