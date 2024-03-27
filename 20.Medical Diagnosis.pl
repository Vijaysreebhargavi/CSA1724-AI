% Define diseases and their symptoms
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, fatigue).
symptom(cold, runny_nose).
symptom(cold, sneezing).
symptom(cold, sore_throat).
symptom(pneumonia, high_fever).
symptom(pneumonia, cough).
symptom(pneumonia, difficulty_breathing).

% Rules for diagnosing diseases based on symptoms
diagnose_disease(Symptoms, Disease) :-
    findall(D, (symptom(D, S), member(S, Symptoms)), Diseases),
    list_to_set(Diseases, UniqueDiseases),
    member(Disease, UniqueDiseases).

% Entry point for diagnosis
start_diagnosis :-
    write('Enter symptoms separated by commas: '), nl,
    read(Symptoms),
    diagnose_disease(Symptoms, Disease),
    format('You may have ~w.~n', [Disease]).

% Example usage:
% start_diagnosis.
