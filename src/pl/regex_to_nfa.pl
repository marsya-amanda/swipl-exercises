% regex representation using DCG

% -------
% DCG: definite clause grammar
% made up of: terminal, nonterminal, grammar goals
% terminal is list made up of elements it contains
% nonterminal is element the DCG describes
% grammar goal is rule that describes how nonterminal can be formed, indicated by { Goal }.
% nonterminal indicator A//n of arity n, different to predicate indicator A/n of arity n.

% -------
% regex representation using DCG
% [X] represent a literal, X represent a nonterminal

star(X) --> []. % rule 1: star of X can be empty list
star(X) --> X, star(X). % terminal [X], nonterminal (',')//2 meaning 'and then'. ie. star of X can be X followed by star of X

plus(X) --> X, star(X). % plus of X is X followed by star of X

concat(X, Y) --> X, Y. % match X, then match Y. use nonterminals as not always concatenating atoms

union(X, Y) --> X | Y. % match X or match Y

% query by doing
% ?- phrase(star(a), [a, a, a]).

% x --> [a, a].
% y --> [b].
% ?- phrase(concat(x, y), [a, a, b])

% --------------- REGEX NFA CONVERSION -------------------
