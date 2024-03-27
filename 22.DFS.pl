% Define the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, h).
edge(e, i).

% depth_first_search(Start, Goal, Path)
depth_first_search(Start, Goal, Path) :-
    depth_first_search(Start, Goal, [Start], Path).

% Base case: if the current node is the goal, return the path
depth_first_search(Node, Node, _, [Node]).

% Recursive case: explore neighboring nodes
depth_first_search(Node, Goal, Visited, [Node|Path]) :-
    edge(Node, Next),
    \+ member(Next, Visited), % avoid revisiting visited nodes
    depth_first_search(Next, Goal, [Next|Visited], Path).

% Entry point for depth-first search
start_dfs(Start, Goal) :-
    depth_first_search(Start, Goal, Path),
    write('Path found: '), write(Path), nl.

% Example usage:
% start_dfs(a, i).
