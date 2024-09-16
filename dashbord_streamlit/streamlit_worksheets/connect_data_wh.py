from dotenv import load_dotenv
import os
from snowflake.connector import connect
import pandas as pd

def query_job_listing(query="SELECT * FROM marts.mart_job_listings"):
    load_dotenv()


    
    with connect(
        user=os.getenv("SNOWFLAKE_USER"),
        password=os.getenv("SNOWFLAKE_PASSWORD"),
        account=os.getenv("SNOWFLAKE_ACCOUNT"),
        warehouse=os.getenv("SNOWFLAKE_WAREHOUSE"),
        database=os.getenv("SNOWFLAKE_DATABASE"),
        schema=os.getenv("SNOWFLAKE_SCHEMA"),
        role=os.getenv("SNOWFLAKE_ROLE")
    ) as conn:
        df = pd.read_sql(query, conn)
    return df