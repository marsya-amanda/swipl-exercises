% Goal: represent a DFA, and check if it accepts a given string.

:- module(simple_dfa, [accepts/2]).

% Represent a DFA which accepts even length
transition(q0, a, q1).
transition(q0, b, q1).
transition(q1, a, q0).
transition(q1, b, q0).
final_state(q0).
start_state(q0).

% implement
accepts(String) :-
    start_state(S),
    run(S, String). % S binds to q0

% define base case: empty string, true if in final state
run(State, [], State) :- final_state(State).

% define recursive case: non-empty string, find out next state and recurse on rest
run(State, [Top|Rest], FinalState) :-
    transition(State, Top, NextState),
    run(NextState, Rest, FinalState). % [Top|Rest] : Top binds to head element, Rest binds to tail list
