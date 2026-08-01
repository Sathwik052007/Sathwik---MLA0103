fact(a).

rule(b) :-
    fact(a).

rule(c) :-
    rule(b).

rule(d) :-
    rule(c).