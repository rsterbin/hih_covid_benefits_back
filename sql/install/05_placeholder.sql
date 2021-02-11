--
-- Add a new language key for the placeholder box
--

INSERT INTO language_keys (key, section, help, markdown_allowed, token_replace) VALUES ('results_new_legislation_placeholder', 'results', 'This is a highlighted box on the results page that should let the user know that new federal legislation is coming, so while their employee cannot access some of the benefits described here, there will be replacements in the near future', TRUE, 'employee_type');

INSERT INTO translations (key_id, language, translation)
SELECT key_id, 'en', E'**New federal legislation is coming!** Many of the COVID-specific benefits described below expired on December 31st of last year.  We''ve left them for review here, and we''ll update the tool with the new benefits as soon as we can.' FROM language_keys WHERE key = 'results_new_legislation_placeholder';

