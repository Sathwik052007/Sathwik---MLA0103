% Facts
man(marcus).
roman(marcus).
ruler(caesar).
loyal_to(marcus, caesar).

% Rule: Every man is a person
person(X) :-
    man(X).

% Rule: A person tries to assassinate a ruler
% only if the person is not loyal to the ruler
try_assassinate(X, Y) :-
    person(X),
    ruler(Y),
    \+ loyal_to(X, Y).