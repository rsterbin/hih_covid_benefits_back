--
-- I changed the way NYS splits up its answers.  This alters the table, corrects its scenarios, and clears the inactive language keys.
--

ALTER TABLE conditions ADD COLUMN pass text;
UPDATE conditions SET pass = 'first';
ALTER TABLE conditions ALTER COLUMN pass SET NOT NULL;

DELETE FROM conditions c
USING benefits b
WHERE c.benefit_id = b.benefit_id
AND b.code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Meets Work Requirements?', 'work', 'first', 'workForNYS', '[{"letter":"A","answer":"AGENCY"},{"letter":"Y","answer":"YES"},{"letter":"N","answer":"NO"}]', 0 FROM benefits WHERE code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'On the Books?', 'books', 'first', 'splitBooksByCompliance', '[{"answer":"YES, IN COMPLIANCE","letter":"C"},{"answer":"PARTIALLY OR NO","letter":"N"}]', 1 FROM benefits WHERE code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Reason', 'reason', 'first', 'findReasonForNYS', '[{"letter":"Q","answer":"SELF-QUARANTINE"},{"letter":"F","answer":"FAMILY QUARANTINE"},{"letter":"N","answer":"NONE"}]', 2 FROM benefits WHERE code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Eligible for FFCRA?', 'ffcra', 'second', 'simple', '[{"letter":"Y","answer":"YES"},{"letter":"N","answer":"NO"}]', 3 FROM benefits WHERE code = 'nys';

DELETE FROM scenarios s
USING benefits b
WHERE s.benefit_id = b.benefit_id
AND b.code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"C","reason":"Q","ffcra":"Y"}', '[work] AGENCY
[books] YES, IN COMPLIANCE
[reason] SELF-QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_a_books_c_reason_q_ffcra_y', 'results_benefit_long_nys_work_a_books_c_reason_q_ffcra_y', 0 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"C","reason":"Q","ffcra":"N"}', '[work] AGENCY
[books] YES, IN COMPLIANCE
[reason] SELF-QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_a_books_c_reason_q_ffcra_n', 'results_benefit_long_nys_work_a_books_c_reason_q_ffcra_n', 1 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"C","reason":"F","ffcra":"Y"}', '[work] AGENCY
[books] YES, IN COMPLIANCE
[reason] FAMILY QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_a_books_c_reason_f_ffcra_y', 'results_benefit_long_nys_work_a_books_c_reason_f_ffcra_y', 2 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"C","reason":"F","ffcra":"N"}', '[work] AGENCY
[books] YES, IN COMPLIANCE
[reason] FAMILY QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_a_books_c_reason_f_ffcra_n', 'results_benefit_long_nys_work_a_books_c_reason_f_ffcra_n', 3 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"C","reason":"N","ffcra":"Y"}', '[work] AGENCY
[books] YES, IN COMPLIANCE
[reason] NONE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_a_books_c_reason_n_ffcra_y', 'results_benefit_long_nys_work_a_books_c_reason_n_ffcra_y', 4 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"C","reason":"N","ffcra":"N"}', '[work] AGENCY
[books] YES, IN COMPLIANCE
[reason] NONE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_a_books_c_reason_n_ffcra_n', 'results_benefit_long_nys_work_a_books_c_reason_n_ffcra_n', 5 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"N","reason":"Q","ffcra":"Y"}', '[work] AGENCY
[books] PARTIALLY or NO
[reason] SELF-QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_a_books_n_reason_q_ffcra_y', 'results_benefit_long_nys_work_a_books_n_reason_q_ffcra_y', 6 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"N","reason":"Q","ffcra":"N"}', '[work] AGENCY
[books] PARTIALLY or NO
[reason] SELF-QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_a_books_n_reason_q_ffcra_n', 'results_benefit_long_nys_work_a_books_n_reason_q_ffcra_n', 7 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"N","reason":"F","ffcra":"Y"}', '[work] AGENCY
[books] PARTIALLY or NO
[reason] FAMILY QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_a_books_n_reason_f_ffcra_y', 'results_benefit_long_nys_work_a_books_n_reason_f_ffcra_y', 8 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"N","reason":"F","ffcra":"N"}', '[work] AGENCY
[books] PARTIALLY or NO
[reason] FAMILY QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_a_books_n_reason_f_ffcra_n', 'results_benefit_long_nys_work_a_books_n_reason_f_ffcra_n', 9 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"N","reason":"N","ffcra":"Y"}', '[work] AGENCY
[books] PARTIALLY or NO
[reason] NONE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_a_books_n_reason_n_ffcra_y', 'results_benefit_long_nys_work_a_books_n_reason_n_ffcra_y', 10 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"A","books":"N","reason":"N","ffcra":"N"}', '[work] AGENCY
[books] PARTIALLY or NO
[reason] NONE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_a_books_n_reason_n_ffcra_n', 'results_benefit_long_nys_work_a_books_n_reason_n_ffcra_n', 11 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"C","reason":"Q","ffcra":"Y"}', '[work] YES
[books] YES, IN COMPLIANCE
[reason] SELF-QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_y_books_c_reason_q_ffcra_y', 'results_benefit_long_nys_work_y_books_c_reason_q_ffcra_y', 12 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"C","reason":"Q","ffcra":"N"}', '[work] YES
[books] YES, IN COMPLIANCE
[reason] SELF-QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_y_books_c_reason_q_ffcra_n', 'results_benefit_long_nys_work_y_books_c_reason_q_ffcra_n', 13 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"C","reason":"F","ffcra":"Y"}', '[work] YES
[books] YES, IN COMPLIANCE
[reason] FAMILY QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_y_books_c_reason_f_ffcra_y', 'results_benefit_long_nys_work_y_books_c_reason_f_ffcra_y', 14 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"C","reason":"F","ffcra":"N"}', '[work] YES
[books] YES, IN COMPLIANCE
[reason] FAMILY QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_y_books_c_reason_f_ffcra_n', 'results_benefit_long_nys_work_y_books_c_reason_f_ffcra_n', 15 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"C","reason":"N","ffcra":"Y"}', '[work] YES
[books] YES, IN COMPLIANCE
[reason] NONE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_y_books_c_reason_n_ffcra_y', 'results_benefit_long_nys_work_y_books_c_reason_n_ffcra_y', 16 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"C","reason":"N","ffcra":"N"}', '[work] YES
[books] YES, IN COMPLIANCE
[reason] NONE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_y_books_c_reason_n_ffcra_n', 'results_benefit_long_nys_work_y_books_c_reason_n_ffcra_n', 17 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"N","reason":"Q","ffcra":"Y"}', '[work] YES
[books] PARTIALLY or NO
[reason] SELF-QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_y_books_n_reason_q_ffcra_y', 'results_benefit_long_nys_work_y_books_n_reason_q_ffcra_y', 18 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"N","reason":"Q","ffcra":"N"}', '[work] YES
[books] PARTIALLY or NO
[reason] SELF-QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_y_books_n_reason_q_ffcra_n', 'results_benefit_long_nys_work_y_books_n_reason_q_ffcra_n', 19 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"N","reason":"F","ffcra":"Y"}', '[work] YES
[books] PARTIALLY or NO
[reason] FAMILY QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_y_books_n_reason_f_ffcra_y', 'results_benefit_long_nys_work_y_books_n_reason_f_ffcra_y', 20 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"N","reason":"F","ffcra":"N"}', '[work] YES
[books] PARTIALLY or NO
[reason] FAMILY QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_y_books_n_reason_f_ffcra_n', 'results_benefit_long_nys_work_y_books_n_reason_f_ffcra_n', 21 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"N","reason":"N","ffcra":"Y"}', '[work] YES
[books] PARTIALLY or NO
[reason] NONE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_y_books_n_reason_n_ffcra_y', 'results_benefit_long_nys_work_y_books_n_reason_n_ffcra_y', 22 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"Y","books":"N","reason":"N","ffcra":"N"}', '[work] YES
[books] PARTIALLY or NO
[reason] NONE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_y_books_n_reason_n_ffcra_n', 'results_benefit_long_nys_work_y_books_n_reason_n_ffcra_n', 23 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"C","reason":"Q","ffcra":"Y"}', '[work] NO
[books] YES, IN COMPLIANCE
[reason] SELF-QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_n_books_c_reason_q_ffcra_y', 'results_benefit_long_nys_work_n_books_c_reason_q_ffcra_y', 24 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"C","reason":"Q","ffcra":"N"}', '[work] NO
[books] YES, IN COMPLIANCE
[reason] SELF-QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_n_books_c_reason_q_ffcra_n', 'results_benefit_long_nys_work_n_books_c_reason_q_ffcra_n', 25 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"C","reason":"F","ffcra":"Y"}', '[work] NO
[books] YES, IN COMPLIANCE
[reason] FAMILY QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_n_books_c_reason_f_ffcra_y', 'results_benefit_long_nys_work_n_books_c_reason_f_ffcra_y', 26 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"C","reason":"F","ffcra":"N"}', '[work] NO
[books] YES, IN COMPLIANCE
[reason] FAMILY QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_n_books_c_reason_f_ffcra_n', 'results_benefit_long_nys_work_n_books_c_reason_f_ffcra_n', 27 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"C","reason":"N","ffcra":"Y"}', '[work] NO
[books] YES, IN COMPLIANCE
[reason] NONE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_n_books_c_reason_n_ffcra_y', 'results_benefit_long_nys_work_n_books_c_reason_n_ffcra_y', 28 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"C","reason":"N","ffcra":"N"}', '[work] NO
[books] YES, IN COMPLIANCE
[reason] NONE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_n_books_c_reason_n_ffcra_n', 'results_benefit_long_nys_work_n_books_c_reason_n_ffcra_n', 29 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"N","reason":"Q","ffcra":"Y"}', '[work] NO
[books] PARTIALLY or NO
[reason] SELF-QUARANTINE
[ffcra] YES', TRUE, 'results_benefit_short_nys_work_n_books_n_reason_q_ffcra_y', 'results_benefit_long_nys_work_n_books_n_reason_q_ffcra_y', 30 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"N","reason":"Q","ffcra":"N"}', '[work] NO
[books] PARTIALLY or NO
[reason] SELF-QUARANTINE
[ffcra] NO', TRUE, 'results_benefit_short_nys_work_n_books_n_reason_q_ffcra_n', 'results_benefit_long_nys_work_n_books_n_reason_q_ffcra_n', 31 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"N","reason":"F","ffcra":"Y"}', '[work] NO
[books] PARTIALLY or NO
[reason] FAMILY QUARANTINE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_n_books_n_reason_f_ffcra_y', 'results_benefit_long_nys_work_n_books_n_reason_f_ffcra_y', 32 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"N","reason":"F","ffcra":"N"}', '[work] NO
[books] PARTIALLY or NO
[reason] FAMILY QUARANTINE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_n_books_n_reason_f_ffcra_n', 'results_benefit_long_nys_work_n_books_n_reason_f_ffcra_n', 33 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"N","reason":"N","ffcra":"Y"}', '[work] NO
[books] PARTIALLY or NO
[reason] NONE
[ffcra] YES', FALSE, 'results_benefit_short_nys_work_n_books_n_reason_n_ffcra_y', 'results_benefit_long_nys_work_n_books_n_reason_n_ffcra_y', 34 FROM benefits WHERE code = 'nys';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"work":"N","books":"N","reason":"N","ffcra":"N"}', '[work] NO
[books] PARTIALLY or NO
[reason] NONE
[ffcra] NO', FALSE, 'results_benefit_short_nys_work_n_books_n_reason_n_ffcra_n', 'results_benefit_long_nys_work_n_books_n_reason_n_ffcra_n', 35 FROM benefits WHERE code = 'nys';

DELETE FROM language_keys WHERE section = 'results_processing' AND
    (key LIKE 'results_benefit_short_nys_%' OR key LIKE 'results_benefit_long_nys_%');

