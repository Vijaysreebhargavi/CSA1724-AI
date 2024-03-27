% Define diet suggestions for different diseases
diet_suggestion(flu, 'Consume plenty of fluids like water, fruit juices, and soups. Eat light and easily digestible foods such as rice, bananas, and applesauce. Avoid fatty, greasy, and spicy foods.').
diet_suggestion(cold, 'Drink warm fluids like herbal tea and broths. Consume foods rich in vitamin C, such as oranges, strawberries, and bell peppers. Avoid dairy products and sugary foods.').
diet_suggestion(pneumonia, 'Consume plenty of fluids to stay hydrated. Eat nutrient-rich foods such as lean protein, whole grains, fruits, and vegetables. Avoid foods that are difficult to digest, such as fried and processed foods.').
diet_suggestion(_, 'Please consult a healthcare professional for personalized dietary advice.'). % Default suggestion

% Predicate to suggest a diet based on a specified disease
suggest_diet(Disease, DietSuggestion) :-
    diet_suggestion(Disease, DietSuggestion), !.

% Entry point for diet suggestion
start_diet_suggestion :-
    write('Enter the disease for diet suggestion: '), nl,
    read(Disease),
    suggest_diet(Disease, Diet),
    format('Diet Suggestion for ~w: ~n~w~n', [Disease, Diet]).

% Example usage:
% start_diet_suggestion.
