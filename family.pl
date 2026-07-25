parent(john, mary).
parent(mary, sam).
parent(john, alice).

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).