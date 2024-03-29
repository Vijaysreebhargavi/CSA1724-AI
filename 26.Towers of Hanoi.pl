% Define the predicate hanoi/3
hanoi(1, Start, _, End) :-
    write('Move top disk from '),
    write(Start),
    write(' to '),
    write(End),
    nl.
hanoi(N, Start, Temp, End) :-
    N > 1,
    M is N - 1,
    hanoi(M, Start, End, Temp),
    hanoi(1, Start, _, End),
    hanoi(M, Temp, Start, End).
