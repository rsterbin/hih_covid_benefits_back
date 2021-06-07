INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES 
('results_benefit_pssl_type_n_agency_a_employed_u', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] NANNY or HOUSE CLEANER
* [agency] YES
* [employed] LESS THAN ONE YEAR or UNDER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_n_agency_a_employed_o', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] NANNY or HOUSE CLEANER
* [agency] YES
* [employed] ONE YEAR OR MORE and OVER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_n_agency_b_employed_u', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] NANNY or HOUSE CLEANER
* [agency] NO
* [employed] LESS THAN ONE YEAR or UNDER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_n_agency_b_employed_o', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] NANNY or HOUSE CLEANER
* [agency] NO
* [employed] ONE YEAR OR MORE and OVER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_h_agency_a_employed_u', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] HOME ATTENDANT or HOME HEALTH CARE WORKER
* [agency] YES
* [employed] LESS THAN ONE YEAR or UNDER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_h_agency_a_employed_o', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] HOME ATTENDANT or HOME HEALTH CARE WORKER
* [agency] YES
* [employed] ONE YEAR OR MORE and OVER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_h_agency_b_employed_u', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] HOME ATTENDANT or HOME HEALTH CARE WORKER
* [agency] NO
* [employed] LESS THAN ONE YEAR or UNDER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE),
('results_benefit_pssl_type_h_agency_b_employed_o', 'results processing', 'This answer appears under NYC PSSL for the following scenario:

* [type] HOME ATTENDANT or HOME HEALTH CARE WORKER
* [agency] NO
* [employed] ONE YEAR OR MORE and OVER 80

If `{{employee_type}}` appears in the text, it will be replaced by the type selected.', TRUE);

DELETE FROM language_keys WHERE key IN (
'results_benefit_pssl_type_n_length_of_employment_o_hours_per_year_b',
'results_benefit_pssl_type_h_length_of_employment_u_hours_per_year_a',
'results_benefit_pssl_type_h_length_of_employment_u_hours_per_year_b',
'results_benefit_pssl_type_h_length_of_employment_o_hours_per_year_a',
'results_benefit_pssl_type_h_length_of_employment_o_hours_per_year_b'
);

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys WHERE key IN (
        'results_benefit_pssl_type_n_agency_a_employed_u',
        'results_benefit_pssl_type_n_agency_a_employed_o',
        'results_benefit_pssl_type_n_agency_b_employed_u',
        'results_benefit_pssl_type_n_agency_b_employed_o',
        'results_benefit_pssl_type_h_agency_a_employed_u',
        'results_benefit_pssl_type_h_agency_a_employed_o',
        'results_benefit_pssl_type_h_agency_b_employed_u',
        'results_benefit_pssl_type_h_agency_b_employed_o'
    );

