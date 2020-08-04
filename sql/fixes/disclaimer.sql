--
-- Adds the disclaimer
--

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES
    ('disclaimer_header', 'disclaimer', 'The header for the disclaimer', FALSE),
    ('disclaimer_text', 'disclaimer', 'The disclaimer text', TRUE);

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'disclaimer_header';

INSERT INTO translations (key_id, language, translation)
    SELECT key_id, 'en', 'PLACEHOLDER'
    FROM language_keys
    WHERE key = 'disclaimer_text';

