--
-- Adds the disclaimer
--

INSERT INTO language_keys (key, section, help, markdown_allowed) VALUES
('disclaimer_header', 'disclaimer', 'The header for the disclaimer', FALSE),
('disclaimer_text', 'disclaimer', 'The disclaimer text', TRUE);
