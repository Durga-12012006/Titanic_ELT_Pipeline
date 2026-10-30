# Titanic ELT Pipeline

## Project Overview
This project implements an ELT (Extract, Load, Transform) pipeline using Python and MySQL to process Titanic passenger data.

## Technologies Used
- Python
- MySQL
- PyMySQL
- SQL
- Git and GitHub

## Project Workflow
1. Extract passenger data from CSV.
2. Load 891 records into MySQL.
3. Transform data and handle missing values.
4. Create analytics views.
5. Perform data quality checks.

## Analytics
- Survival by Passenger Class
- Survival by Gender
- Survival by Age Group
- Survival by Embark Town

## Data Quality Results
- Total Records: 891
- Duplicate Passenger IDs: 0
- Missing Age Values: 0
- Missing Embarked Values: 0
- Missing Deck Values: 0

## How to Run
```bash
python run_elt.py
```

## Conclusion
The project successfully demonstrates data extraction, loading, transformation, analytics, and data quality validation using Python and MySQL.
