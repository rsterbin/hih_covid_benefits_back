DROP TABLE IF EXISTS prelaunch_sessions;
DROP TABLE IF EXISTS eligibility;
DROP TABLE IF EXISTS conditions;
DROP TABLE IF EXISTS benefits;
DROP TABLE IF EXISTS translations;
DROP TABLE IF EXISTS language_keys;
DROP TABLE IF EXISTS deployments;
DROP TABLE IF EXISTS admin_sessions;
DROP TABLE IF EXISTS error_log;
DROP TABLE IF EXISTS raw_contacts;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS responses;
DROP TABLE IF EXISTS sessions;

CREATE TABLE sessions (
    session_id serial NOT NULL,
    token text NOT NULL,
    visitor_id text NOT NULL,
    expires timestamp with time zone,
    CONSTRAINT sessions_pkey PRIMARY KEY (session_id)
);

CREATE TABLE responses (
    response_id serial NOT NULL,
    visitor_id text NOT NULL,
    submitted timestamp with time zone,
    CONSTRAINT responses_pkey PRIMARY KEY (response_id)
);

CREATE TABLE answers (
    answer_id serial NOT NULL,
    response_id integer NOT NULL,
    question_code text NOT NULL,
    answer text,
    CONSTRAINT answers_pkey PRIMARY KEY (answer_id),
    CONSTRAINT answers_response_id_fk FOREIGN KEY (response_id)
        REFERENCES responses (response_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE contacts (
    contact_id serial NOT NULL,
    email text NOT NULL,
    zip_code text,
    submitted timestamp with time zone NOT NULL DEFAULT NOW(),
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
);
CREATE UNIQUE INDEX contacts_email_idx ON contacts(LOWER(email));

CREATE TABLE raw_contacts (
    raw_id serial NOT NULL,
    email text NOT NULL,
    zip_code text,
    valid boolean,
    submitted timestamp with time zone NOT NULL DEFAULT NOW(),
    processed_at timestamp with time zone,
    CONSTRAINT raw_contacts_pkey PRIMARY KEY (raw_id)
);

CREATE TABLE error_log (
    error_id serial NOT NULL,
    error_time timestamp with time zone NOT NULL DEFAULT NOW(),
    log_level text NOT NULL,
    log_message text NOT NULL,
    context text,
    CONSTRAINT error_log_pkey PRIMARY KEY (error_id)
);

CREATE TABLE admin_sessions (
    session_id serial NOT NULL,
    token text NOT NULL,
    expires timestamp with time zone,
    CONSTRAINT admin_sessions_pkey PRIMARY KEY (session_id)
);

CREATE TABLE deployments (
    deployment_id serial NOT NULL,
    version_num text NOT NULL,
    hash text NOT NULL,
    date_deployed timestamp with time zone NOT NULL,
    data text,
    CONSTRAINT deployments_pk PRIMARY KEY (deployment_id),
    CONSTRAINT version_num_uq UNIQUE (version_num)
);

CREATE TABLE language_keys (
    key_id serial NOT NULL,
    key text NOT NULL,
    section text NOT NULL,
    help text,
    markdown_allowed boolean NOT NULL DEFAULT FALSE,
    CONSTRAINT language_keys_pkey PRIMARY KEY (key_id)
);

CREATE TABLE translations (
    translation_id serial NOT NULL,
    key_id integer NOT NULL,
    language text NOT NULL,
    translation text,
    CONSTRAINT translations_pkey PRIMARY KEY (translation_id),
    CONSTRAINT translations_key_id_fk FOREIGN KEY (key_id)
        REFERENCES language_keys (key_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE,
    CONSTRAINT translations_uq UNIQUE (key_id, language)
);

CREATE TABLE benefits (
    benefit_id serial NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    abbreviation text NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT benefits_pkey PRIMARY KEY (benefit_id),
    CONSTRAINT benefits_code_uq UNIQUE (code),
    CONSTRAINT benefits_sort_uq UNIQUE (sort_order)
);

INSERT INTO benefits (code, name, abbreviation, sort_order) VALUES
('ffcra', 'Families First Coronavirus Response Act', 'FFCRA', 0),
('nys', 'New York State Sick Leave, Paid Family Leave, and Disability Benefits', 'NYS Sick, PFL, and DB', 1),
('pssl', 'New York City Paid Safe and Sick Leave', 'NYC PSSL', 2),
('dwbor', 'New York State Domestic Worker Bill of Rights', 'NYS DWBoR', 3),
('cares', 'Coronavirus Aid, Relief, and Economic Security Act: Unemployment Insurance Benefits', 'CARES Act: UI Benefits', 4);

CREATE TABLE conditions (
    condition_id serial NOT NULL,
    benefit_id integer NOT NULL,
    name text NOT NULL,
    key_name text NOT NULL,
    build_function text NOT NULL,
    options text NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT conditions_pkey PRIMARY KEY (condition_id),
    CONSTRAINT conditions_benefit_id_fk FOREIGN KEY (benefit_id)
        REFERENCES benefits (benefit_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);

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

CREATE TABLE scenarios (
    scenario_id serial NOT NULL,
    benefit_id integer NOT NULL,
    condition_map text NOT NULL,
    help text NOT NULL,
    lang_key text NOT NULL,
    active boolean NOT NULL DEFAULT FALSE
);

INSERT INTO scenarios (benefit_id, condition_map, help, lang_key, active) VALUES

-- ffcra
(1, '{"type":"N","agency":"A","books":"Y","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_a_books_y_reason_b', TRUE),
(1, '{"type":"N","agency":"A","books":"Y","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_n_agency_a_books_y_reason_q', TRUE),
(1, '{"type":"N","agency":"A","books":"Y","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_a_books_y_reason_s', TRUE),
(1, '{"type":"N","agency":"A","books":"Y","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_n_agency_a_books_y_reason_f', TRUE),
(1, '{"type":"N","agency":"A","books":"Y","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] YES (EITHER)
[reason] NONE', 'results_benefit_ffcra_type_n_agency_a_books_y_reason_n', FALSE),
(1, '{"type":"N","agency":"A","books":"N","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_a_books_n_reason_b', TRUE),
(1, '{"type":"N","agency":"A","books":"N","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_n_agency_a_books_n_reason_q', TRUE),
(1, '{"type":"N","agency":"A","books":"N","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_a_books_n_reason_s', TRUE),
(1, '{"type":"N","agency":"A","books":"N","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_n_agency_a_books_n_reason_f', TRUE),
(1, '{"type":"N","agency":"A","books":"N","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] YES
[books] NO
[reason] NONE', 'results_benefit_ffcra_type_n_agency_a_books_n_reason_n', FALSE),
(1, '{"type":"N","agency":"B","books":"Y","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_b_books_y_reason_b', TRUE),
(1, '{"type":"N","agency":"B","books":"Y","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_n_agency_b_books_y_reason_q', TRUE),
(1, '{"type":"N","agency":"B","books":"Y","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_b_books_y_reason_s', TRUE),
(1, '{"type":"N","agency":"B","books":"Y","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_n_agency_b_books_y_reason_f', TRUE),
(1, '{"type":"N","agency":"B","books":"Y","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] YES (EITHER)
[reason] NONE', 'results_benefit_ffcra_type_n_agency_b_books_y_reason_n', FALSE),
(1, '{"type":"N","agency":"B","books":"N","reason":"B"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_b_books_n_reason_b', TRUE),
(1, '{"type":"N","agency":"B","books":"N","reason":"Q"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_n_agency_b_books_n_reason_q', TRUE),
(1, '{"type":"N","agency":"B","books":"N","reason":"S"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_n_agency_b_books_n_reason_s', TRUE),
(1, '{"type":"N","agency":"B","books":"N","reason":"F"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_n_agency_b_books_n_reason_f', TRUE),
(1, '{"type":"N","agency":"B","books":"N","reason":"N"}', '[type] NANNY, HOUSE CLEANER, or HOME ATTENDANT
[agency] NO
[books] NO
[reason] NONE', 'results_benefit_ffcra_type_n_agency_b_books_n_reason_n', FALSE),
(1, '{"type":"E","agency":"A","books":"Y","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_a_books_y_reason_b', TRUE),
(1, '{"type":"E","agency":"A","books":"Y","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_e_agency_a_books_y_reason_q', TRUE),
(1, '{"type":"E","agency":"A","books":"Y","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_a_books_y_reason_s', TRUE),
(1, '{"type":"E","agency":"A","books":"Y","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_e_agency_a_books_y_reason_f', TRUE),
(1, '{"type":"E","agency":"A","books":"Y","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] YES (EITHER)
[reason] NONE', 'results_benefit_ffcra_type_e_agency_a_books_y_reason_n', FALSE),
(1, '{"type":"E","agency":"A","books":"N","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_a_books_n_reason_b', TRUE),
(1, '{"type":"E","agency":"A","books":"N","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_e_agency_a_books_n_reason_q', TRUE),
(1, '{"type":"E","agency":"A","books":"N","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_a_books_n_reason_s', TRUE),
(1, '{"type":"E","agency":"A","books":"N","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_e_agency_a_books_n_reason_f', TRUE),
(1, '{"type":"E","agency":"A","books":"N","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] YES
[books] NO
[reason] NONE', 'results_benefit_ffcra_type_e_agency_a_books_n_reason_n', FALSE),
(1, '{"type":"E","agency":"B","books":"Y","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_b_books_y_reason_b', TRUE),
(1, '{"type":"E","agency":"B","books":"Y","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_e_agency_b_books_y_reason_q', TRUE),
(1, '{"type":"E","agency":"B","books":"Y","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_b_books_y_reason_s', TRUE),
(1, '{"type":"E","agency":"B","books":"Y","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_e_agency_b_books_y_reason_f', TRUE),
(1, '{"type":"E","agency":"B","books":"Y","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] YES (EITHER)
[reason] NONE', 'results_benefit_ffcra_type_e_agency_b_books_y_reason_n', FALSE),
(1, '{"type":"E","agency":"B","books":"N","reason":"B"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] SELF-QUARANTINE AND SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_b_books_n_reason_b', TRUE),
(1, '{"type":"E","agency":"B","books":"N","reason":"Q"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] SELF-QUARANTINE', 'results_benefit_ffcra_type_e_agency_b_books_n_reason_q', TRUE),
(1, '{"type":"E","agency":"B","books":"N","reason":"S"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] SCHOOL CLOSED', 'results_benefit_ffcra_type_e_agency_b_books_n_reason_s', TRUE),
(1, '{"type":"E","agency":"B","books":"N","reason":"F"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] FAMILY QUARANTINE OR STAY AT HOME', 'results_benefit_ffcra_type_e_agency_b_books_n_reason_f', TRUE),
(1, '{"type":"E","agency":"B","books":"N","reason":"N"}', '[type] HOME HEALTH CARE WORKER
[agency] NO
[books] NO
[reason] NONE', 'results_benefit_ffcra_type_e_agency_b_books_n_reason_n', FALSE),

-- nys
(2, '{"agency":"A","books":"C","hours per week":"A","reason":"Q"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_a_books_c_hours_per_week_a_reason_q', TRUE),
(2, '{"agency":"A","books":"C","hours per week":"A","reason":"S"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_a_books_c_hours_per_week_a_reason_s', FALSE),
(2, '{"agency":"A","books":"C","hours per week":"A","reason":"N"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] NONE', 'results_benefit_nys_agency_a_books_c_hours_per_week_a_reason_n', FALSE),
(2, '{"agency":"A","books":"C","hours per week":"B","reason":"Q"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_a_books_c_hours_per_week_b_reason_q', TRUE),
(2, '{"agency":"A","books":"C","hours per week":"B","reason":"S"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_a_books_c_hours_per_week_b_reason_s', TRUE),
(2, '{"agency":"A","books":"C","hours per week":"B","reason":"N"}', '[agency] YES
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] NONE', 'results_benefit_nys_agency_a_books_c_hours_per_week_b_reason_n', TRUE),
(2, '{"agency":"A","books":"N","hours per week":"A","reason":"Q"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_a_books_n_hours_per_week_a_reason_q', TRUE),
(2, '{"agency":"A","books":"N","hours per week":"A","reason":"S"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_a_books_n_hours_per_week_a_reason_s', FALSE),
(2, '{"agency":"A","books":"N","hours per week":"A","reason":"N"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] NONE', 'results_benefit_nys_agency_a_books_n_hours_per_week_a_reason_n', FALSE),
(2, '{"agency":"A","books":"N","hours per week":"B","reason":"Q"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_a_books_n_hours_per_week_b_reason_q', TRUE),
(2, '{"agency":"A","books":"N","hours per week":"B","reason":"S"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_a_books_n_hours_per_week_b_reason_s', TRUE),
(2, '{"agency":"A","books":"N","hours per week":"B","reason":"N"}', '[agency] YES
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] NONE', 'results_benefit_nys_agency_a_books_n_hours_per_week_b_reason_n', TRUE),
(2, '{"agency":"B","books":"C","hours per week":"A","reason":"Q"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_b_books_c_hours_per_week_a_reason_q', TRUE),
(2, '{"agency":"B","books":"C","hours per week":"A","reason":"S"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_b_books_c_hours_per_week_a_reason_s', FALSE),
(2, '{"agency":"B","books":"C","hours per week":"A","reason":"N"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] UNDER 40
[reason] NONE', 'results_benefit_nys_agency_b_books_c_hours_per_week_a_reason_n', FALSE),
(2, '{"agency":"B","books":"C","hours per week":"B","reason":"Q"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_b_books_c_hours_per_week_b_reason_q', TRUE),
(2, '{"agency":"B","books":"C","hours per week":"B","reason":"S"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_b_books_c_hours_per_week_b_reason_s', TRUE),
(2, '{"agency":"B","books":"C","hours per week":"B","reason":"N"}', '[agency] NO
[books] YES, IN COMPLIANCE
[hours per week] 40 OR MORE
[reason] NONE', 'results_benefit_nys_agency_b_books_c_hours_per_week_b_reason_n', TRUE),
(2, '{"agency":"B","books":"N","hours per week":"A","reason":"Q"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_b_books_n_hours_per_week_a_reason_q', TRUE),
(2, '{"agency":"B","books":"N","hours per week":"A","reason":"S"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_b_books_n_hours_per_week_a_reason_s', FALSE),
(2, '{"agency":"B","books":"N","hours per week":"A","reason":"N"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] UNDER 40
[reason] NONE', 'results_benefit_nys_agency_b_books_n_hours_per_week_a_reason_n', FALSE),
(2, '{"agency":"B","books":"N","hours per week":"B","reason":"Q"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SELF-QUARANTINE OR FAMILY QUARANTINE', 'results_benefit_nys_agency_b_books_n_hours_per_week_b_reason_q', TRUE),
(2, '{"agency":"B","books":"N","hours per week":"B","reason":"S"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] SCHOOL CLOSED', 'results_benefit_nys_agency_b_books_n_hours_per_week_b_reason_s', TRUE),
(2, '{"agency":"B","books":"N","hours per week":"B","reason":"N"}', '[agency] NO
[books] PARTIALLY OR NO
[hours per week] 40 OR MORE
[reason] NONE', 'results_benefit_nys_agency_b_books_n_hours_per_week_b_reason_n', TRUE),

-- pssl
(3, '{"type":"N","length of employment":"U","hours per year":"A"}', '[type] NANNY or HOUSE CLEANER
[length of employment] LESS THAN ONE YEAR
[hours per year] UNDER 80', 'results_benefit_pssl_type_n_length_of_employment_u_hours_per_year_a', TRUE),
(3, '{"type":"N","length of employment":"U","hours per year":"B"}', '[type] NANNY or HOUSE CLEANER
[length of employment] LESS THAN ONE YEAR
[hours per year] 80 OR MORE', 'results_benefit_pssl_type_n_length_of_employment_u_hours_per_year_b', TRUE),
(3, '{"type":"N","length of employment":"O","hours per year":"A"}', '[type] NANNY or HOUSE CLEANER
[length of employment] ONE YEAR OR MORE
[hours per year] UNDER 80', 'results_benefit_pssl_type_n_length_of_employment_o_hours_per_year_a', TRUE),
(3, '{"type":"N","length of employment":"O","hours per year":"B"}', '[type] NANNY or HOUSE CLEANER
[length of employment] ONE YEAR OR MORE
[hours per year] 80 OR MORE', 'results_benefit_pssl_type_n_length_of_employment_o_hours_per_year_b', TRUE),
(3, '{"type":"H","length of employment":"U","hours per year":"A"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[length of employment] LESS THAN ONE YEAR
[hours per year] UNDER 80', 'results_benefit_pssl_type_h_length_of_employment_u_hours_per_year_a', TRUE),
(3, '{"type":"H","length of employment":"U","hours per year":"B"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[length of employment] LESS THAN ONE YEAR
[hours per year] 80 OR MORE', 'results_benefit_pssl_type_h_length_of_employment_u_hours_per_year_b', TRUE),
(3, '{"type":"H","length of employment":"O","hours per year":"A"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[length of employment] ONE YEAR OR MORE
[hours per year] UNDER 80', 'results_benefit_pssl_type_h_length_of_employment_o_hours_per_year_a', TRUE),
(3, '{"type":"H","length of employment":"O","hours per year":"B"}', '[type] HOME ATTENDANT or HOME HEALTH CARE WORKER
[length of employment] ONE YEAR OR MORE
[hours per year] 80 OR MORE', 'results_benefit_pssl_type_h_length_of_employment_o_hours_per_year_b', TRUE),

-- dwbor
(4, '{"length of employment":"U"}', '[length of employment] LESS THAN ONE YEAR', 'results_benefit_dwbor_length_of_employment_u', FALSE),
(4, '{"length of employment":"O"}', '[length of employment] ONE YEAR OR MORE', 'results_benefit_dwbor_length_of_employment_o', TRUE),

-- cares
(5, '{"books":"C","length of employment":"U"}', '[books] YES, IN COMPLIANCE
[length of employment] LESS THAN SIX MONTHS', 'results_benefit_cares_books_c_length_of_employment_u', TRUE),
(5, '{"books":"C","length of employment":"O"}', '[books] YES, IN COMPLIANCE
[length of employment] SIX MONTHS OR MORE', 'results_benefit_cares_books_c_length_of_employment_o', TRUE),
(5, '{"books":"N","length of employment":"U"}', '[books] PARTIALLY or NO
[length of employment] LESS THAN SIX MONTHS', 'results_benefit_cares_books_n_length_of_employment_u', TRUE),
(5, '{"books":"N","length of employment":"O"}', '[books] PARTIALLY or NO
[length of employment] SIX MONTHS OR MORE', 'results_benefit_cares_books_n_length_of_employment_o', TRUE);

CREATE TABLE prelaunch_sessions (
    session_id serial NOT NULL,
    token text NOT NULL,
    expires timestamp with time zone,
    CONSTRAINT prelaunch_sessions_pkey PRIMARY KEY (session_id)
);

