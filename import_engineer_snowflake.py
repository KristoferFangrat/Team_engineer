import snowflake.connector

connection = snowflake.connector.connect(
    account='xs66603.west-europe.azure',
    user='kristoffer_user',
    password='password123',
    warehouse='DEV_WH',
    database='ENGINEER_ADS',
    schema='Staging'
)

print("Connection successful")
connection.close()