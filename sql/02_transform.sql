


USE titanic_elt_db;

-- Remove old table if it already exists
DROP TABLE IF EXISTS clean_passengers;

-- Create cleaned passenger table
CREATE TABLE clean_passengers AS
SELECT
    passengerid,
    survived,
    pclass,
    sex,

    -- Replace missing age with average age
    COALESCE(
        age,
        (SELECT AVG(age) FROM raw_titanic)
    ) AS age,

    sibsp,
    parch,
    fare,
    COALESCE(
        embarked,
        (
            SELECT embarked
            FROM raw_titanic
            WHERE embarked IS NOT NULL
            GROUP BY embarked
            ORDER BY COUNT(*) DESC
            LIMIT 1
        )
    ) AS embarked,

    `class`,
    who,
    adult_male,

    -- Replace missing deck with Unknown
    COALESCE(deck, 'Unknown') AS deck,

    COALESCE(embark_town, 'Unknown') AS embark_town,
    alive,
    alone

FROM raw_titanic;

-- Verify cleaned data
SELECT COUNT(*) AS total_clean_records
FROM clean_passengers;

SELECT *
FROM clean_passengers
LIMIT 10;

-- Check missing values
SELECT
    SUM(age IS NULL) AS missing_age,
    SUM(embarked IS NULL) AS missing_embarked,
    SUM(deck IS NULL) AS missing_deck
FROM clean_passengers;
