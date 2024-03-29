% Facts about family relationships
male(john).
male(bob).
male(tom).
male(jack).
male(michael).

female(lisa).
female(sarah).
female(emily).
female(anna).
female(olivia).

parent(john, bob).
parent(john, lisa).
parent(bob, tom).
parent(bob, sarah).
parent(lisa, jack).
parent(lisa, emily).
parent(tom, anna).
parent(sarah, olivia).
parent(anna, michael).

% Rules to define different relationships
father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
