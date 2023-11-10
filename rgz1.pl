% is element member of list or not
member(X, [X | _]).
member(X, [_ | T]) :- member(X, T).

% lists intersection
intersection([], _, []).
intersection([H | T], L2, [H | Result]) :-
    member(H, L2),
    intersection(T, L2, Result).
intersection([_ | T], L2, Result) :-
    intersection(T, L2, Result).

test_intersection :- 
    writeln('Введите список 1: '), read(List1), nl,
    writeln('Введите список 2: '), read(List2), nl,
    intersection(List1, List2, Result),
    write('Пересечение списков: '), write(Result), nl.
