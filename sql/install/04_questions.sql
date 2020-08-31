--
-- Questions need a database representation
--

DROP TABLE IF EXISTS question_answers;
DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    question_id serial NOT NULL,
    code text NOT NULL,
    full_lang_key text NOT NULL,
    title_lang_key text NOT NULL,
    help_lang_key text,
    layout text NOT NULL DEFAULT 'horiz',
    sort_order integer NOT NULL,
    CONSTRAINT questions_pkey PRIMARY KEY (question_id),
    CONSTRAINT questions_code_uq UNIQUE (code),
    CONSTRAINT questions_layout_ck CHECK (layout IN ('horiz', 'vert')),
    CONSTRAINT questions_sort_uq UNIQUE (sort_order)
);

CREATE TABLE question_answers (
    answer_id serial NOT NULL,
    question_id integer NOT NULL,
    letter char(1) NOT NULL DEFAULT 'A',
    lang_key text NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT question_answers_pkey PRIMARY KEY (answer_id),
    CONSTRAINT question_answers_question_id_fk FOREIGN KEY (question_id)
        REFERENCES questions (question_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);

