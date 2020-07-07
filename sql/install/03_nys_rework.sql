--
-- Reworks how NYS does eligibility (to use FFCRA eligibility as one of its conditions)
--

DROP TABLE IF EXISTS conditions;
CREATE TABLE conditions (
    condition_id serial NOT NULL,
    benefit_id integer NOT NULL,
    name text NOT NULL,
    key_name text NOT NULL,
    pass text NOT NULL DEFAULT 'first',
    build_function text NOT NULL,
    options text NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT conditions_pkey PRIMARY KEY (condition_id),
    CONSTRAINT conditions_benefit_id_fk FOREIGN KEY (benefit_id)
        REFERENCES benefits (benefit_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);

