



import csv
from config import get_connection

CSV_FILE = "titanic.csv"

create_table_sql = """
CREATE TABLE IF NOT EXISTS raw_titanic (
    passengerid INT PRIMARY KEY,
    survived INT,
    pclass INT,
    sex VARCHAR(20),
    age FLOAT NULL,
    sibsp INT,
    parch INT,
    fare FLOAT NULL,
    embarked VARCHAR(10),
    `class` VARCHAR(20),
    who VARCHAR(20),
    adult_male TINYINT,
    deck VARCHAR(10) NULL,
    embark_town VARCHAR(50),
    alive VARCHAR(10),
    alone TINYINT
)
"""

insert_sql = """
INSERT INTO raw_titanic (
    passengerid, survived, pclass, sex, age,
    sibsp, parch, fare, embarked, `class`,
    who, adult_male, deck, embark_town, alive, alone
)
VALUES (
    %(passengerid)s, %(survived)s, %(pclass)s, %(sex)s,
    %(age)s, %(sibsp)s, %(parch)s, %(fare)s,
    %(embarked)s, %(class_name)s, %(who)s, %(adult_male)s,
    %(deck)s, %(embark_town)s, %(alive)s, %(alone)s
)
"""

def to_int(value):
    return int(value) if value else None

def to_float(value):
    return float(value) if value else None

records = []

with open(CSV_FILE, "r", newline="", encoding="utf-8") as file:
    reader = csv.DictReader(file)

    for passenger_id, row in enumerate(reader, start=1):
        records.append({
            "passengerid": passenger_id,
            "survived": to_int(row["survived"]),
            "pclass": to_int(row["pclass"]),
            "sex": row["sex"],
            "age": to_float(row["age"]),
            "sibsp": to_int(row["sibsp"]),
            "parch": to_int(row["parch"]),
            "fare": to_float(row["fare"]),
            "embarked": row["embarked"] or None,
            "class_name": row["class"],
            "who": row["who"],
            "adult_male": 1 if row["adult_male"] == "True" else 0,
            "deck": row["deck"] or None,
            "embark_town": row["embark_town"] or None,
            "alive": row["alive"],
            "alone": 1 if row["alone"] == "True" else 0
        })

connection = get_connection()

try:
    with connection.cursor() as cursor:
        cursor.execute(create_table_sql)
        cursor.execute("TRUNCATE TABLE raw_titanic")
        cursor.executemany(insert_sql, records)

    connection.commit()
    print("Titanic data loaded successfully!")
    print("Total records:", len(records))

except Exception as error:
    connection.rollback()
    print("Error:", error)

finally:
    connection.close()
