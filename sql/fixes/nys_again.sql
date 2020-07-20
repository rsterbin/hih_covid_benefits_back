
INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Meets Work Requirements?', 'work', 'first', 'workForNYS', '[{"letter":"A","answer":"AGENCY"},{"letter":"Y","answer":"YES"},{"letter":"N","answer":"NO"}]', 0 FROM benefits WHERE code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'On the Books?', 'books', 'first', 'splitBooksByCompliance', '[{"answer":"YES, IN COMPLIANCE","letter":"C"},{"answer":"PARTIALLY OR NO","letter":"N"}]', 1 FROM benefits WHERE code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Reason', 'reason', 'first', 'findReasonForNYS', '[{"letter":"Q","answer":"SELF-QUARANTINE"},{"letter":"F","answer":"FAMILY QUARANTINE"},{"letter":"N","answer":"NONE"}]', 2 FROM benefits WHERE code = 'nys';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Eligible for FFCRA?', 'ffcra', 'second', 'simple', '[{"letter":"Y","answer":"YES"},{"letter":"N","answer":"NO"}]', 3 FROM benefits WHERE code = 'nys';

