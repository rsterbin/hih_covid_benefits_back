ALTER TABLE language_keys ADD COLUMN token_replace text;
UPDATE language_keys SET token_replace = 'employee_type'
WHERE help LIKE '%{{employee_type}}%';

DROP TABLE resource_links;
DROP TABLE resources;

CREATE TABLE resources (
    resource_id serial NOT NULL,
    benefit_id integer,
    code text NOT NULL,
    lang_key_text text NOT NULL,
    lang_key_desc text,
    sort_order integer NOT NULL,
    CONSTRAINT resources_pkey PRIMARY KEY (resource_id),
    CONSTRAINT resources_code_uq UNIQUE (code),
    CONSTRAINT resources_benefit_id_fk FOREIGN KEY (benefit_id)
        REFERENCES benefits (benefit_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE resource_links (
    link_id serial NOT NULL,
    resource_id integer NOT NULL,
    language text NOT NULL,
    url text NOT NULL,
    CONSTRAINT resource_links_pkey PRIMARY KEY (link_id),
    CONSTRAINT resource_links_uq UNIQUE (resource_id, language),
    CONSTRAINT resource_links_resource_id_fk FOREIGN KEY (resource_id)
        REFERENCES resources (resource_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);


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
    SELECT benefit_id, '8589ffd0', 'results_resources_nys_8589ffd0', 'results_resources_nys_desc, 8589ffd0', 0
    FROM benefits WHERE code = 'nys';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://paidfamilyleave.ny.gov/COVID19'
    FROM resources WHERE code = '8589ffd0';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'c6582622', 'results_resources_nys_c6582622', 'results_resources_nys_desc, c6582622', 1
    FROM benefits WHERE code = 'nys';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://paidfamilyleave.ny.gov/system/files/documents/2020/03/covid-19-sick-leave-employees.pdf'
    FROM resources WHERE code = 'c6582622';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '2c42086d', 'results_resources_nys_2c42086d', 'results_resources_nys_desc, 2c42086d', 2
    FROM benefits WHERE code = 'nys';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/formsdocs/factsheets/pdfs/P713.pdf'
    FROM resources WHERE code = '2c42086d';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'e5642f77', 'results_resources_nys_e5642f77', 'results_resources_nys_desc, e5642f77', 3
    FROM benefits WHERE code = 'nys';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www1.nyc.gov/site/dca/about/paid-sick-leave-domestic-workers.page'
    FROM resources WHERE code = 'e5642f77';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'd6cba143', 'results_resources_dwbor_d6cba143', 'results_resources_dwbor_desc, d6cba143', 0
    FROM benefits WHERE code = 'dwbor';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/legal/domestic-workers-bill-of-rights.shtm'
    FROM resources WHERE code = 'd6cba143';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '2d6711ea', 'results_resources_dwbor_2d6711ea', 'results_resources_dwbor_desc, 2d6711ea', 1
    FROM benefits WHERE code = 'dwbor';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://www1.nyc.gov/site/dca/about/paid-sick-leave-domestic-workers.page'
    FROM resources WHERE code = '2d6711ea';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '82238d0e', 'results_resources_cares_82238d0e', 'results_resources_cares_desc, 82238d0e', 0
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://dol.ny.gov/unemployment/employer-unemployment-insurance-information'
    FROM resources WHERE code = '82238d0e';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'ae4c789b', 'results_resources_cares_ae4c789b', 'results_resources_cares_desc, ae4c789b', 1
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/formsdocs/ui/IA318D.pdf'
    FROM resources WHERE code = 'ae4c789b';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'adce9590', 'results_resources_cares_adce9590', 'results_resources_cares_desc, adce9590', 2
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/ui/cares-act.shtm'
    FROM resources WHERE code = 'adce9590';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, 'd1bab6c5', 'results_resources_cares_d1bab6c5', 'results_resources_cares_desc, d1bab6c5', 3
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://dol.ny.gov/coronavirus-aid-relief-and-economic-security-cares-act'
    FROM resources WHERE code = 'd1bab6c5';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '548bc0fd', 'results_resources_cares_548bc0fd', 'results_resources_cares_desc, 548bc0fd', 4
    FROM benefits WHERE code = 'cares';
INSERT INTO resource_links (resource_id, language, url)
    SELECT resource_id, 'en', 'https://labor.ny.gov/legal/laws/pdf/domestic-workers/facts-for-employers.pdf'
    FROM resources WHERE code = '548bc0fd';

INSERT INTO resources (benefit_id, code, lang_key_text, lang_key_desc, sort_order)
    SELECT benefit_id, '364bfe25', 'results_resources_cares_364bfe25', 'results_resources_cares_desc, 364bfe25', 5
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

UPDATE language_keys SET section = 'results_resources' WHERE section = 'results resources';


