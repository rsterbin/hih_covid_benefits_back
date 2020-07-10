--
-- I changed the way PSSL splits up its answers.  This corrects its conditions and scenarios, and clears the inactive language keys.
--

-- Drop the type condition we no longer need
DELETE FROM conditions c
USING benefits b
WHERE c.benefit_id = b.benefit_id
AND c.key_name = 'type'
AND b.code = 'pssl';

-- Clear the old scenarios
DELETE FROM scenarios s
USING benefits b
WHERE s.benefit_id = b.benefit_id
AND b.code = 'pssl';

-- Add the simpler new ones

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"A","employed":"U"}', '[agency] YES
[employed] LESS THAN ONE YEAR or UNDER 80', TRUE, 'results_benefit_short_pssl_agency_a_employed_u', 'results_benefit_long_pssl_agency_a_employed_u', 0 FROM benefits WHERE code = 'pssl';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"A","employed":"O"}', '[agency] YES
[employed] ONE YEAR OR MORE and OVER 80', TRUE, 'results_benefit_short_pssl_agency_a_employed_o', 'results_benefit_long_pssl_agency_a_employed_o', 1 FROM benefits WHERE code = 'pssl';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"B","employed":"U"}', '[agency] NO
[employed] LESS THAN ONE YEAR or UNDER 80', FALSE, 'results_benefit_short_pssl_agency_b_employed_u', 'results_benefit_long_pssl_agency_b_employed_u', 2 FROM benefits WHERE code = 'pssl';

INSERT INTO scenarios (benefit_id, condition_map, help, enabled, lang_key_result, lang_key_expanded, sort_order) SELECT benefit_id, '{"agency":"B","employed":"O"}', '[agency] NO
[employed] ONE YEAR OR MORE and OVER 80', TRUE, 'results_benefit_short_pssl_agency_b_employed_o', 'results_benefit_long_pssl_agency_b_employed_o', 3 FROM benefits WHERE code = 'pssl';

DELETE FROM language_keys WHERE key LIKE 'results_benefit_pssl_%';

