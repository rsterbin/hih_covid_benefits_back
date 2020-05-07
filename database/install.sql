CREATE TABLE responses (
    response_id serial NOT NULL,
    visitor_id text NOT NULL,
    env_flag text NOT NULL,
    CONSTRAINT responses_pkey PRIMARY KEY (response_id)
);
CREATE INDEX responses_env_flag_idx ON responses (env_flag);

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
    env_flag text NOT NULL,
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
);
CREATE UNIQUE INDEX contacts_email_idx ON contacts(LOWER(email));
CREATE INDEX contacts_env_flag_idx ON contacts (env_flag);

CREATE TABLE raw_contacts (
    raw_id serial NOT NULL,
    email text NOT NULL,
    zip_code text,
    env_flag text NOT NULL,
    valid boolean,
    processed_at timestamp with time zone,
    CONSTRAINT raw_contacts_pkey PRIMARY KEY (raw_id)
);
CREATE INDEX raw_contacts_env_flag_idx ON raw_contacts (env_flag);

