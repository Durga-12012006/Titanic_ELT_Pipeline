

USE titanic_elt_db;

-- Check total records
SELECT COUNT(*) AS total_records
FROM clean_passengers;

-- Check duplicate passenger IDs
SELECT passengerid, COUNT(*) AS duplicate_count
FROM clean_passengers
GROUP BY passengerid
HAVING COUNT(*) > 1;

-- Check invalid survival values
SELECT *
FROM clean_passengers
WHERE survived NOT IN (0, 1);

-- Check missing values
SELECT
    SUM(age IS NULL) AS missing_age,
    SUM(embarked IS NULL) AS missing_embarked,
    SUM(deck IS NULL) AS missing_deck
FROM clean_passengers;