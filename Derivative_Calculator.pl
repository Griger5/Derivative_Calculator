delexponent0(_^0, 1).
delexponent0(X^N, X^N).

% basic functions
derivative(N*X, Result) :- derivative(X, Result2), Result = N*Result2.
derivative(X^N, Result) :- NewExp is N-1, delexponent0(X^NewExp, Result2), Result = N*Result2.

% trigonometric functions
derivative(sin(X), Result) :- derivative(X, Result2), Result = cos(X)*Result2.
derivative(cos(X), Result) :- derivative(X, Result2), Result = -sin(X)*Result2.