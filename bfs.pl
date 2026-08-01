edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
edge(d,f).
edge(e,g).

best_first(X,Y):-
    edge(X,Y).