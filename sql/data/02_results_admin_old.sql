--
-- Tables-first install
--
-- This inserts all the data we need for running the results admin, then tinkers with language keys to get everything sorted
--
-- The newer json-first install files should work fine, but just in case, this should be our fallback
--

INSERT INTO benefits (code, name, abbreviation, sort_order) VALUES
('ffcra', 'Families First Coronavirus Response Act', 'FFCRA', 0),
('nys', 'New York State Sick Leave, Paid Family Leave, and Disability Benefits', 'NYS Sick, PFL, and DB', 1),
('pssl', 'New York City Paid Safe and Sick Leave', 'NYC PSSL', 2),
('dwbor', 'New York State Domestic Worker Bill of Rights', 'NYS DWBoR', 3),
('cares', 'Coronavirus Aid, Relief, and Economic Security Act: Unemployment Insurance Benefits', 'CARES Act: UI Benefits', 4);

INSERT INTO conditions (benefit_id, name, key_name, build_function, options, sort_order) VALUES
(1, 'Employee Type', 'type', 'splitTypeByEssential', '[{"letter":"N","answer":"NANNY, HOUSE CLEANER, or HOME ATTENDANT"},{"letter":"E","answer":"HOME HEALTH CARE WORKER"}]', 0),
(1, 'Agency?', 'agency', 'simple', '[{"letter":"A","answer":"YES"},{"letter":"B","answer":"NO"}]', 1),
(1, 'On the Books?', 'books', 'splitBooksByTaxes', '[{"letter":"Y","answer":"YES (EITHER)"},{"letter":"N","answer":"NO"}]', 2),
(1, 'Reason', 'reason', 'findReasonForFFCRA', '[{"letter":"B","answer":"SELF-QUARANTINE AND SCHOOL CLOSED"},{"letter":"Q","answer":"SELF-QUARANTINE"},{"letter":"S","answer":"SCHOOL CLOSED"},{"letter":"F","answer":"FAMILY QUARANTINE OR STAY AT HOME"},{"letter":"N","answer":"NONE"}]', 3),
(2, 'Agency?', 'agency', 'simple', '[{"letter":"A","answer":"YES"},{"letter":"B","answer":"NO"}]', 0),
(2, 'On the Books?', 'books', 'splitBooksByCompliance', '[{"answer":"YES, IN COMPLIANCE","letter":"C"},{"answer":"PARTIALLY OR NO","letter":"N"}]', 1),
(2, 'Hours per Week', 'hours per week', 'simple', '[{"answer":"Under 40","letter":"A"},{"answer":"40 or more","letter":"B"}]', 2),
(2, 'Reason', 'reason', 'findReasonForNYS', '[{"answer":"SELF-QUARANTINE OR FAMILY QUARANTINE","letter":"Q"},{"answer":"SCHOOL CLOSED","letter":"S"},{"answer":"NONE","letter":"N"}]', 3),
(3, 'Employee Type', 'type', 'splitTypeByHomeCare', '[{"answer":"NANNY or HOUSE CLEANER","letter":"N"},{"answer":"HOME ATTENDANT or HOME HEALTH CARE WORKER","letter":"H"}]', 0),
(3, 'Agency?', 'agency', 'simple', '[{"letter":"A","answer":"YES"},{"letter":"B","answer":"NO"}]', 1),
(3, 'Employment', 'employed', 'employedByYearAndHours', '[{"answer":"LESS THAN ONE YEAR or UNDER 80","letter":"U"},{"answer":"ONE YEAR OR MORE and OVER 80","letter":"O"}]', 2),
(4, 'Employment', 'length of employment', 'simple', '[{"answer":"LESS THAN ONE YEAR","letter":"U"},{"answer":"ONE YEAR OR MORE","letter":"O"}]', 0),
(5, 'On the Books?', 'books', 'splitBooksByCompliance', '[{"answer":"YES, IN COMPLIANCE","letter":"C"},{"answer":"PARTIALLY OR NO","letter":"N"}]', 0),
(5, 'Employment', 'length of employment', 'splitLengthByMonths', '[{"answer":"LESS THAN SIX MONTHS","letter":"U"},{"answer":"SIX MONTHS OR MORE","letter":"O"}]', 0);

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) VALUES

-- ffcra
(1, '{"type":"N","agency":"A","books":"Y","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_y_reason_b', 'results_benefit_long_ffcra_type_n_agency_a_books_y_reason_b', 0),
(1, '{"type":"N","agency":"A","books":"Y","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_y_reason_q', 'results_benefit_long_ffcra_type_n_agency_a_books_y_reason_q', 1),
(1, '{"type":"N","agency":"A","books":"Y","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_y_reason_s', 'results_benefit_long_ffcra_type_n_agency_a_books_y_reason_s', 2),
(1, '{"type":"N","agency":"A","books":"Y","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_y_reason_f', 'results_benefit_long_ffcra_type_n_agency_a_books_y_reason_f', 3),
(1, '{"type":"N","agency":"A","books":"Y","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_n_agency_a_books_y_reason_n', 'results_benefit_long_ffcra_type_n_agency_a_books_y_reason_n', 4),
(1, '{"type":"N","agency":"A","books":"N","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_n_reason_b', 'results_benefit_long_ffcra_type_n_agency_a_books_n_reason_b', 5),
(1, '{"type":"N","agency":"A","books":"N","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] SELF-QUARANTINE', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_n_reason_q', 'results_benefit_long_ffcra_type_n_agency_a_books_n_reason_q', 6),
(1, '{"type":"N","agency":"A","books":"N","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_n_reason_s', 'results_benefit_long_ffcra_type_n_agency_a_books_n_reason_s', 7),
(1, '{"type":"N","agency":"A","books":"N","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', TRUE, 'results_benefit_short_ffcra_type_n_agency_a_books_n_reason_f', 'results_benefit_long_ffcra_type_n_agency_a_books_n_reason_f', 8),
(1, '{"type":"N","agency":"A","books":"N","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_n_agency_a_books_n_reason_n', 'results_benefit_long_ffcra_type_n_agency_a_books_n_reason_n', 9),
(1, '{"type":"N","agency":"B","books":"Y","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_y_reason_b', 'results_benefit_long_ffcra_type_n_agency_b_books_y_reason_b', 10),
(1, '{"type":"N","agency":"B","books":"Y","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_y_reason_q', 'results_benefit_long_ffcra_type_n_agency_b_books_y_reason_q', 11),
(1, '{"type":"N","agency":"B","books":"Y","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_y_reason_s', 'results_benefit_long_ffcra_type_n_agency_b_books_y_reason_s', 12),
(1, '{"type":"N","agency":"B","books":"Y","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_y_reason_f', 'results_benefit_long_ffcra_type_n_agency_b_books_y_reason_f', 13),
(1, '{"type":"N","agency":"B","books":"Y","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_n_agency_b_books_y_reason_n', 'results_benefit_long_ffcra_type_n_agency_b_books_y_reason_n', 14),
(1, '{"type":"N","agency":"B","books":"N","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_n_reason_b', 'results_benefit_long_ffcra_type_n_agency_b_books_n_reason_b', 15),
(1, '{"type":"N","agency":"B","books":"N","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] SELF-QUARANTINE', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_n_reason_q', 'results_benefit_long_ffcra_type_n_agency_b_books_n_reason_q', 16),
(1, '{"type":"N","agency":"B","books":"N","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_n_reason_s', 'results_benefit_long_ffcra_type_n_agency_b_books_n_reason_s', 17),
(1, '{"type":"N","agency":"B","books":"N","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', TRUE, 'results_benefit_short_ffcra_type_n_agency_b_books_n_reason_f', 'results_benefit_long_ffcra_type_n_agency_b_books_n_reason_f', 18),
(1, '{"type":"N","agency":"B","books":"N","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_n_agency_b_books_n_reason_n', 'results_benefit_long_ffcra_type_n_agency_b_books_n_reason_n', 19),
(1, '{"type":"E","agency":"A","books":"Y","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_y_reason_b', 'results_benefit_long_ffcra_type_e_agency_a_books_y_reason_b', 20),
(1, '{"type":"E","agency":"A","books":"Y","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_y_reason_q', 'results_benefit_long_ffcra_type_e_agency_a_books_y_reason_q', 21),
(1, '{"type":"E","agency":"A","books":"Y","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_y_reason_s', 'results_benefit_long_ffcra_type_e_agency_a_books_y_reason_s', 22),
(1, '{"type":"E","agency":"A","books":"Y","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_y_reason_f', 'results_benefit_long_ffcra_type_e_agency_a_books_y_reason_f', 23),
(1, '{"type":"E","agency":"A","books":"Y","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_y_reason_n', 'results_benefit_long_ffcra_type_e_agency_a_books_y_reason_n', 24),
(1, '{"type":"E","agency":"A","books":"N","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_n_reason_b', 'results_benefit_long_ffcra_type_e_agency_a_books_n_reason_b', 25),
(1, '{"type":"E","agency":"A","books":"N","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] SELF-QUARANTINE', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_n_reason_q', 'results_benefit_long_ffcra_type_e_agency_a_books_n_reason_q', 26),
(1, '{"type":"E","agency":"A","books":"N","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_n_reason_s', 'results_benefit_long_ffcra_type_e_agency_a_books_n_reason_s', 27),
(1, '{"type":"E","agency":"A","books":"N","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_n_reason_f', 'results_benefit_long_ffcra_type_e_agency_a_books_n_reason_f', 28),
(1, '{"type":"E","agency":"A","books":"N","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_e_agency_a_books_n_reason_n', 'results_benefit_long_ffcra_type_e_agency_a_books_n_reason_n', 29),
(1, '{"type":"E","agency":"B","books":"Y","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_y_reason_b', 'results_benefit_long_ffcra_type_e_agency_b_books_y_reason_b', 30),
(1, '{"type":"E","agency":"B","books":"Y","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_y_reason_q', 'results_benefit_long_ffcra_type_e_agency_b_books_y_reason_q', 31),
(1, '{"type":"E","agency":"B","books":"Y","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_y_reason_s', 'results_benefit_long_ffcra_type_e_agency_b_books_y_reason_s', 32),
(1, '{"type":"E","agency":"B","books":"Y","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_y_reason_f', 'results_benefit_long_ffcra_type_e_agency_b_books_y_reason_f', 33),
(1, '{"type":"E","agency":"B","books":"Y","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_y_reason_n', 'results_benefit_long_ffcra_type_e_agency_b_books_y_reason_n', 34),
(1, '{"type":"E","agency":"B","books":"N","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_n_reason_b', 'results_benefit_long_ffcra_type_e_agency_b_books_n_reason_b', 35),
(1, '{"type":"E","agency":"B","books":"N","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] SELF-QUARANTINE', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_n_reason_q', 'results_benefit_long_ffcra_type_e_agency_b_books_n_reason_q', 36),
(1, '{"type":"E","agency":"B","books":"N","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_n_reason_s', 'results_benefit_long_ffcra_type_e_agency_b_books_n_reason_s', 37),
(1, '{"type":"E","agency":"B","books":"N","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_n_reason_f', 'results_benefit_long_ffcra_type_e_agency_b_books_n_reason_f', 38),
(1, '{"type":"E","agency":"B","books":"N","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] NONE', FALSE, 'results_benefit_short_ffcra_type_e_agency_b_books_n_reason_n', 'results_benefit_long_ffcra_type_e_agency_b_books_n_reason_n', 39),

-- nys
(2, '{"agency":"A","books":"C","hours per week":"A","reason":"Q"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_a_books_c_hours_per_week_a_reason_q', 'results_benefit_long_nys_agency_a_books_c_hours_per_week_a_reason_q', 0),
(2, '{"agency":"A","books":"C","hours per week":"A","reason":"S"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_nys_agency_a_books_c_hours_per_week_a_reason_s', 'results_benefit_long_nys_agency_a_books_c_hours_per_week_a_reason_s', 1),
(2, '{"agency":"A","books":"C","hours per week":"A","reason":"N"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] NONE', FALSE, 'results_benefit_short_nys_agency_a_books_c_hours_per_week_a_reason_n', 'results_benefit_long_nys_agency_a_books_c_hours_per_week_a_reason_n', 2),
(2, '{"agency":"A","books":"C","hours per week":"B","reason":"Q"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_a_books_c_hours_per_week_b_reason_q', 'results_benefit_long_nys_agency_a_books_c_hours_per_week_b_reason_q', 3),
(2, '{"agency":"A","books":"C","hours per week":"B","reason":"S"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_nys_agency_a_books_c_hours_per_week_b_reason_s', 'results_benefit_long_nys_agency_a_books_c_hours_per_week_b_reason_s', 4),
(2, '{"agency":"A","books":"C","hours per week":"B","reason":"N"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] NONE', TRUE, 'results_benefit_short_nys_agency_a_books_c_hours_per_week_b_reason_n', 'results_benefit_long_nys_agency_a_books_c_hours_per_week_b_reason_n', 5),
(2, '{"agency":"A","books":"N","hours per week":"A","reason":"Q"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_a_books_n_hours_per_week_a_reason_q', 'results_benefit_long_nys_agency_a_books_n_hours_per_week_a_reason_q', 6),
(2, '{"agency":"A","books":"N","hours per week":"A","reason":"S"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_nys_agency_a_books_n_hours_per_week_a_reason_s', 'results_benefit_long_nys_agency_a_books_n_hours_per_week_a_reason_s', 7),
(2, '{"agency":"A","books":"N","hours per week":"A","reason":"N"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] NONE', FALSE, 'results_benefit_short_nys_agency_a_books_n_hours_per_week_a_reason_n', 'results_benefit_long_nys_agency_a_books_n_hours_per_week_a_reason_n', 8),
(2, '{"agency":"A","books":"N","hours per week":"B","reason":"Q"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_a_books_n_hours_per_week_b_reason_q', 'results_benefit_long_nys_agency_a_books_n_hours_per_week_b_reason_q', 9),
(2, '{"agency":"A","books":"N","hours per week":"B","reason":"S"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_nys_agency_a_books_n_hours_per_week_b_reason_s', 'results_benefit_long_nys_agency_a_books_n_hours_per_week_b_reason_s', 10),
(2, '{"agency":"A","books":"N","hours per week":"B","reason":"N"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] NONE', TRUE, 'results_benefit_short_nys_agency_a_books_n_hours_per_week_b_reason_n', 'results_benefit_long_nys_agency_a_books_n_hours_per_week_b_reason_n', 11),
(2, '{"agency":"B","books":"C","hours per week":"A","reason":"Q"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_b_books_c_hours_per_week_a_reason_q', 'results_benefit_long_nys_agency_b_books_c_hours_per_week_a_reason_q', 12),
(2, '{"agency":"B","books":"C","hours per week":"A","reason":"S"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_nys_agency_b_books_c_hours_per_week_a_reason_s', 'results_benefit_long_nys_agency_b_books_c_hours_per_week_a_reason_s', 13),
(2, '{"agency":"B","books":"C","hours per week":"A","reason":"N"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] NONE', FALSE, 'results_benefit_short_nys_agency_b_books_c_hours_per_week_a_reason_n', 'results_benefit_long_nys_agency_b_books_c_hours_per_week_a_reason_n', 14),
(2, '{"agency":"B","books":"C","hours per week":"B","reason":"Q"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_b_books_c_hours_per_week_b_reason_q', 'results_benefit_long_nys_agency_b_books_c_hours_per_week_b_reason_q', 15),
(2, '{"agency":"B","books":"C","hours per week":"B","reason":"S"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_nys_agency_b_books_c_hours_per_week_b_reason_s', 'results_benefit_long_nys_agency_b_books_c_hours_per_week_b_reason_s', 16),
(2, '{"agency":"B","books":"C","hours per week":"B","reason":"N"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] NONE', TRUE, 'results_benefit_short_nys_agency_b_books_c_hours_per_week_b_reason_n', 'results_benefit_long_nys_agency_b_books_c_hours_per_week_b_reason_n', 17),
(2, '{"agency":"B","books":"N","hours per week":"A","reason":"Q"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_b_books_n_hours_per_week_a_reason_q', 'results_benefit_long_nys_agency_b_books_n_hours_per_week_a_reason_q', 18),
(2, '{"agency":"B","books":"N","hours per week":"A","reason":"S"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', FALSE, 'results_benefit_short_nys_agency_b_books_n_hours_per_week_a_reason_s', 'results_benefit_long_nys_agency_b_books_n_hours_per_week_a_reason_s', 19),
(2, '{"agency":"B","books":"N","hours per week":"A","reason":"N"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] NONE', FALSE, 'results_benefit_short_nys_agency_b_books_n_hours_per_week_a_reason_n', 'results_benefit_long_nys_agency_b_books_n_hours_per_week_a_reason_n', 20),
(2, '{"agency":"B","books":"N","hours per week":"B","reason":"Q"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', TRUE, 'results_benefit_short_nys_agency_b_books_n_hours_per_week_b_reason_q', 'results_benefit_long_nys_agency_b_books_n_hours_per_week_b_reason_q', 21),
(2, '{"agency":"B","books":"N","hours per week":"B","reason":"S"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', TRUE, 'results_benefit_short_nys_agency_b_books_n_hours_per_week_b_reason_s', 'results_benefit_long_nys_agency_b_books_n_hours_per_week_b_reason_s', 22),
(2, '{"agency":"B","books":"N","hours per week":"B","reason":"N"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] NONE', TRUE, 'results_benefit_short_nys_agency_b_books_n_hours_per_week_b_reason_n', 'results_benefit_long_nys_agency_b_books_n_hours_per_week_b_reason_n', 23),

-- pssl
(3, '{"type":"N","agency":"A","employed":"U"}', '[type] NANNY or HOUSE CLEANER
[agency] YES
[employed] LESS THAN ONE YEAR or UNDER 80', FALSE, 'results_benefit_short_pssl_type_n_agency_a_employed_u', 'results_benefit_long_pssl_type_n_agency_a_employed_u', 0),
(3, '{"type":"N","agency":"A","employed":"O"}', '[type] NANNY or HOUSE CLEANER
[agency] YES
[employed] ONE YEAR OR MORE and OVER 80', TRUE, 'results_benefit_short_pssl_type_n_agency_a_employed_o', 'results_benefit_long_pssl_type_n_agency_a_employed_o', 1),
(3, '{"type":"N","agency":"B","employed":"U"}', '[type] NANNY or HOUSE CLEANER
[agency] NO
[employed] LESS THAN ONE YEAR or UNDER 80', FALSE, 'results_benefit_short_pssl_type_n_agency_b_employed_u', 'results_benefit_long_pssl_type_n_agency_b_employed_u', 2),
(3, '{"type":"N","agency":"B","employed":"O"}', '[type] NANNY or HOUSE CLEANER
[agency] NO
[employed] ONE YEAR OR MORE and OVER 80', TRUE, 'results_benefit_short_pssl_type_n_agency_b_employed_o', 'results_benefit_long_pssl_type_n_agency_b_employed_o', 3),
(3, '{"type":"H","agency":"A","employed":"U"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[agency] YES
[employed] LESS THAN ONE YEAR or UNDER 80', TRUE, 'results_benefit_short_pssl_results_benefit_long_pssl_type_h_agency_a_employed_u', 'type_h_agency_a_employed_u', 4),
(3, '{"type":"H","agency":"A","employed":"O"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[agency] YES
[employed] ONE YEAR OR MORE and OVER 80', TRUE, 'results_benefit_short_pssl_results_benefit_long_pssl_type_h_agency_a_employed_o', 'type_h_agency_a_employed_o', 5),
(3, '{"type":"H","agency":"B","employed":"U"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[agency] NO
[employed] LESS THAN ONE YEAR or UNDER 80', FALSE, 'results_benefit_short_pssl_results_benefit_long_pssl_type_h_agency_b_employed_u', 'type_h_agency_b_employed_u', 6),
(3, '{"type":"H","agency":"B","employed":"O"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[agency] NO
[employed] ONE YEAR OR MORE and OVER 80}', TRUE, 'results_benefit_short_pssl_results_benefit_long_pssl_type_h_agency_b_employed_o', 'type_h_agency_b_employed_o', 7),

-- dwbor
(4, '{"length of employment":"U"}', '[length of employment] LESS THAN ONE YEAR', FALSE, 'results_benefit_short_dwbor_length_of_employment_u', 'results_benefit_long_dwbor_length_of_employment_u', 0),
(4, '{"length of employment":"O"}', '[length of employment] ONE YEAR OR MORE', TRUE, 'results_benefit_short_dwbor_length_of_employment_o', 'results_benefit_long_dwbor_length_of_employment_o', 1),

-- cares
(5, '{"books":"C","length of employment":"U"}', '[books] YES, IN COMPLIANCE
[length of employment] LESS THAN SIX MONTHS', TRUE, 'results_benefit_short_cares_books_c_length_of_employment_u', 'results_benefit_long_cares_books_c_length_of_employment_u', 0),
(5, '{"books":"C","length of employment":"O"}', '[books] YES, IN COMPLIANCE
[length of employment] SIX MONTHS OR MORE', TRUE, 'results_benefit_short_cares_books_c_length_of_employment_o', 'results_benefit_long_cares_books_c_length_of_employment_o', 1),
(5, '{"books":"N","length of employment":"U"}', '[books] PARTIALLY or NO
[length of employment] LESS THAN SIX MONTHS', TRUE, 'results_benefit_short_cares_books_n_length_of_employment_u', 'results_benefit_long_cares_books_n_length_of_employment_u', 2),
(5, '{"books":"N","length of employment":"O"}', '[books] PARTIALLY or NO
[length of employment] SIX MONTHS OR MORE', TRUE, 'results_benefit_short_cares_books_n_length_of_employment_o', 'results_benefit_long_cares_books_n_length_of_employment_o', 3);

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '33c7d4e0', 'results_resources_ffcra_33c7d4e0',
        'results_resources_ffcra_desc_33c7d4e0', 0
    FROM benefits WHERE code = 'ffcra';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www.dol.gov/agencies/whd/pandemic'
    FROM resources WHERE code = '33c7d4e0';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '6d593dce', 'results_resources_ffcra_6d593dce', 'results_resources_ffcra_desc_6d593dce', 1
    FROM benefits WHERE code = 'ffcra';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www.dol.gov/sites/dolgov/files/WHD/posters/FFCRA_Poster_WH1422_Non-Federal.pdf'
    FROM resources WHERE code = '6d593dce';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '8589ffd0', 'results_resources_nys_8589ffd0', 'results_resources_nys_desc_8589ffd0', 0
    FROM benefits WHERE code = 'nys';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://paidfamilyleave.ny.gov/COVID19'
    FROM resources WHERE code = '8589ffd0';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'c6582622', 'results_resources_nys_c6582622', 'results_resources_nys_desc_c6582622', 1
    FROM benefits WHERE code = 'nys';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://paidfamilyleave.ny.gov/system/files/documents/2020/03/covid-19-sick-leave-employees.pdf'
    FROM resources WHERE code = 'c6582622';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'e5642f77', 'results_resources_pssl_e5642f77', 'results_resources_pssl_desc_e5642f77', 0
    FROM benefits WHERE code = 'pssl';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www1.nyc.gov/site/dca/about/paid-sick-leave-domestic-workers.page'
    FROM resources WHERE code = 'e5642f77';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'd6cba143', 'results_resources_dwbor_d6cba143', 'results_resources_dwbor_desc_d6cba143', 0
    FROM benefits WHERE code = 'dwbor';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/legal/domestic-workers-bill-of-rights.shtm'
    FROM resources WHERE code = 'd6cba143';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '2c42086d', 'results_resources_dwbor_2c42086d', 'results_resources_dwbor_desc_2c42086d', 1
    FROM benefits WHERE code = 'dwbor';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/formsdocs/factsheets/pdfs/P713.pdf'
    FROM resources WHERE code = '2c42086d';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '548bc0fd', 'results_resources_dwbor_548bc0fd', 'results_resources_dwbor_desc_548bc0fd', 2
    FROM benefits WHERE code = 'dwbor';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/legal/laws/pdf/domestic-workers/facts-for-employers.pdf'
    FROM resources WHERE code = '548bc0fd';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '82238d0e', 'results_resources_cares_82238d0e', 'results_resources_cares_desc_82238d0e', 0
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://dol.ny.gov/unemployment/employer-unemployment-insurance-information'
    FROM resources WHERE code = '82238d0e';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'ae4c789b', 'results_resources_cares_ae4c789b', 'results_resources_cares_desc_ae4c789b', 1
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/formsdocs/ui/IA318D.pdf'
    FROM resources WHERE code = 'ae4c789b';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'adce9590', 'results_resources_cares_adce9590', 'results_resources_cares_desc_adce9590', 2
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/ui/cares-act.shtm'
    FROM resources WHERE code = 'adce9590';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'd1bab6c5', 'results_resources_cares_d1bab6c5', 'results_resources_cares_desc_d1bab6c5', 3
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://dol.ny.gov/coronavirus-aid-relief-and-economic-security-cares-act'
    FROM resources WHERE code = 'd1bab6c5';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '364bfe25', 'results_resources_cares_364bfe25', 'results_resources_cares_desc_364bfe25', 4
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www.labor.ny.gov/ui/pdfs/pandemic-unemployment-assistance.pdf'
    FROM resources WHERE code = '364bfe25';

INSERT INTO resources (code, lang_key_text, lang_key_desc, sort_order)
VALUES ('ab4aa0fc', 'results_resources_other_ab4aa0fc', 'results_resources_other_desc_ab4aa0fc', 0);
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://domesticemployers.org/covid-19-benefits-eligibility-faqs-new-york-city/'
    FROM resources WHERE code = 'ab4aa0fc';

INSERT INTO resources (code, lang_key_text, lang_key_desc, sort_order)
VALUES ('9d2c27c1', 'results_resources_other_9d2c27c1', 'results_resources_other_desc_9d2c27c1', 1);
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www1.nyc.gov/assets/dca/downloads/pdf/businesses/Domestic-Household-Employee-Rights.pdf'
    FROM resources WHERE code = '9d2c27c1';

INSERT INTO resources (code, lang_key_text, lang_key_desc, sort_order)
VALUES ('70f6c69a', 'results_resources_other_70f6c69a', 'results_resources_other_desc_70f6c69a', 2);
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www.irs.gov/coronavirus/economic-impact-payments'
    FROM resources WHERE code = '70f6c69a';

INSERT INTO resources (code, lang_key_text, lang_key_desc, sort_order)
VALUES ('d34a64e3', 'results_resources_other_d34a64e3', 'results_resources_other_desc_d34a64e3', 3);
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www1.nyc.gov/assets/dca/downloads/pdf/about/Paid-Care-Brochure.pdf'
    FROM resources WHERE code = 'd34a64e3';

