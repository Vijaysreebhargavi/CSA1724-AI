% Define inference rules
% Rule: If A and B, then C.
rule(antibiotics, fever, 'Prescribe antibiotics for bacterial infections.').
rule(rest, flu, 'Recommend rest and hydration for flu.').
rule(antipyretics, fever, 'Recommend antipyretic medications to reduce fever.').
rule(visit_doctor, unknown, 'Visit a doctor for proper diagnosis.').
% Add more rules as needed.

% Forward chaining algorithm
forward_chain(KnownFacts, Goal, Conclusion) :-
    member(Goal, KnownFacts),  % Goal is already known
    Conclusion = Goal.

forward_chain(KnownFacts, Goal, Conclusion) :-
    rule(Condition, Goal, ConclusionText),  % Check if there's a rule that can derive Goal
    satisfied(Condition, KnownFacts),  % Check if the condition of the rule is satisfied by known facts
    \+ member(Conclusion, KnownFacts),  % Make sure the conclusion is not already known
    forward_chain([Conclusion|KnownFacts], Condition, Conclusion).  % Recursively continue forward chaining

% Check if all conditions in the rule are satisfied by known facts
satisfied([], _).
satisfied([H|T], KnownFacts) :-
    member(H, KnownFacts),
    satisfied(T, KnownFacts).

% Entry point for forward chaining
start_forward_chaining :-
    write('Enter the known facts separated by commas: '), nl,
    read(KnownFacts),
    write('Enter the goal: '), nl,
    read(Goal),
    forward_chain(KnownFacts, Goal, Conclusion),
    format('Conclusion: ~w~n', [Conclusion]).

% Example usage:
% start_forward_chaining.
