--
-- There was a mistake in the conditions for DWBoR.  This corrects it.
--

UPDATE conditions c
SET build_function = 'splitLengthByYear'
FROM benefits b
WHERE c.benefit_id = b.benefit_id
AND c.key_name = 'length of employment'
AND b.code = 'dwbor';

