% ==========================================
% HEALTHCARE DIAGNOSIS EXPERT SYSTEM
% ==========================================

% ----------- KNOWLEDGE BASE -----------

% Patient 1 - Flu
symptom(patient1, fever).
symptom(patient1, cough).
symptom(patient1, body_pain).

% Patient 2 - Pneumonia
symptom(patient2, fever).
symptom(patient2, cough).
symptom(patient2, breathing_difficulty).

% Patient 3 - Viral Infection
symptom(patient3, fever).
symptom(patient3, fatigue).
symptom(patient3, body_pain).

% Patient 4 - Respiratory Infection
symptom(patient4, cough).
symptom(patient4, fatigue).
symptom(patient4, breathing_difficulty).


% ----------- PRODUCTION RULES -----------

% Rule 1: Flu
flu(Patient) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, body_pain).


% Rule 2: Pneumonia
pneumonia(Patient) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, breathing_difficulty).


% Rule 3: Viral Infection
viral_infection(Patient) :-
    symptom(Patient, fever),
    symptom(Patient, fatigue),
    symptom(Patient, body_pain).


% Rule 4: Respiratory Infection
respiratory_infection(Patient) :-
    symptom(Patient, cough),
    symptom(Patient, fatigue),
    symptom(Patient, breathing_difficulty).


% ----------- DIAGNOSIS -----------

diagnosis(Patient, flu) :-
    flu(Patient).

diagnosis(Patient, pneumonia) :-
    pneumonia(Patient).

diagnosis(Patient, viral_infection) :-
    viral_infection(Patient).

diagnosis(Patient, respiratory_infection) :-
    respiratory_infection(Patient).


% ----------- RECOMMENDATION -----------

recommendation(flu,
    'Take adequate rest and consult a healthcare professional').

recommendation(pneumonia,
    'Seek medical evaluation promptly').

recommendation(viral_infection,
    'Take rest, maintain hydration and consult a healthcare professional').

recommendation(respiratory_infection,
    'Seek medical evaluation for breathing-related symptoms').


% ----------- COMPLETE DIAGNOSIS -----------

diagnose(Patient) :-

    nl,
    writeln('=========================================='),
    writeln('       HEALTHCARE DIAGNOSIS SYSTEM'),
    writeln('=========================================='),

    format('Patient: ~w~n', [Patient]),

    nl,
    writeln('Observed Symptoms:'),
    show_symptoms(Patient),

    nl,
    writeln('Possible Diagnosis:'),
    show_diagnosis(Patient),

    nl,
    writeln('==========================================').


% ----------- SHOW SYMPTOMS -----------

show_symptoms(Patient) :-

    forall(
        symptom(Patient, Symptom),
        format('- ~w~n', [Symptom])
    ).


% ----------- SHOW DIAGNOSIS -----------

show_diagnosis(Patient) :-

    diagnosis(Patient, Disease),

    format('Disease: ~w~n', [Disease]),

    recommendation(
        Disease,
        Advice
    ),

    format('Recommendation: ~w~n', [Advice]).


% ----------- FORWARD CHAINING -----------

forward_chaining(Patient) :-

    nl,
    writeln('=========================================='),
    writeln('          FORWARD CHAINING'),
    writeln('=========================================='),

    format('Patient: ~w~n', [Patient]),

    nl,
    writeln('Starting with known symptoms...'),

    show_symptoms(Patient),

    nl,
    writeln('Applying production rules...'),

    forward_result(Patient),

    writeln('==========================================').


forward_result(Patient) :-

    flu(Patient),
    !,

    writeln('Rule Matched: Flu'),
    writeln('Conclusion: Possible Flu').


forward_result(Patient) :-

    pneumonia(Patient),
    !,

    writeln('Rule Matched: Pneumonia'),
    writeln('Conclusion: Possible Pneumonia').


forward_result(Patient) :-

    viral_infection(Patient),
    !,

    writeln('Rule Matched: Viral Infection'),
    writeln('Conclusion: Possible Viral Infection').


forward_result(Patient) :-

    respiratory_infection(Patient),
    !,

    writeln('Rule Matched: Respiratory Infection'),
    writeln('Conclusion: Possible Respiratory Infection').


forward_result(_) :-

    writeln('No matching disease found.').


% ----------- BACKWARD CHAINING -----------

backward_chaining(Patient) :-

    nl,
    writeln('=========================================='),
    writeln('          BACKWARD CHAINING'),
    writeln('=========================================='),

    format('Patient: ~w~n', [Patient]),

    nl,
    writeln('Checking possible diseases...'),

    check_disease(
        'Flu',
        flu(Patient)
    ),

    check_disease(
        'Pneumonia',
        pneumonia(Patient)
    ),

    check_disease(
        'Viral Infection',
        viral_infection(Patient)
    ),

    check_disease(
        'Respiratory Infection',
        respiratory_infection(Patient)
    ),

    writeln('==========================================').


check_disease(Name, Goal) :-

    (
        call(Goal)
        ->
        format('Goal: ~w -> TRUE~n', [Name])
        ;
        format('Goal: ~w -> FALSE~n', [Name])
    ).


% ----------- UNIFICATION -----------

show_unification :-

    nl,
    writeln('=========================================='),
    writeln('             UNIFICATION'),
    writeln('=========================================='),

    writeln('Query: flu(Patient).'),

    flu(Patient),

    format('Patient unified with: ~w~n', [Patient]),

    writeln('==========================================').


% ----------- LIST PATIENTS -----------

list_patients :-

    nl,
    writeln('=========================================='),
    writeln('       PATIENTS IN KNOWLEDGE BASE'),
    writeln('=========================================='),

    setof(
        Patient,
        Symptom^symptom(Patient, Symptom),
        Patients
    ),

    print_patients(Patients),

    writeln('==========================================').


print_patients([]).

print_patients([Patient|Rest]) :-

    format('- ~w~n', [Patient]),

    print_patients(Rest).


% ----------- TEST CASES -----------

test_case(1) :-

    writeln(''),
    writeln('========== TEST CASE 1 =========='),
    diagnose(patient1).


test_case(2) :-

    writeln(''),
    writeln('========== TEST CASE 2 =========='),
    diagnose(patient2).


test_case(3) :-

    writeln(''),
    writeln('========== TEST CASE 3 =========='),
    diagnose(patient3).


test_case(4) :-

    writeln(''),
    writeln('========== TEST CASE 4 =========='),
    diagnose(patient4).


% ----------- RUN ALL TESTS -----------

run_tests :-

    writeln(''),
    writeln('=========================================='),
    writeln('       HEALTHCARE SYSTEM TESTING'),
    writeln('=========================================='),

    test_case(1),
    test_case(2),
    test_case(3),
    test_case(4),

    writeln(''),
    writeln('=========================================='),
    writeln('        ALL TEST CASES COMPLETED'),
    writeln('==========================================').