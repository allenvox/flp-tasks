% 1.
% X - lower bound, Y - upper bound
odd(X) :- X mod 2 =\= 0. % first - is X odd
odd(X, Y) :- Y >= X, odd(Y), write(Y), write('  '), fail. % if still in loop and Y is odd, print it and space after it
odd(X, Y) :- Y > X, Y1 is Y - 1, odd(X, Y1). % if Y > X, continue with (X, Y - 1)
odd(X, Y) :- Y == X. % if Y = X, end
print_odd() :- 
    writeln('Предикат, который печатает все нечётные числа из диапазона в порядке убывания.'),
    writeln('******************************************************************************'),
    writeln('Введите начало границы диапазона:'), read(X),
    writeln('Введите конец границы диапазона:'), read(Y),
	nl, writeln('Результат:'), odd(X, Y).
t1() :- print_odd().

% 2.
% X - Nth number, Y - value of Nth Fibonacci number
fibonacci(X, Y) :- X < 2, Y is 1, !. % if X < 2 (0 or 1), Y = 1
fibonacci(X, Y) :-
	X2 is X - 2,
	X1 is X - 1,
	fibonacci(X2, Y2), % (N-2)th number
	fibonacci(X1, Y1), % (N-1)th number
	Y is Y2 + Y1. % Nth Fibonacci number = (N-2)th + (N-1)th numbers
fibonacci() :-
	repeat, % loop
    writeln('Введите номер:'),
	read(X),
 	% if x < 0 - fail, else - print Nth Fibonacci number and \n\n
	(X < 0, !; (fibonacci(X, RES), write('Результат: '), writeln(RES), nl, nl, fail)).
print_fibonacci() :- 
    writeln('Предикат, который находит числа Фибоначчи по их номерам, которые в цикле вводятся'),
	writeln('с клавиатуры (осуществляется до тех пор, пока не будет введено отрицательное число.'),
	writeln('***********************************************************************************'),
    fibonacci().
t2() :- print_fibonacci().

% 3.
% N1 - first number, N2 - second number, L - src list,
% L1, L2, L3 - result lists
% Hn - head of nth list, Tn - tail of nth list
split(N1, N2, [H | T], [H | T1], L2, L3) :- % first - always
	H < min(N1, N2), !, % if head is less than min(N1,N2)
	split(N1, N2, T, T1, L2, L3). % put it in L1 and continue recursively
split(N1, N2, [H | T], L1, [H | T2], L3) :- % second - if first failed
	H =< max(N1, N2), !, % if head is less than max(N1,N2)
	split(N1, N2, T, L1, T2, L3). % put it in L2 and continue recurs.
split(N1, N2, [H | T], L1, L2, [H | T3]) :- % third - if second failed
	split(N1, N2, T, L1, L2, T3). % put in L3 and continue
split(_, _, [], [], [], []). % if input L empty - results are empty, finish
print_split() :-
	writeln('Разбиение списка двумя числами на 3 списка: предикат(число1, число2, [список]) ->'),
	writeln('-> [список до число1], [список между число1 и число2], [список после число2]'),
	writeln('***********************************************************************************'),
	writeln('Введите список: '), read(L),
	writeln('Введите первое число: '), read(N1),
	writeln('Введите второе число: '), read(N2),
	split(N1, N2, L, L1, L2, L3),
	writeln('Результат: '), writeln(L1), writeln(L2), writeln(L3).
t3 :- print_split().

% 4.
% L - input list, L_new / L_res - result list, Max - maximum occurencies of element in list, H - head, T - tail
mostСommon([], [], 0) :- !. % empty - finish
mostСommon([H | T], L_res, Max) :- 
	delete(T, H, L_temp), % delete H from list
	length([H | T], LenL), % count list items with H
	length(L_temp, LenL_temp), % count list items without all Hs
	Max_temp is LenL - LenL_temp, % occurencies of element H - Max_temp to compare with other elements
	mostСommon(L_temp, L_new, Max_maybe), % recursive call of mostCommon()
	(Max_temp > Max_maybe -> % is previous Max (Max_temp) > Max ^ from recursive call (Max_maybe) ?
		(L_res = [H], Max is Max_temp); % true - Max is Max_temp
		(Max is Max_maybe, % false - Max is Max_maybe
		(Max_temp =:= Max_maybe -> % and is Max_temp = Max_maybe
			L_res = [H | L_new]; % true - L_res = H + L_new
			L_res = L_new)) % false - L_res = L_new
	).
mostСommon(L, L_new) :-	mostСommon(L, L_new, _). % if calling mostCommon/2, call mostCommon/3 (L, L_new, _)
print_mostСommon() :-
	writeln('Предикат, возвращающий список из часто встречающиеся элементов другого списка'),
	writeln('(встроенные предикаты поиска максимума и сортировки не использовать)'),
	writeln('***********************************************************************************'),
	writeln('Введите список: '), read(L),
	mostСommon(L, L_new),
	writeln('Результат: '), writeln(L_new).
t4 :- print_mostСommon().
