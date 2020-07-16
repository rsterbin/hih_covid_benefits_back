--
-- I decided that I wanted to split the CARES answers by agency as well
--

DELETE FROM conditions c
USING benefits b
WHERE c.benefit_id = b.benefit_id
AND b.code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Agency?', 'agency', 'first', 'simple', '[{"letter":"A","answer":"YES"},{"letter":"B","answer":"NO"}]', 0 FROM benefits WHERE code = 'cares';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'On the Books?', 'books', 'first', 'splitBooksByCompliance', '[{"answer":"YES, IN COMPLIANCE","letter":"C"},{"answer":"PARTIALLY OR NO","letter":"N"}]', 1 FROM benefits WHERE code = 'cares';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Employment', 'length of employment', 'first', 'splitLengthByMonths', '[{"answer":"LESS THAN SIX MONTHS","letter":"U"},{"answer":"SIX MONTHS OR MORE","letter":"O"}]', 2 FROM benefits WHERE code = 'cares';

DELETE FROM scenarios s
USING benefits b
WHERE s.benefit_id = b.benefit_id
AND b.code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"A","books":"C","length of employment":"U"}', '[agency] YES
[books] YES, IN COMPLIANCE
[length of employment] LESS THAN SIX MONTHS', TRUE, 'results_benefit_short_cares_agency_a_books_c_length of employment_a', 'results_benefit_long_cares_agency_a_books_c_length of employment_a', 0 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"A","books":"C","length of employment":"O"}', '[agency] YES
[books] YES, IN COMPLIANCE
[length of employment] SIX MONTHS OR MORE', TRUE, 'results_benefit_short_cares_agency_a_books_c_length of employment_b|c', 'results_benefit_long_cares_agency_a_books_c_length of employment_b|c', 1 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"A","books":"N","length of employment":"U"}', '[agency] YES
[books] PARTIALLY or NO
[length of employment] LESS THAN SIX MONTHS', TRUE, 'results_benefit_short_cares_agency_a_books_n_length of employment_a', 'results_benefit_long_cares_agency_a_books_n_length of employment_a', 2 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"A","books":"N","length of employment":"O"}', '[agency] YES
[books] PARTIALLY or NO
[length of employment] SIX MONTHS OR MORE', TRUE, 'results_benefit_short_cares_agency_a_books_n_length of employment_b|c', 'results_benefit_long_cares_agency_a_books_n_length of employment_b|c', 3 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"B","books":"C","length of employment":"U"}', '[agency] NO
[books] YES, IN COMPLIANCE
[length of employment] LESS THAN SIX MONTHS', TRUE, 'results_benefit_short_cares_agency_b_books_c_length of employment_a', 'results_benefit_long_cares_agency_b_books_c_length of employment_a', 4 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"B","books":"C","length of employment":"O"}', '[agency] NO
[books] YES, IN COMPLIANCE
[length of employment] SIX MONTHS OR MORE', TRUE, 'results_benefit_short_cares_agency_b_books_c_length of employment_b|c', 'results_benefit_long_cares_agency_b_books_c_length of employment_b|c', 5 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"B","books":"N","length of employment":"U"}', '[agency] NO
[books] PARTIALLY or NO
[length of employment] LESS THAN SIX MONTHS', TRUE, 'results_benefit_short_cares_agency_b_books_n_length of employment_a', 'results_benefit_long_cares_agency_b_books_n_length of employment_a', 6 FROM benefits WHERE code = 'cares';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"B","books":"N","length of employment":"O"}', '[agency] NO
[books] PARTIALLY or NO
[length of employment] SIX MONTHS OR MORE', TRUE, 'results_benefit_short_cares_agency_b_books_n_length of employment_b|c', 'results_benefit_long_cares_agency_b_books_n_length of employment_b|c', 7 FROM benefits WHERE code = 'cares';

DELETE FROM language_keys WHERE section = 'results_processing' AND
    (key LIKE 'results_benefit_short_cares_%' OR key LIKE 'results_benefit_long_cares_%');

