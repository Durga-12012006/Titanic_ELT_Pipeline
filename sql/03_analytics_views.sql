

USE titanic_elt_db;

-- 1. Survival by Passenger Class
CREATE OR REPLACE VIEW vw_survival_by_class AS
SELECT
    pclass,
    COUNT(*) AS total_passengers,
    SUM(survived) AS survivors,
    ROUND(AVG(survived) * 100, 2) AS survival_percentage
FROM clean_passengers
GROUP BY pclass;


-- 2. Survival by Gender
CREATE OR REPLACE VIEW vw_survival_by_sex AS
SELECT
    sex,
    COUNT(*) AS total_passengers,
    SUM(survived) AS survivors,
    ROUND(AVG(survived) * 100, 2) AS survival_percentage
FROM clean_passengers
GROUP BY sex;


-- 3. Survival by Age Group
CREATE OR REPLACE VIEW vw_survival_by_age_group AS
SELECT
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_passengers,
    SUM(survived) AS survivors
FROM clean_passengers
GROUP BY age_group;


-- 4. Survival by Embark Town
CREATE OR REPLACE VIEW vw_survival_by_embark_town AS
SELECT
    embark_town,
    COUNT(*) AS total_passengers,
    SUM(survived) AS survivors,
    ROUND(AVG(survived) * 100, 2) AS survival_percentage
FROM clean_passengers
GROUP BY embark_town;