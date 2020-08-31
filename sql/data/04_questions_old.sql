--
-- Adds the questions and answers to the database
--

-- Questions
INSERT INTO questions (code, full_lang_key, title_lang_key, help_lang_key, layout, sort_order) VALUES
('type', 'quiz_type_question', 'quiz_type_short', 'quiz_type_help', 'vert', 0),
('agency', 'quiz_agency_question', 'quiz_agency_short', NULL, 'horiz', 1),
('books', 'quiz_books_question', 'quiz_books_short', 'quiz_books_help', 'horiz', 2),
('hours per week', 'quiz_hours_per_week_question', 'quiz_hours_per_week_short', NULL, 'horiz', 3),
('length of employment', 'quiz_length_of_employment_question', 'quiz_length_of_employment_short', NULL, 'horiz', 4),
('hours per year', 'quiz_hours_per_year_question', 'quiz_hours_per_year_short', NULL, 'horiz', 5),
('self-quarantine', 'quiz_self_quarantine_question', 'quiz_self_quarantine_short', NULL, 'horiz', 6),
('family quarantine', 'quiz_family_quarantine_question', 'quiz_family_quarantine_short', 'quiz_family_quarantine_help', 'horiz', 7),
('stay at home', 'quiz_stay_at_home_question', 'quiz_stay_at_home_short', NULL, 'horiz', 8),
('school closed', 'quiz_school_closed_question', 'quiz_school_closed_short', NULL, 'horiz', 9);

-- Answers
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_type_answer_a', 0
    FROM questions WHERE code = 'type';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_type_answer_b', 1
    FROM questions WHERE code = 'type';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'C', 'quiz_type_answer_c', 2
    FROM questions WHERE code = 'type';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'D', 'quiz_type_answer_d', 3
    FROM questions WHERE code = 'type';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_agency_answer_a', 0
    FROM questions WHERE code = 'agency';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_agency_answer_b', 1
    FROM questions WHERE code = 'agency';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_books_answer_a', 0
    FROM questions WHERE code = 'books';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_books_answer_b', 1
    FROM questions WHERE code = 'books';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'C', 'quiz_books_answer_c', 2
    FROM questions WHERE code = 'books';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_hours_per_week_answer_a', 0
    FROM questions WHERE code = 'hours per week';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_hours_per_week_answer_b', 1
    FROM questions WHERE code = 'hours per week';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_length_of_employment_answer_a', 0
    FROM questions WHERE code = 'length of employment';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_length_of_employment_answer_b', 1
    FROM questions WHERE code = 'length of employment';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'C', 'quiz_length_of_employment_answer_c', 2
    FROM questions WHERE code = 'length of employment';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_hours_per_year_answer_a', 0
    FROM questions WHERE code = 'hours per year';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_hours_per_year_answer_b', 1
    FROM questions WHERE code = 'hours per year';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_self_quarantine_answer_a', 0
    FROM questions WHERE code = 'self-quarantine';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_self_quarantine_answer_b', 1
    FROM questions WHERE code = 'self-quarantine';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_family_quarantine_answer_a', 0
    FROM questions WHERE code = 'family quarantine';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_family_quarantine_answer_b', 1
    FROM questions WHERE code = 'family quarantine';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_stay_at_home_answer_a', 0
    FROM questions WHERE code = 'stay at home';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_stay_at_home_answer_b', 1
    FROM questions WHERE code = 'stay at home';

INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'A', 'quiz_school_closed_answer_a', 0
    FROM questions WHERE code = 'school closed';
INSERT INTO question_answers (question_id, letter, lang_key, sort_order)
    SELECT question_id, 'B', 'quiz_school_closed_answer_b', 1
    FROM questions WHERE code = 'school closed';

