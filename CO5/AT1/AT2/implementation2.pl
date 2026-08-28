% ============================================================
% AUTOMOBILE FAULT DIAGNOSIS EXPERT SYSTEM
% Assessment Tool 2 - Industry Problem-Based Assignment
% Course: Artificial Intelligence and Expert Systems
% Tool: SWI-Prolog
% ============================================================


% ============================================================
% 1. KNOWLEDGE BASE - VEHICLE SYMPTOMS
% ============================================================

% Car 1 - Starting / Battery Problem
symptom(car1, slow_cranking).
symptom(car1, dim_headlights).
symptom(car1, starting_problem).


% Car 2 - Alternator Problem
symptom(car2, battery_warning_light).
symptom(car2, dim_headlights).


% Car 3 - Cooling System Problem
symptom(car3, high_engine_temperature).
symptom(car3, low_coolant).


% Car 4 - Engine Misfire
symptom(car4, rough_idle).
symptom(car4, abnormal_vibration).
symptom(car4, reduced_engine_power).


% Car 5 - Fuel System Problem
symptom(car5, low_mileage).
symptom(car5, poor_acceleration).


% Car 6 - Brake System Problem
symptom(car6, brake_noise).
symptom(car6, reduced_braking).


% Car 7 - Engine Mechanical Problem
symptom(car7, abnormal_engine_noise).
symptom(car7, knocking_sound).


% Car 8 - Wheel Alignment Problem
symptom(car8, vehicle_pulls_side).
symptom(car8, steering_vibration).


% ============================================================
% 2. PRODUCTION RULES
% ============================================================


% Rule 1: Weak Battery
% IF slow cranking AND dim headlights AND starting problem
% THEN weak battery

weak_battery(Car) :-
    symptom(Car, slow_cranking),
    symptom(Car, dim_headlights),
    symptom(Car, starting_problem).


% Rule 2: Alternator Fault
% IF battery warning light AND dim headlights
% THEN alternator fault

alternator_fault(Car) :-
    symptom(Car, battery_warning_light),
    symptom(Car, dim_headlights).


% Rule 3: Cooling System Fault
% IF high engine temperature AND low coolant
% THEN cooling fault

cooling_fault(Car) :-
    symptom(Car, high_engine_temperature),
    symptom(Car, low_coolant).


% Rule 4: Engine Misfire
% IF rough idle AND abnormal vibration AND reduced engine power
% THEN engine misfire

engine_misfire(Car) :-
    symptom(Car, rough_idle),
    symptom(Car, abnormal_vibration),
    symptom(Car, reduced_engine_power).


% Rule 5: Fuel System Fault
% IF low mileage AND poor acceleration
% THEN fuel system fault

fuel_system_fault(Car) :-
    symptom(Car, low_mileage),
    symptom(Car, poor_acceleration).


% Rule 6: Brake System Fault
% IF brake noise AND reduced braking
% THEN brake fault

brake_fault(Car) :-
    symptom(Car, brake_noise),
    symptom(Car, reduced_braking).


% Rule 7: Engine Mechanical Fault
% IF abnormal engine noise AND knocking sound
% THEN engine mechanical fault

engine_mechanical_fault(Car) :-
    symptom(Car, abnormal_engine_noise),
    symptom(Car, knocking_sound).


% Rule 8: Wheel Alignment Fault
% IF vehicle pulls to side AND steering vibration
% THEN alignment fault

alignment_fault(Car) :-
    symptom(Car, vehicle_pulls_side),
    symptom(Car, steering_vibration).


% ============================================================
% 3. DIAGNOSTIC ACTIONS
% ============================================================


diagnostic_action(
    Car,
    weak_battery,
    'Check battery voltage and battery terminals'
) :-
    weak_battery(Car).


diagnostic_action(
    Car,
    alternator_fault,
    'Check alternator output and charging voltage'
) :-
    alternator_fault(Car).


diagnostic_action(
    Car,
    cooling_fault,
    'Check coolant level, radiator and cooling system'
) :-
    cooling_fault(Car).


diagnostic_action(
    Car,
    engine_misfire,
    'Inspect spark plugs, ignition system and engine'
) :-
    engine_misfire(Car).


diagnostic_action(
    Car,
    fuel_system_fault,
    'Inspect fuel filter, fuel pump and injectors'
) :-
    fuel_system_fault(Car).


diagnostic_action(
    Car,
    brake_fault,
    'Inspect brake pads, discs and brake system'
) :-
    brake_fault(Car).


diagnostic_action(
    Car,
    engine_mechanical_fault,
    'Inspect engine components for mechanical damage'
) :-
    engine_mechanical_fault(Car).


diagnostic_action(
    Car,
    alignment_fault,
    'Check tires and wheel alignment'
) :-
    alignment_fault(Car).


% ============================================================
% 4. FORWARD CHAINING
% ============================================================

forward_chaining(Car) :-

    nl,
    writeln('=============================================='),
    writeln('              FORWARD CHAINING'),
    writeln('=============================================='),

    format('Vehicle: ~w~n', [Car]),

    nl,
    writeln('Known Symptoms:'),

    show_symptoms(Car),

    nl,
    writeln('Reasoning:'),

    forward_diagnosis(Car),

    writeln('==============================================').


% Forward diagnosis rules

forward_diagnosis(Car) :-

    weak_battery(Car),
    !,

    writeln('Rule Matched: Weak Battery'),
    writeln('Conclusion: Probable Weak Battery'),
    writeln('Action: Check battery voltage and terminals').


forward_diagnosis(Car) :-

    alternator_fault(Car),
    !,

    writeln('Rule Matched: Alternator Fault'),
    writeln('Conclusion: Probable Alternator Fault'),
    writeln('Action: Check alternator charging voltage').


forward_diagnosis(Car) :-

    cooling_fault(Car),
    !,

    writeln('Rule Matched: Cooling System Fault'),
    writeln('Conclusion: Probable Cooling System Fault'),
    writeln('Action: Check coolant level and radiator').


forward_diagnosis(Car) :-

    engine_misfire(Car),
    !,

    writeln('Rule Matched: Engine Misfire'),
    writeln('Conclusion: Probable Engine Misfire'),
    writeln('Action: Inspect spark plugs and ignition system').


forward_diagnosis(Car) :-

    fuel_system_fault(Car),
    !,

    writeln('Rule Matched: Fuel System Fault'),
    writeln('Conclusion: Probable Fuel System Fault'),
    writeln('Action: Inspect fuel system').


forward_diagnosis(Car) :-

    brake_fault(Car),
    !,

    writeln('Rule Matched: Brake Fault'),
    writeln('Conclusion: Probable Brake System Fault'),
    writeln('Action: Inspect brake components').


forward_diagnosis(Car) :-

    engine_mechanical_fault(Car),
    !,

    writeln('Rule Matched: Engine Mechanical Fault'),
    writeln('Conclusion: Probable Engine Mechanical Fault'),
    writeln('Action: Inspect engine components').


forward_diagnosis(Car) :-

    alignment_fault(Car),
    !,

    writeln('Rule Matched: Wheel Alignment Fault'),
    writeln('Conclusion: Probable Wheel Alignment Fault'),
    writeln('Action: Check tires and wheel alignment').


forward_diagnosis(_) :-

    writeln('No matching fault was found.').


% ============================================================
% 5. BACKWARD CHAINING
% ============================================================

backward_chaining(Car) :-

    nl,
    writeln('=============================================='),
    writeln('              BACKWARD CHAINING'),
    writeln('=============================================='),

    format('Vehicle: ~w~n', [Car]),

    nl,
    writeln('Checking possible faults...'),

    check_fault(
        'Weak Battery',
        weak_battery(Car)
    ),

    check_fault(
        'Alternator Fault',
        alternator_fault(Car)
    ),

    check_fault(
        'Cooling System Fault',
        cooling_fault(Car)
    ),

    check_fault(
        'Engine Misfire',
        engine_misfire(Car)
    ),

    check_fault(
        'Fuel System Fault',
        fuel_system_fault(Car)
    ),

    check_fault(
        'Brake System Fault',
        brake_fault(Car)
    ),

    check_fault(
        'Engine Mechanical Fault',
        engine_mechanical_fault(Car)
    ),

    check_fault(
        'Wheel Alignment Fault',
        alignment_fault(Car)
    ),

    writeln('==============================================').


check_fault(FaultName, Goal) :-

    (
        call(Goal)
        ->
        format('Goal: ~w -> TRUE~n', [FaultName])
        ;
        format('Goal: ~w -> FALSE~n', [FaultName])
    ).


% ============================================================
% 6. UNIFICATION DEMONSTRATION
% ============================================================

show_unification :-

    nl,
    writeln('=============================================='),
    writeln('             UNIFICATION'),
    writeln('=============================================='),

    writeln('Query: weak_battery(Car).'),

    weak_battery(Car),

    format('Car unified with: ~w~n', [Car]),

    writeln('==============================================').


% ============================================================
% 7. BACKTRACKING DEMONSTRATION
% ============================================================

show_all_weak_battery_cars :-

    nl,
    writeln('=============================================='),
    writeln('             BACKTRACKING'),
    writeln('=============================================='),

    writeln('Query: weak_battery(Car).'),
    writeln('Use ; in the Prolog console for another solution.'),

    weak_battery(Car),

    format('Solution: Car = ~w~n', [Car]),

    fail.

show_all_weak_battery_cars.


% ============================================================
% 8. SHOW ALL SYMPTOMS
% ============================================================

show_symptoms(Car) :-

    forall(
        symptom(Car, Symptom),
        format('- ~w~n', [Symptom])
    ).


% ============================================================
% 9. COMPLETE DIAGNOSIS
% ============================================================

diagnose(Car) :-

    vehicle_exists(Car),

    nl,
    writeln('**********************************************'),
    writeln('       AUTOMOBILE FAULT DIAGNOSIS SYSTEM'),
    writeln('**********************************************'),

    format('Vehicle: ~w~n', [Car]),

    nl,
    writeln('OBSERVED SYMPTOMS'),
    writeln('-----------------'),

    show_symptoms(Car),

    nl,
    writeln('DIAGNOSIS'),
    writeln('---------'),

    show_diagnosis(Car),

    nl,
    writeln('**********************************************').


show_diagnosis(Car) :-

    diagnostic_action(Car, Fault, Action),

    format('Probable Fault    : ~w~n', [Fault]),
    format('Diagnostic Action : ~w~n', [Action]).


show_diagnosis(Car) :-

    \+ diagnostic_action(Car, _, _),

    writeln('No probable fault identified.').


% ============================================================
% 10. VEHICLE VALIDATION
% ============================================================

vehicle_exists(Car) :-

    symptom(Car, _),

    !.


vehicle_exists(Car) :-

    format(
        'Vehicle "~w" is not available in the knowledge base.~n',
        [Car]
    ),

    fail.


% ============================================================
% 11. EXPLANATION FACILITY
% ============================================================

explain(Car) :-

    nl,
    writeln('=============================================='),
    writeln('             DIAGNOSTIC EXPLANATION'),
    writeln('=============================================='),

    explain_fault(Car),

    writeln('==============================================').


explain_fault(Car) :-

    weak_battery(Car),
    !,

    writeln('Reason: Slow cranking, dim headlights and'),
    writeln('starting problem indicate a possible weak battery.'),
    writeln('Recommended action: Check battery voltage.').


explain_fault(Car) :-

    alternator_fault(Car),
    !,

    writeln('Reason: Battery warning light and dim headlights'),
    writeln('indicate a possible alternator fault.'),
    writeln('Recommended action: Check charging voltage.').


explain_fault(Car) :-

    cooling_fault(Car),
    !,

    writeln('Reason: High engine temperature and low coolant'),
    writeln('indicate a possible cooling-system fault.'),
    writeln('Recommended action: Check coolant and radiator.').


explain_fault(Car) :-

    engine_misfire(Car),
    !,

    writeln('Reason: Rough idle, vibration and reduced engine'),
    writeln('power indicate a possible engine misfire.'),
    writeln('Recommended action: Inspect spark plugs and ignition.').


explain_fault(Car) :-

    fuel_system_fault(Car),
    !,

    writeln('Reason: Low mileage and poor acceleration'),
    writeln('indicate a possible fuel-system fault.'),
    writeln('Recommended action: Inspect the fuel system.').


explain_fault(Car) :-

    brake_fault(Car),
    !,

    writeln('Reason: Brake noise and reduced braking'),
    writeln('indicate a possible brake-system fault.'),
    writeln('Recommended action: Inspect brake components.').


explain_fault(Car) :-

    engine_mechanical_fault(Car),
    !,

    writeln('Reason: Abnormal engine noise and knocking'),
    writeln('indicate a possible mechanical fault.'),
    writeln('Recommended action: Inspect engine components.').


explain_fault(Car) :-

    alignment_fault(Car),
    !,

    writeln('Reason: Vehicle pulling to one side and steering'),
    writeln('vibration indicate a possible alignment fault.'),
    writeln('Recommended action: Check tires and alignment.').


explain_fault(_) :-

    writeln('No explanation available because no fault was identified.').


% ============================================================
% 12. COMPLETE EXPERT SYSTEM
% ============================================================

expert_system(Car) :-

    vehicle_exists(Car),

    nl,
    writeln('################################################'),
    writeln('       AUTOMOBILE EXPERT SYSTEM'),
    writeln('################################################'),

    format('Vehicle under diagnosis: ~w~n', [Car]),

    nl,
    writeln('STEP 1 - OBSERVED SYMPTOMS'),
    writeln('---------------------------'),

    show_symptoms(Car),

    nl,
    writeln('STEP 2 - FORWARD CHAINING'),
    writeln('-------------------------'),

    forward_diagnosis(Car),

    nl,
    writeln('STEP 3 - BACKWARD CHAINING'),
    writeln('--------------------------'),

    backward_chaining(Car),

    nl,
    writeln('STEP 4 - FINAL DIAGNOSIS'),
    writeln('------------------------'),

    show_diagnosis(Car),

    nl,
    writeln('STEP 5 - EXPLANATION'),
    writeln('--------------------'),

    explain(Car),

    nl,
    writeln('################################################'),
    writeln('              END OF DIAGNOSIS'),
    writeln('################################################').


% ============================================================
% 13. INDUSTRY TEST CASES
% ============================================================

test_case(1) :-

    nl,
    writeln('=============================================='),
    writeln('TEST CASE 1 - BATTERY PROBLEM'),
    writeln('=============================================='),

    diagnose(car1).


test_case(2) :-

    nl,
    writeln('=============================================='),
    writeln('TEST CASE 2 - ALTERNATOR PROBLEM'),
    writeln('=============================================='),

    diagnose(car2).


test_case(3) :-

    nl,
    writeln('=============================================='),
    writeln('TEST CASE 3 - COOLING SYSTEM PROBLEM'),
    writeln('=============================================='),

    diagnose(car3).


test_case(4) :-

    nl,
    writeln('=============================================='),
    writeln('TEST CASE 4 - ENGINE MISFIRE'),
    writeln('=============================================='),

    diagnose(car4).


test_case(5) :-

    nl,
    writeln('=============================================='),
    writeln('TEST CASE 5 - FUEL SYSTEM PROBLEM'),
    writeln('=============================================='),

    diagnose(car5).


% ============================================================
% 14. RUN ALL FIVE TEST CASES
% ============================================================

run_tests :-

    nl,
    writeln('################################################'),
    writeln('       AUTOMOBILE EXPERT SYSTEM TESTING'),
    writeln('################################################'),

    test_case(1),
    test_case(2),
    test_case(3),
    test_case(4),
    test_case(5),

    nl,
    writeln('################################################'),
    writeln('          ALL TEST CASES COMPLETED'),
    writeln('################################################').


% ============================================================
% 15. SHOW ALL VEHICLES
% ============================================================

list_vehicles :-

    nl,
    writeln('=============================================='),
    writeln('          VEHICLES IN KNOWLEDGE BASE'),
    writeln('=============================================='),

    setof(
        Car,
        Symptom^symptom(Car, Symptom),
        Cars
    ),

    print_vehicles(Cars),

    writeln('==============================================').


print_vehicles([]).


print_vehicles([Car|Rest]) :-

    format('- ~w~n', [Car]),

    print_vehicles(Rest).


% ============================================================
% END OF AUTOMOBILE EXPERT SYSTEM
% ============================================================