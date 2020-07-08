--
-- Fix the missing conditions
--

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Employee Type', 'type', 'first', 'splitTypeByEssential', '[{"letter":"N","answer":"NANNY, HOUSE CLEANER, or HOME ATTENDANT"},{"letter":"E","answer":"HOME HEALTH CARE WORKER"}]', 0
    FROM benefits WHERE code = 'ffcra';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Agency?', 'agency', 'first', 'simple', '[{"letter":"A","answer":"YES"},{"letter":"B","answer":"NO"}]', 1
    FROM benefits WHERE code = 'ffcra';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'On the Books?', 'books', 'first', 'splitBooksByTaxes', '[{"letter":"Y","answer":"YES (EITHER)"},{"letter":"N","answer":"NO"}]', 2
    FROM benefits WHERE code = 'ffcra';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Reason', 'reason', 'first', 'findReasonForFFCRA', '[{"letter":"B","answer":"SELF-QUARANTINE AND SCHOOL CLOSED"},{"letter":"Q","answer":"SELF-QUARANTINE"},{"letter":"S","answer":"SCHOOL CLOSED"},{"letter":"F","answer":"FAMILY QUARANTINE OR STAY AT HOME"},{"letter":"N","answer":"NONE"}]', 3
    FROM benefits WHERE code = 'ffcra';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Employee Type', 'type', 'first', 'splitTypeByHomeCare', '[{"answer":"NANNY or HOUSE CLEANER","letter":"N"},{"answer":"HOME ATTENDANT or HOME HEALTH CARE WORKER","letter":"H"}]', 0
    FROM benefits WHERE code = 'pssl';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Agency?', 'agency', 'first', 'simple', '[{"letter":"A","answer":"YES"},{"letter":"B","answer":"NO"}]', 1
    FROM benefits WHERE code = 'pssl';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Employment', 'employed', 'first', 'employedByYearAndHours', '[{"answer":"LESS THAN ONE YEAR or UNDER 80","letter":"U"},{"answer":"ONE YEAR OR MORE and OVER 80","letter":"O"}]', 2
    FROM benefits WHERE code = 'pssl';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Employment', 'length of employment', 'first', 'simple', '[{"answer":"LESS THAN ONE YEAR","letter":"U"},{"answer":"ONE YEAR OR MORE","letter":"O"}]', 0
    FROM benefits WHERE code = 'dwbor';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'On the Books?', 'books', 'first', 'splitBooksByCompliance', '[{"answer":"YES, IN COMPLIANCE","letter":"C"},{"answer":"PARTIALLY OR NO","letter":"N"}]', 0
    FROM benefits WHERE code = 'cares';

INSERT INTO conditions (benefit_id, name, key_name, pass, build_function, options, sort_order)
    SELECT benefit_id, 'Employment', 'length of employment', 'first', 'splitLengthByMonths', '[{"answer":"LESS THAN SIX MONTHS","letter":"U"},{"answer":"SIX MONTHS OR MORE","letter":"O"}]', 0
    FROM benefits WHERE code = 'cares';

