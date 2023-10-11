/* 1. Описать следующее дерево отношений с помощью предиката "родитель" */
% Родитель(родитель, ребенок)
parent(bob, liz).
parent(bob, paul).
parent(bob, sam).
parent(john, bob).
parent(mary, ann).
parent(mary, bob).
parent(paul, pat).

/* 2. Введите отношения "мужчина", "женщина" в форме фактов. */
man(bob).
man(john).
man(paul).
man(sam).
woman(ann).
woman(liz).
woman(mary).
woman(pat).

/* 3. С помощью правил определите отношения "отец", "мать", "брат", "сестра", "внук",
"тетя", "иметь двух детей", "продолжатель рода" (мужчина, у которого есть сын).*/
father(Dad, Child) :- parent(Dad, Child), man(Dad).
mother(Mum, Child) :- parent(Mum, Child), woman(Mum).
brother(Bro, Human) :- parent(X, Bro), parent(X, Human), man(Bro), Bro \= Human.
sister(Sis, Human) :- parent(X, Sis), parent(X, Human), woman(Sis), Sis \= Human.
grandson(GSon, Human) :- parent(X, GSon), parent(Human, X), man(GSon).
aunt(Aunt, Human) :- parent(X, Human), sister(Aunt, X).
twoChildren(Human) :- parent(Human, X), parent(Human, Y), X @> Y, not((parent(Human, Z), Z \= X, Z \= Y)).
progenitorOfTheGenus(Man) :- parent(Man, X), man(X), man(Man).

/* 4. Задайте вопросы и получите ответы в Пролог-системе: */
a :- write('a) Кто отец Сэма?'), nl, father(Who, sam), write(Who).
b :- write('b) Есть ли мать у Боба?'), nl, mother(_, bob).
c :- write('c) Кто сестра Сэма?'), nl, sister(Who, sam), write(Who).
d :- write('d) Есть ли сестра у Лиз?'), nl, sister(_, liz).
e :- write('e) Кто брат Боба?'), nl, brother(Who, bob), write(Who).
f :- write('f) Кто внуки Мэри?'), nl, grandson(Who, mary), write(Who).
g :- write('g) Чей внук Паул?'), nl, grandson(paul, Who), write(Who).
h :- write('h) Кто тетя Сэма?'), nl, aunt(Who, sam), write(Who).
i :- write('i) Есть ли племянники у Энн?'), nl, aunt(ann, _).
j :- write('j) У кого ровно двое детей? (Пролог-система должна находить только Мэри, и, причем, только один раз).'), nl, twoChildren(Who), write(Who).
k :- write('k) Боб - продолжатель рода?'), nl, progenitorOfTheGenus(bob).
