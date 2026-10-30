

import subprocess
import sys
from pathlib import Path

from config import get_connection

BASE_DIR = Path(__file__).resolve().parent

def run_sql_file(filename):
    file_path = BASE_DIR / "sql" / filename
    sql_content = file_path.read_text(encoding="utf-8")

    connection = get_connection()

    try:
        with connection.cursor() as cursor:
            for statement in sql_content.split(";"):
                statement = statement.strip()

                if statement:
                    cursor.execute(statement)

        connection.commit()
        print(f"{filename} executed successfully!")

    except Exception as error:
        connection.rollback()
        print("Error:", error)
        raise

    finally:
        connection.close()


print("Starting Titanic ELT Pipeline...")

# Step 1: Extract and Load
subprocess.run(
    [sys.executable, str(BASE_DIR / "extract_load.py")],
    check=True
)

# Step 2: Transform
run_sql_file("02_transform.sql")

# Step 3: Analytics
run_sql_file("03_analytics_views.sql")

# Step 4: Data Quality
run_sql_file("04_data_quality.sql")

print("Titanic ELT Pipeline completed successfully!")