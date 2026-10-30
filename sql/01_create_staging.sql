

USE titanic_elt_db;

DROP TABLE IF EXISTS stg_titanic;

CREATE TABLE stg_titanic AS
SELECT *
FROM raw_titanic;

SELECT COUNT(*) AS total_staging_records
FROM stg_titanic;
