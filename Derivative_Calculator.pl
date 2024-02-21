delexponent0(_^0, 1).
delexponent0(X^1, X).
delexponent0(X^N, Result) :- N\=1, Result = X^N.

% basic functions
derivative(N, Result) :- number(N), Result is 0.
derivative(x, 1).
derivative(F+G, Result) :- derivative(F, DerF), derivative(G, DerG), Result = DerF + DerG.
derivative(F*G, Result) :- derivative(F, DerF), derivative(G, DerG), Result = DerF*G + F*DerG.
derivative(F/G, Result) :- derivative(F, DerF), derivative(G, DerG), Result = (DerF*G - F*DerG)/G^2.
derivative(_^0, 0).
derivative(X^N, Result) :- N\=0, NewExp is N-1, delexponent0(X^NewExp, Result2), Result = N*Result2.

% trigonometric functions
derivative(sin(X), Result) :- derivative(X, Result2), Result = cos(X)*Result2.
derivative(cos(X), Result) :- derivative(X, Result2), Result = -sin(X)*Result2.
derivative(tg(X), Result) :- derivative(X, Result2), Result = Result2/(cos(X))^2.
derivative(ctg(X), Result) :- derivative(X, Result2), Result = -Result2/(sin(X))^2.