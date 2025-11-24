% indicates comments
% discontiguous/1 : allows predicates to be defined in multiple places
% /1 indicates arity (number of arguments)
% queries are constructed independently
% conditional: not(X), Y (conditional) -: 'X implies Y'

% Facts, predicates need to be contiguous unless declared discontiguous
age(john, 30).
age(mary, 25).
age(susan, 30).

bmi(susan, 22).

family_history(john, yes).
family_history(susan, no).

% ';' indicates OR, ',' indicates AND
% Rules for diabetes risk assessment

high_risk_age(Person) :-
    age(Person, Age),
    Age > 50.

high_bmi(Person) :-
    bmi(Person, Bmi),
    Bmi >= 25.

family_history_risk(Person) :-
    family_history(Person, yes).

at_risk_diabetes(Person) :-
    (high_risk_age(Person);
        high_bmi(Person);
        family_history_risk(Person)),
        write(Person), write(' is at risk for diabetes.'), nl.

% Family relations
father(john, mike).
father(mike, tom).

% Rules
grandfather(X, Y) :-
    father(X, Z),
    father(Z, Y). % X is grandfather of Y

male(X) :-
    father(X, _).

% Query
% singleton variables can be ignored with '_', or named with '_{uppercase letter}'
?- grandfather(X, tom), male(X).
% prints X = john.

?- grandfather(john, tom). % is john the grandfather of tom?