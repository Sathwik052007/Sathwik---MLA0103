male(john).
male(bob).
male(tom).

female(mary).
female(alice).
female(lisa).

parent(john,bob).
parent(mary,bob).

parent(john,alice).
parent(mary,alice).

parent(bob,tom).
parent(lisa,tom).

father(X,Y):-
    male(X),
    parent(X,Y).

mother(X,Y):-
    female(X),
    parent(X,Y).

grandfather(X,Y):-
    male(X),
    parent(X,Z),
    parent(Z,Y).

grandmother(X,Y):-
    female(X),
    parent(X,Z),
    parent(Z,Y).

brother(X,Y):-
    male(X),
    parent(P,X),
    parent(P,Y),
    X\=Y.

sister(X,Y):-
    female(X),
    parent(P,X),
    parent(P,Y),
    X\=Y.