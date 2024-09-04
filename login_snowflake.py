import os
import snowflake.connector
from dotenv import load_dotenv


# Load environment variables from .env file
load_dotenv()

# Connect to Snowflake
ctx = snowflake.connector.connect(
    USERNAME=os.getenv('SNOWFLAKE_USER'),
    PASSWORD=os.getenv('SNOWFLAKE_PASSWORD'),
    ACCOUNT=os.getenv('SNOWFLAKE_ACCOUNT'),
    ROLE=os.getenv('SNOWFLAKE_ROLE'),
    WAREHOUSE=os.getenv('SNOWFLAKE_WAREHOUSE'),
    DATABASE=os.getenv('SNOWFLAKE_DATABASE'),
    SCHEMA=os.getenv('SNOWFLAKE_SCHEMA')
)

cs = ctx.cursor()

try:
    # Execute a query
    cs.execute("SELECT CURRENT_VERSION()")
    one_row = cs.fetchone()
    print(f"Snowflake Version: {one_row[0]}")  # Should print the Snowflake version

finally:
    cs.close()
    ctx.close()
