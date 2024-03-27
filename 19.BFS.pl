% best_first_search(Start, Goal, Path)
best_first_search(Start, Goal, Path) :-
    best_first_search([node(Start, [], 0)], Goal, Path).

% If the current node is the goal, return its path
best_first_search([node(State, Path, _)|_], State, Path).

% Otherwise, expand the current node
best_first_search([node(State, Path, _)|Queue], Goal, FinalPath) :-
    findall(node(NextState, [NextState|Path], Cost), 
            (   move(State, NextState, Cost),
                \+ member(NextState, Path) % avoid cycles
            ),
            Children),
    append(Queue, Children, NewQueue),
    sort_queue(NewQueue, SortedQueue),
    best_first_search(SortedQueue, Goal, FinalPath).

% move(State, NextState, Cost)
% Define how to move from one state to another and the associated cost
% This predicate needs to be implemented according to the problem domain

% Sort the queue based on the heuristic function
sort_queue(Queue, SortedQueue) :-
    predsort(compare, Queue, SortedQueue).

% Compare predicate for sorting based on heuristic function
compare(Result, node(_, _, Cost1), node(_, _, Cost2)) :-
    Cost1 =< Cost2, Result = (<).
compare(Result, _, _) :-
    Result = (>).
