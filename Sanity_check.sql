# Look at data after Python Load
SELECT * 
FROM claims
LIMIT 50;

# Check that data was loaded accurately
SELECT COUNT(*)
FROM claims
;
-- All instances were loaded

# Look at Schema
DESCRIBE claims;

# Check for duplicates
SELECT claim_id, COUNT(*)
FROM claims
GROUP BY claim_id
HAVING COUNT(*) > 1
;
-- there are no duplicate values

# Check for null values
SELECT *
FROM claims
WHERE claim_id IS NULL
OR patient_id IS NULL
OR submission_date IS NULL
OR claim_status IS NULL
OR insurance_provider IS NULL;
-- No null outside of denial