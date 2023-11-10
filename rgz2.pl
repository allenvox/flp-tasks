% Предикат для чтения строк из файла
read_file_lines(Filename, Lines) :-
    open(Filename, read, Stream),
    read_file_lines_aux(Stream, Lines),
    close(Stream).
read_file_lines_aux(Stream, []) :- at_end_of_stream(Stream), !.
read_file_lines_aux(Stream, [Line | Rest]) :-
    read_line_to_string(Stream, Line),
    read_file_lines_aux(Stream, Rest).

% Предикат для сравнения строк и поиска первой несовпадающей позиции
compare_strings([], [], _).
compare_strings([Char1 | Rest1], [Char2 | Rest2], Position) :-
    (Char1 \= Char2 ->
        Position = 1
    ;
        NextPosition is Position + 1,
        compare_strings(Rest1, Rest2, NextPosition)
    ).

% Предикат для сравнения двух списков строк
compare_files([], [], _).
compare_files([Line1 | Rest1], [Line2 | Rest2], LineNumber) :-
    (Line1 \= Line2 ->
        % Если строки не совпадают, выводим информацию о первом несовпадении
        write('Файлы отличаются в строке '), write(LineNumber), write(', позиция: '), 
        compare_strings(Line1, Line2, Position),
        writeln(Position)
    ;
        true
    ),
    NewLineNumber is LineNumber + 1,
    compare_files(Rest1, Rest2, NewLineNumber).

compare_text_files(File1, File2) :-
    read_file_lines(File1, Lines1),
    read_file_lines(File2, Lines2),
    compare_files(Lines1, Lines2, 1).
