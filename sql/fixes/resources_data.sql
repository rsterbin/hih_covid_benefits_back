--
-- An early version of the install for resources had some bad data.  This fixes it.
--

UPDATE resources SET
    benefit_id = (SELECT benefit_id FROM benefits WHERE code = 'dwbor'),
    lang_key_text = 'results_resources_dwbor_2c42086d',
    lang_key_desc = 'results_resources_dwbor_desc_2c42086d',
    sort_order = 1
WHERE code = '2c42086d';
UPDATE language_keys SET key = 'results_resources_dwbor_2c42086d' WHERE key = 'results_resources_nys_2c42086d';

UPDATE resources SET
    benefit_id = (SELECT benefit_id FROM benefits WHERE code = 'pssl'),
    lang_key_text = 'results_resources_pssl_e5642f77',
    lang_key_desc = 'results_resources_pssl_desc_e5642f77',
    sort_order = 0
WHERE code = 'e5642f77';
UPDATE language_keys SET key = 'results_resources_pssl_e5642f77' WHERE key = 'results_resources_nys_e5642f77';

DELETE FROM resources WHERE code = '2d6711ea';
DELETE FROM language_keys WHERE key = 'results_resources_dwbor_2d6711ea';

UPDATE resources SET
    benefit_id = (SELECT benefit_id FROM benefits WHERE code = 'dwbor'),
    lang_key_text = 'results_resources_dwbor_548bc0fd',
    lang_key_desc = 'results_resources_dwbor_desc_548bc0fd',
    sort_order = 2
WHERE code = '548bc0fd';
UPDATE language_keys SET key = 'results_resources_dwbor_548bc0fd' WHERE key = 'results_resources_cares_548bc0fd';

UPDATE resources SET lang_key_desc = 'results_resources_nys_desc_8589ffd0' WHERE code = '8589ffd0';
UPDATE language_keys SET key = 'results_resources_nys_desc_8589ffd0' WHERE key = 'results_resources_nys_desc, 8589ffd0';

UPDATE resources SET lang_key_desc = 'results_resources_nys_desc_c6582622' WHERE code = 'c6582622';
UPDATE language_keys SET key = 'results_resources_nys_desc_c6582622' WHERE key = 'results_resources_nys_desc, c6582622';

UPDATE resources SET lang_key_desc = 'results_resources_dwbor_desc_d6cba143' WHERE code = 'd6cba143';
UPDATE language_keys SET key = 'results_resources_dwbor_desc_d6cba143' WHERE key = 'results_resources_dwbor_desc, d6cba143';

UPDATE resources SET lang_key_desc = 'results_resources_dwbor_desc_548bc0fd' WHERE code = '548bc0fd';
UPDATE language_keys SET key = 'results_resources_dwbor_desc_548bc0fd' WHERE key = 'results_resources_dwbor_desc, 548bc0fd';

UPDATE resources SET lang_key_desc = 'results_resources_cares_desc_82238d0e' WHERE code = '82238d0e';
UPDATE language_keys SET key = 'results_resources_cares_desc_82238d0e' WHERE key = 'results_resources_cares_desc, 82238d0e';

UPDATE resources SET lang_key_desc = 'results_resources_cares_desc_ae4c789b' WHERE code = 'ae4c789b';
UPDATE language_keys SET key = 'results_resources_cares_desc_ae4c789b' WHERE key = 'results_resources_cares_desc, ae4c789b';

UPDATE resources SET lang_key_desc = 'results_resources_cares_desc_adce9590' WHERE code = 'adce9590';
UPDATE language_keys SET key = 'results_resources_cares_desc_adce9590' WHERE key = 'results_resources_cares_desc, adce9590';

UPDATE resources SET lang_key_desc = 'results_resources_cares_desc_d1bab6c5' WHERE code = 'd1bab6c5';
UPDATE language_keys SET key = 'results_resources_cares_desc_d1bab6c5' WHERE key = 'results_resources_cares_desc, d1bab6c5';

UPDATE resources SET lang_key_desc = 'results_resources_cares_desc_364bfe25' WHERE code = '364bfe25';
UPDATE language_keys SET key = 'results_resources_cares_desc_364bfe25' WHERE key = 'results_resources_cares_desc, 364bfe25';

-- Tinker with language keys
ALTER TABLE language_keys ADD COLUMN token_replace text;
UPDATE language_keys SET token_replace = 'employee_type'
WHERE help LIKE '%{{employee_type}}%';

UPDATE language_keys SET section = 'results_resources' WHERE section = 'results resources';

UPDATE language_keys SET key = 'results_resources_dwbor_2c42086d' WHERE key = 'results_resources_nys_2c42086d';
UPDATE language_keys SET key = 'results_resources_pssl_e5642f77' WHERE key = 'results_resources_nys_e5642f77';
DELETE FROM language_keys WHERE key = 'results_resources_dwbor_2d6711ea' CASCADE;
UPDATE language_keys SET key = 'results_resources_dwbor_548bc0fd' WHERE key = 'results_resources_cares_548bc0fd';
UPDATE language_keys SET key = 'results_resources_nys_desc_8589ffd0' WHERE key = 'results_resources_nys_desc, 8589ffd0';
UPDATE language_keys SET key = 'results_resources_nys_desc_c6582622' WHERE key = 'results_resources_nys_desc, c6582622';
UPDATE language_keys SET key = 'results_resources_dwbor_desc_d6cba143' WHERE key = 'results_resources_dwbor_desc, d6cba143';
UPDATE language_keys SET key = 'results_resources_dwbor_desc_548bc0fd' WHERE key = 'results_resources_dwbor_desc, 548bc0fd';
UPDATE language_keys SET key = 'results_resources_cares_desc_82238d0e' WHERE key = 'results_resources_cares_desc, 82238d0e';
UPDATE language_keys SET key = 'results_resources_cares_desc_ae4c789b' WHERE key = 'results_resources_cares_desc, ae4c789b';
UPDATE language_keys SET key = 'results_resources_cares_desc_adce9590' WHERE key = 'results_resources_cares_desc, adce9590';
UPDATE language_keys SET key = 'results_resources_cares_desc_d1bab6c5' WHERE key = 'results_resources_cares_desc, d1bab6c5';
UPDATE language_keys SET key = 'results_resources_cares_desc_364bfe25' WHERE key = 'results_resources_cares_desc, 364bfe25';

