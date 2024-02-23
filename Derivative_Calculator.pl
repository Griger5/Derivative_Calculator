delexponent0(_^0, 1).
delexponent0(X^1, X).
delexponent0(X^N, Result) :- N\=1, Result = X^N.

% basic functions
derivative(N, Result) :- number(N), Result = 0.
derivative(N/M, Result) :- number(N), number(M), Result = 0.
derivative(x, 1).
derivative(F+G, Result) :- derivative(F, DerF), derivative(G, DerG), Result = DerF + DerG.
derivative(F*G, Result) :- derivative(F, DerF), derivative(G, DerG), Result = DerF*G + F*DerG.
derivative(F/G, Result) :- \+number(F), \+number(G), derivative(F, DerF), derivative(G, DerG), Result = (DerF*G - F*DerG)/G^2.

% trigonometric functions
derivative(sin(X), Result) :- derivative(X, Result2), Result = cos(X)*Result2.
derivative(cos(X), Result) :- derivative(X, Result2), Result = -sin(X)*Result2.
derivative(tg(X), Result) :- derivative(X, Result2), Result = Result2/(cos(X))^2.
derivative(ctg(X), Result) :- derivative(X, Result2), Result = -Result2/(sin(X))^2.

% logarithmic functions
derivative(ln(X), Result) :- derivative(X, Result2), Result = Result2/X.
derivative(log(e, X), Result) :- derivative(ln(X), Result).
derivative(log(N, X), Result) :- number(N), N\=e, derivative(X, Result2), Result = Result2/(X*ln(N)).

% exponential functions
derivative(_^0, 0).
derivative(X^N, Result) :- number(N), N\=0, NewExp is N-1, delexponent0(X^NewExp, Xexp), derivative(X, Result2), Result = N*Xexp*Result2.
derivative(F^G, Result) :- \+number(F), \+number(G), G\=_/_, derivative(F, DerF), derivative(G, DerG), NewExp = G-1, Result = G*DerF*F^NewExp + DerG*ln(F)*F^G.
derivative(F^G, Result) :- \+number(F), \+number(G), G=N/M, \+number(N), \+number(M), derivative(F, DerF), derivative(G, DerG), NewExp = G-1, Result = G*DerF*F^NewExp + DerG*ln(F)*F^G.
derivative(X^(N/M), Result) :- number(N), number(M), N\=0, M\=0, NewExp is N/M-1, delexponent0(X^NewExp, Xexp), derivative(X, Result2), Result = N/M*Xexp*Result2.
derivative(sqrt(X), Result) :- derivative(X^0.5, Result).
derivative(e^X, Result) :- derivative(X, Result2), Result = e^X*Result2.
derivative(N^X, Result) :- number(N), N\=0, N\=e, derivative(X, Result2), Result = N^X*ln(N)*Result2.

% cyclometric functions
derivative(arcsin(X), Result) :- derivative(X, Result2), Result = Result2/sqrt(1-X^2).
derivative(arccos(X), Result) :- derivative(X, Result2), Result = -Result2/sqrt(1-X^2).
derivative(arctg(X), Result) :- derivative(X, Result2), Result = Result2/(1+X^2).
derivative(arcctg(X), Result) :- derivative(X, Result2), Result = -Result2/(1+X^2).

% hyperbolic functions
derivative(sinh(X), Result) :- derivative(X, Result2), Result = cosh(X)*Result2.
derivative(cosh(X), Result) :- derivative(X, Result2), Result = sinh(X)*Result2.
derivative(tgh(X), Result) :- derivative(X, Result2), Result = Result2/(cosh(X))^2.
derivative(ctgh(X), Result) :- derivative(X, Result2), Result = -Result2/(sinh(X))^2.


main :-
    write("Enter the function that you want to calculate the derivative of:"),
	read(Function),
	derivative(Function, Result),
    writeln(Result),
    fail.