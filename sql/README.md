

# Titanic ELT Pipeline

## Project Overview
This project implements an ELT (Extract, Load, Transform) pipeline using Python and MySQL. It processes the Titanic passenger dataset, loads raw data into MySQL, cleans missing values, and creates analytics views.

## Technologies Used
- Python
- MySQL
- MySQL Workbench
- PyMySQL
- CSV module
- VS Code
- Git and GitHub

## Project Workflow

1. **Extract:** Read Titanic dataset from a CSV file using Python.
2. **Load:** Load 891 passenger records into the MySQL `raw_titanic` table.
3. **Transform:** Handle missing values and create the `clean_passengers` table.
4. **Analytics:** Create SQL views for survival analysis.
5. **Data Quality:** Check total records, duplicate IDs, invalid values, and missing values.

## Analytics Views
- `vw_survival_by_class`
- `vw_survival_by_sex`
- `vw_survival_by_age_group`
- `vw_survival_by_embark_town`

## Project Structure

```text
Titanic_ELT_Pipeline/
│
├── sql/
│   ├── 01_create_staging.sql
│   ├── 02_transform.sql
│   ├── 03_analytics_views.sql
│   └── 04_data_quality.sql
│
├── config.py
├── extract_load.py
├── run_elt.py
├── titanic.csv
├── requirements.txt
└── README.md
```

## How to Run

1. Clone or download this repository.
2. Create and activate a Python virtual environment.
3. Install dependencies:

```bash
pip install -r requirements.txt
```

4. Create the MySQL database:

```sql
CREATE DATABASE titanic_elt_db;
```

5. Configure MySQL connection environment variables:
   - `DB_HOST`
   - `DB_PORT`
   - `DB_USER`
   - `DB_PASSWORD`
   - `DB_NAME`

6. Run the pipeline:

```bash
python run_elt.py
```

## Data Quality Results
- Total records loaded: 891
- Duplicate passenger IDs: 0
- Missing age values after cleaning: 0
- Missing embarked values after cleaning: 0
- Missing deck values after cleaning: 0

## Conclusion
The Titanic ELT Pipeline successfully loads, transforms, and analyzes passenger data using Python and MySQL. It demonstrates data integration, data cleaning, SQL analytics, and data quality validation.