--
-- Adds the disclaimer
--

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES
    ('disclaimer_header', 'disclaimer', 'The header for the disclaimer', FALSE),
    ('disclaimer_text', 'disclaimer', 'The disclaimer text', TRUE),
    ('util_back_to_quiz', 'utilities', 'The text for a link that goes back to the quiz', FALSE),
    ('landing_disclaimer_link', 'landing', 'The text for the link to the disclaimer', FALSE),
    ('landing_disclaimer_title', 'landing', 'The title text for the disclaimer link', FALSE);

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'disclaimer_header';

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'disclaimer_text';

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'util_back_to_quiz';

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'landing_disclaimer_link';

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'landing_disclaimer_title';

