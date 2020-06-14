DROP TABLE IF EXISTS prelaunch_sessions;
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

CREATE TABLE prelaunch_sessions (
    session_id serial NOT NULL,
    token text NOT NULL,
    expires timestamp with time zone,
    CONSTRAINT prelaunch_sessions_pkey PRIMARY KEY (session_id)
);

